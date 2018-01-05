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

        # If file/folder exists, back it up
        [[ -L $DST ]] && mv $DST $BACKUPS
        [[ -f $DST ]] && mv $DST $BACKUPS
        [[ -d $DST ]] && cp -rf $DST $BACKUPS

        # Create new symlink
        ln -s $SRC $DST
        [ $? -ne 0 ] && error && continue

        ok
    done

    # Update .bashrc with correct dotfiles location if not set
    sed -i "s,DOTFILES=.*,DOTFILES=\"$DOTFILES\",g" "$PACKAGE_FILES/bashrc"
}

function _uninstall() {
    return
}
