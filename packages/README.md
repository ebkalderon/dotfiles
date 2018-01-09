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

## Example _package_ script

```bash
#!/bin/bash

DESCRIPTION='Package for maintaining plumbuses.'
INSTALL_MSG='Adjusting direction of flumberboozle...'
UNINSTALL_MSG='Restoring flumberboozle direction...'

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

## Available variables

Name              | Description                          | Default Value
------------------|--------------------------------------|------------------------------------
`BACKUPS`         | Absolute path to `.dotfiles_old`.    | `${HOME}/.dotfiles_old`
`DOTFILES`        | Absolute path to `.dotfiles`.        | `${HOME}/.dotfiles`
`PACKAGE_BACKUPS` | Directory to store backup files.     | `${BACKUPS}/<timestamp>/<name>`
`PACKAGE_NAME`    | Name of the package being installed. | `<name>`
`PACKAGE_FILES`   | Directory with files to (un)install. | `${DOTFILES}/packages/<name>/files`
