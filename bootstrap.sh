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

# Get base directory where dotfiles were installed
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
    ln -s $DIR/$SRC $DST
done

# Update `.bashrc` with correct dotfiles base dir
sed -i "s,DIR=.*,DIR=\"$DIR\",g" ~/.bashrc

# Create needed empty folders
mkdir -p ~/.config/nvim/{backup,undo}
mkdir -p ~/.mpd/playlists

# Download and install NeoVim plugins
nvim +PlugInstall +UpdateRemotePlugins +qall

