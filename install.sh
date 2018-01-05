#!/bin/bash

# Get absolute location of `.dotfiles` directory
export DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load package helper functions
for LIB in $DOTFILES/lib/*; do
    . $LIB
done

# Create backup directory
BACKUPS_DIR="$HOME/.dotfiles_old/$(date +"%Y.%m.%d.%H.%M.%S")"
mkdir -p "$BACKUPS_DIR"

# Install all packages
PACKAGES="$(find $DOTFILES/packages/ -name "package.sh" -print | sort)"
for PACKAGE in $PACKAGES; do
    # Set some useful variables accessible to each package
    PACKAGE_NAME="$(basename $(dirname $PACKAGE))"
    PACKAGE_FILES="$(dirname $PACKAGE)/files"
    BACKUPS="$BACKUPS_DIR/$PACKAGE_NAME"

    # Create backup directory for package
    mkdir -p "$BACKUPS_DIR/$PACKAGE_NAME"

    # Source the package and install
    . $PACKAGE
    echo "[[ $DESCRIPTION ]]"
    _install
    echo
done

echo -n "Done! "
success
exit 0
