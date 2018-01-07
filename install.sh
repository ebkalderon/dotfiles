#!/bin/bash

# Get absolute location of `.dotfiles` directory
export DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load package helper functions
for lib in ${DOTFILES}/lib/*; do
  source ${lib}
done

readonly backup_dir="${HOME}/.dotfiles_old/$(date +'%Y.%m.%d.%H.%M.%S')"

# Install all packages
packages="$(find "${DOTFILES}/packages/" -name 'package.sh' -print | sort)"
for package in ${packages}; do
  # Set some useful variables accessible to each package
  DESCRIPTION="installing package..."
  PACKAGE_NAME="$(basename "$(dirname "${package}")")"
  PACKAGE_FILES="$(dirname "${package}")/files"
  BACKUPS="${backup_dir}"/"${PACKAGE_NAME}"

  # Create backup directory for package
  mkdir -p "${BACKUPS}"

  # Load the package and install
  source "${package}"
  echo "[[ ${DESCRIPTION} ]]"
  _install
  echo
done

echo -n 'Done! '
success
exit 0
