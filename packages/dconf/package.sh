#!/bin/bash

DESCRIPTION='applying dconf settings...'

readonly SUFFIX='.dconf'

_install() {
  local files=$(ls -d "${PACKAGE_FILES}"/*${SUFFIX})

  for file in ${files}; do
    # Get the basename of the file, trim the extension suffix.
    local name="${file##*/}"
    name="${name%.dconf}"
    # Replace all dots with forward slashes, and add leading/trailing slashes.
    local schema="/${name//./\/}/"
    echo -n "loading settings for ${schema}... "

    if ! dconf dump "${schema}" > "${BACKUPS}/${file##*/}"; then
      error
      continue
    fi

    if ! dconf load "${schema}" < "${file}"; then
      error
      continue
    fi

    ok
  done

  return 0
}

_uninstall() {
  return 0
}
