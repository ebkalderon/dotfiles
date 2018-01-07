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

DESCRIPTION="adjusting trim length of plumbuses..."

# Installs the package
_install() {
  # ...
}

# Uninstalls the package
_uninstall() {
  # ...
}

# Executes before `dotfiles update` is run
_pre_update() {
  # ...
}

# Executes after `dotfiles update` is run
_post_update() {
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
