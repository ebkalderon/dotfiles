#!/bin/bash

# Get absolute location of `.dotfiles` directory
export DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install all packages
for PACKAGE in $DOTFILES/packages/*.sh; do
    . $PACKAGE
    install
done
