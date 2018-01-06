#!/bin/bash

DESCRIPTION="applying dconf settings..."
SUFFIX=".dconf"

function _install() {
    FILES=$(ls -d $PACKAGE_FILES/*$SUFFIX)
    for FILE in $FILES; do
        SCHEMA=$(echo "/$(basename $FILE)/" | sed "s/${SUFFIX}//g; s/\./\//g")
        echo -n "loading settings for $SCHEMA... "

        dconf dump $SCHEMA > "$BACKUPS/$(basename $FILE)"
        [[ $? -ne 0 ]] && error && continue

        dconf load $SCHEMA < "$FILE"
        [[ $? -ne 0 ]] && error && continue

        ok
    done
}

function _uninstall() {
    return
}
