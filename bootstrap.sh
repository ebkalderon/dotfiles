#!/bin/bash

# Build up list of dotfiles to install
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES="bash_profile config/nvim gitconfig mpd ncmpcpp tmux.conf toprc"

# Create a backup directory to store old dotfiles
mkdir -p ~/.dotfiles_old

# Back up .bashrc, if it exists, to avoid conflicts
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.dotfiles_old/

for FILE in $DOTFILES; do
    # If file exists, back it up
    [ -f ~/.$FILE ] && mv ~/.$FILE ~/.dotfiles_old/

    # If old symlink exits, delete it
    [ -L ~/.$FILE ] && rm ~/.$FILE

    # Create new symlink
    ln -s $DIR/$FILE ~/.$FILE
done

# Update `bash_profile` with correct dotfiles base dir
sed -i "s,DIR=.*,DIR=\"$DIR\",g" $DIR/bash_profile
