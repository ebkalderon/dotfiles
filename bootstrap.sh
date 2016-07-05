#!/bin/bash

# Build up list of dotfiles to install
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES="bash_profile bashrc config/nvim gitconfig mpd ncmpcpp profile tmux.conf toprc"

# Create a backup directory to store old dotfiles
mkdir -p ~/.dotfiles_old

for FILE in $DOTFILES; do
    # If old symlink exits, delete it
    [[ -L ~/.$FILE ]] && rm ~/.$FILE

    # If file exists, back it up
    [[ -f ~/.$FILE ]] && mv ~/.$FILE ~/.dotfiles_old/

    # Create new symlink
    ln -s $DIR/$FILE ~/.$FILE
done

# Update `bashrc` with correct dotfiles base dir
sed -i "s,DIR=.*,DIR=\"$DIR\",g" $DIR/bashrc

# Apply shell configuration
. ~/.bashrc

# Download and install NeoVim plugins
nvim +PlugInstall +UpdateRemotePlugins +qall

