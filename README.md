# Dotfiles

Many people are posting their configuration files on GitHub, so here are mine.
Keep in mind that these dotfiles are for my own personal use, so occasional
breakage may occur.

![Screenshot of terminal in active use](./screenshot.png)

## Features

This repository organizes all of the included functionality into self-contained
bundles of files and scripts called [_packages_](./packages/README.md). Each
package is built to handle a specific task, e.g. symlinking dotfiles in the home
directory, installing programs, customizing the look and feel, etc. Using the
included `dotfiles` command, you can pick and choose which packages to install.

TODO: Consolidate shell scripts into unified `dotfiles` script, add `dconf` settings, list packages below

## Installation

> **Warning**
> Please audit the `bootstrap` script first before executing the commands below!

```sh
bash <(curl https://raw.githubusercontent.com/ebkalderon/dotfiles/rewrite-dotfiles/bootstrap -sSf)
cd ~/.dotfiles
./install
```

## Updating

To grab the latest version while preserving uncommitted local changes, run:

```sh
dotfiles update
```

## Compatibility

Compatible with Arch Linux, Linux Mint, and macOS.

## License

These dotfiles and bootstrap scripts are distributed as free and open source
software under the terms of the [MIT License](./LICENSE).
