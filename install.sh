#!/bin/bash

# Get absolute location of `.dotfiles` directory
export DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load package helper functions
for lib in ${DOTFILES}/lib/*; do
  source ${lib}
done

# Install all packages
for package in ${PACKAGES}; do
  _load_package "${package}"

  # Create backup directory for package
  mkdir -p "${BACKUPS}"

  # Load the package and install
  source ${package}
  echo "[[ ${DESCRIPTION} ]]"
  _install
  echo
done

echo -n 'Done! '
success
exit 0
