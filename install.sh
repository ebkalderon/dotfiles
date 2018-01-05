#!/bin/bash

# Get absolute location of `.dotfiles` directory
export DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load package helper functions
. $DOTFILES/packages/functions

# Install all packages
PACKAGES="$(find $DOTFILES/packages/ -name "package.sh" -print | sort)"
for PACKAGE in $PACKAGES; do
    # Set some base variables
    PACKAGE_FILES="$(dirname $PACKAGE)/files"

    # Source the package and install
    . $PACKAGE
    echo "[[ $DESCRIPTION ]]"
    _install
    echo
done

echo -n "Done! "
success
exit 0
