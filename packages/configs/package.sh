#!/bin/bash

DESCRIPTION="applying dotfiles..."

function _install() {
    declare -A LINKS

    # Build up a list of symlinks to make
    for FILE in $PACKAGE_FILES/*; do
        if [[ $(basename $FILE) == config ]]; then
            for SUBFILE in $PACKAGE_FILES/config/*; do
                LINKS["$SUBFILE"]=".config/$(basename $SUBFILE)"
            done
        else
            LINKS["$FILE"]=".$(basename $FILE)"
        fi
    done

    # Create the symlinks in the appropriate places
    for SRC in ${!LINKS[@]}; do
        DST="$HOME/${LINKS[$SRC]}"
        echo -n "applying $DST... "

        # If old symlink exits, delete it
        [[ -L $DST ]] && rm $DST

        # If file/folder exists, back it up
        [[ -f $DST ]] && mv $DST ~/.dotfiles_old/
        [[ -d $DST ]] && cp -rf $DST ~/.dotfiles_old/

        # Create new symlink
        ln -sr $SRC $DST 2> /dev/null
        if [ $? -ne 0 ]; then
           ln -s $SRC $DST
        fi

        ok
    done

    # Update .bashrc with correct dotfiles location if not set
    sed -i "s,DOTFILES=.*,DOTFILES=\"$DOTFILES\",g" "$PACKAGE_FILES/bashrc"
}

function _uninstall() {
    return
}
