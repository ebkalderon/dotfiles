#!/bin/bash

# Build up list of dotfiles to install
declare -A FILES
FILES["bash/bash_profile"]=".bash_profile"
FILES["bash/bashrc"]=".bashrc"
FILES["bash/inputrc"]=".inputrc"
FILES["bash/profile"]=".profile"
FILES["gdbinit"]=".gdbinit"
FILES["gitconfig"]=".gitconfig"
FILES["mpd"]=".mpd"
FILES["ncmpcpp"]=".ncmpcpp"
FILES["nvim"]=".config/nvim"
FILES["tmux.conf"]=".tmux.conf"
FILES["toprc"]=".toprc"

# Get absolute location of `.dotfiles` directory
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create a backup directory to store old dotfiles
mkdir -p ~/.dotfiles_old

for SRC in "${!FILES[@]}"; do
    DST=~/${FILES[$SRC]}
    
    # If old symlink exits, delete it
    [[ -L $DST ]] && rm $DST

    # If file/folder exists, back it up
    [[ -f $DST ]] && mv $DST ~/.dotfiles_old/
    [[ -d $DST ]] && mv $DST ~/.dotfiles_old/

    # Create new symlink
    ln -sr "$DIR/$SRC" $DST 2> /dev/null
    if [ $? -ne 0 ]; then
        ln -s "$DIR/$SRC" $DST
    fi
done

# Update .bashrc with correct dotfiles location if not set
sed -i "s,DOTFILES=.*,DOTFILES=\"$DIR\",g" "$DIR/bash/bashrc"

# Create needed empty folders
mkdir -p ~/.local/share/nvim/{backup,undo}
mkdir -p ~/.mpd/playlists

# Download and install Neovim plugins
[[ ! -d ~/.config/nvim/plugged ]] && nvim +PlugInstall +qall
