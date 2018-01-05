#!/bin/bash

SUFFIX=".dconf"

function install() {
    FILES=$(ls -d $DOTFILES/packages/dconf/*$SUFFIX)
    for FILE in $FILES; do
        SCHEMA=$(echo "/$(basename FILE)/" | sed "s/\./\//g" | sed "s/\$SUFFIX//g")
        dconf dump $SCHEMA > "$HOME/.dotfiles_old/$(basename $FILE)"
        dconf load $SCHEMA < "$FILE"
    done
}

function uninstall() {
    return
}
