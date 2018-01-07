#!/bin/bash

DESCRIPTION='applying dotfiles...'

_install() {
  declare -A links

  # Build up a list of symlinks to make
  for file in ${PACKAGE_FILES}/*; do
    if [[ "${file##*/}" = config ]]; then
      for subfile in ${PACKAGE_FILES}/config/*; do
        links[${subfile}]=".config/${subfile##*/}"
      done
    else
      links[${file}]=".${file##*/}"
    fi
  done

  # Create the symlinks in the appropriate places
  for src in "${!links[@]}"; do
    local dest="${HOME}/${links[$src]}"
    echo -n "applying ${dest}... "

    # If file/folder exists, back it up
    if [[ -f ${dest} ]] || [[ -L ${dest} ]]; then
      mv "${dest}" "${BACKUPS}"
    elif [[ -d ${dest} ]]; then
      cp -rf "${dest}" "${BACKUPS}/"
    fi

    # Create new symlink
    if ! ln -s "${src}" "${dest}"; then
      error
      continue
    fi

    ok
  done

  # Update .bashrc with correct dotfiles location if not set
  sed -i "s,DOTFILES=.*,DOTFILES=\"${DOTFILES}\",g" "${PACKAGE_FILES}/bashrc"

  return 0
}

_uninstall() {
  return 0
}

_pre_update() {
  # Reset the DOTFILES variable in .bashrc with the default value to avoid
  # potential merge conflicts
  git -C "${DOTFILES}" checkout packages/configs/files/bashrc --quiet
  return $?
}

_post_update() {
  source ~/.bashrc
  return $?
}
