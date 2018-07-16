# Packages

_TODO: Intro and design description_

## File structure

```
- <name>/
  - files/         Local files belonging to the package
    - ...
  - .gitignore     Files to ignore for items in `files/`
  - package     Package install/uninstall script
```

## Example `package` script

```bash
#!/bin/bash

DESCRIPTION='Package for maintaining plumbuses.'
INSTALL_MSG='Adjusting direction of flumberboozle...'
UNINSTALL_MSG='Restoring flumberboozle direction...'
PLATFORMS='ARCH UBUNTU !MACOS'

# Installs the package
install() {
  # ...
}

# Uninstalls the package
uninstall() {
  # ...
}

# Executes before `dotfiles update` is run
pre_update() {
  # ...
}

# Executes after `dotfiles update` is run
post_update() {
  # ...
}
```

## Format of `PLATFORMS` string

This variable is a space-delimited string of keywords, each representing a
supported platform. Platform names can be prefixed with a `!` to exclude them
and mark them explicitly as unsupported. If left unspecified in the package
script, the default value of `PLATFORMS` is assumed to be `'ANY'`.

Keyword   | Meaning
----------|------------------------------------------------
`ANY`     | Supports all platforms.
`ARCH`    | Supports Arch Linux and derivatives.
`DEBIAN`  | Supports Debian and derivatives.
`FREEBSD` | Supports FreeBSD and derivatives.
`MACOS`   | Supports macOS version 10.0 or later.
`REDHAT`  | Supports RHEL, CentOS, Fedora, and derivatives.
`UBUNTU`  | Supports Ubuntu and derivatives.

## Available constants

These constants are made available to each package script when run.

Name              | Description                          | Default Value
------------------|--------------------------------------|------------------------------------
`BACKUPS`         | Absolute path to `.dotfiles_old`.    | `${HOME}/.dotfiles_old`
`DOTFILES`        | Absolute path to `.dotfiles`.        | `${HOME}/.dotfiles`
`PACKAGE_BACKUPS` | Directory to store backup files.     | `${BACKUPS}/<timestamp>/<name>`
`PACKAGE_NAME`    | Name of the package being installed. | `<name>`
`PACKAGE_FILES`   | Directory with files to (un)install. | `${DOTFILES}/packages/<name>/files`
