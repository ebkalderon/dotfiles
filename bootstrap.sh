#!/bin/bash

# Build up list of dotfiles to install
declare -A DOTFILES
DOTFILES["gitconfig"]=".gitconfig"
DOTFILES["mpd"]=".mpd"
DOTFILES["ncmpcpp"]=".ncmpcpp"
DOTFILES["nvim"]=".config/nvim"
DOTFILES["shell/bash_profile"]=".bash_profile"
DOTFILES["shell/bashrc"]=".bashrc"
DOTFILES["shell/profile"]=".profile"
DOTFILES["tmux.conf"]=".tmux.conf"
DOTFILES["toprc"]=".toprc"

# Get absolute location of `.dotfiles` directory
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create a backup directory to store old dotfiles
mkdir -p ~/.dotfiles_old

for SRC in ${!DOTFILES[@]}; do
    DST=~/${DOTFILES[$SRC]}
    
    # If old symlink exits, delete it
    [[ -L $DST ]] && rm $DST

    # If file exists, back it up
    [[ -f $DST ]] && mv $DST ~/.dotfiles_old/

    # Create new symlink
    ln -sr $DIR/$SRC $DST
    if [ $? -ne 0 ]; then
        ln -s $DIR/$SRC $DST
    fi
done

# Update these files with correct dotfiles location
sed -i "s,local DIR=.*,local DIR=\"$DIR\",g" $DIR/bash/functions.sh
sed -i "s,DIR=.*,DIR=\"$DIR\",g" $DIR/shell/bashrc

# Create needed empty folders
mkdir -p ~/.config/nvim/{backup,undo}
mkdir -p ~/.mpd/playlists

# Download and install Neovim plugins
nvim +PlugInstall +qall

