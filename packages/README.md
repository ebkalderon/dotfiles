# Packages

_TODO: Intro and design description_

## File structure

```
- <name>/
  - files/         Local files belonging to the package
    - ...
  - .gitignore     Files to ignore for items in `files/`
  - package.sh     Package install/uninstall script
```

## Example _package.sh_ script

```bash
#!/bin/bash

DESCRIPTION="adjusting trim length of plumbuses..."

# Installs the package
function _install() {
    # ...
}

# Uninstalls the package
function _uninstall() {
    # ...
}
```

## Available variables

Name            | Description                          | Default Value
----------------|--------------------------------------|----------------------------------
`BACKUPS`       | Absolute path to `.dotfiles_old`.    | `$HOME/.dotfiles_old`
`DOTFILES`      | Absolute path to `.dotfiles`.        | `$HOME/.dotfiles`
`PACKAGE_NAME`  | Name of the package being installed. | `<name>`
`PACKAGE_FILES` | Directory with files to (un)install. | `$DOTFILES/packages/<name>/files`
