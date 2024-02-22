# Dotfiles

Many people are posting their configuration files on GitHub, so here are mine.
Keep in mind that these dotfiles are for my own personal use, so occasional
breakage may occur.

![Screenshot of terminal in active use](./screenshot.png)

## Features

This repository contains my [dotfiles](https://dotfiles.github.io/), along with
a tiny package manager for managing and deploying them across both personal and
work machines.

This little package manager is written in pure Bash and relies on [GNU Stow]
under the hood. The dotfiles themselves are organized into small "packages"
which bundle together:

* Base configuration, if any
* OS-specific configuration, if any
* Profile-specific configuration, if any (e.g. `work` or `home-server`)
* Scriptable pre/post transaction hooks

Packages are defined according to a [simple, declarative, and self-describing
format][pkgdocs]. Using the included `dotfiles` command, you can pick and
choose which dotfiles to install. For instance:

```bash
dotfiles install                # Installs all dotfiles compatible with your OS
dotfiles install bash+work fzf  # Installs `bash` configs (work profile) and `fzf` configs
```

[GNU Stow]: https://www.gnu.org/software/stow/
[pkgdocs]: ./PACKAGES.md

## Installation

> **Warning**
> Please audit the `bootstrap` script first before executing the commands below!

```sh
bash <(curl https://raw.githubusercontent.com/ebkalderon/dotfiles/master/bootstrap -sSf)
cd ~/.dotfiles
./dotfiles install
```

The `bootstrap` script from the snippet above performs a few pre-setup tasks
(ensuring `git`, `stow`, and `bash` are installed and fully up-to-date) and
`./dotfiles install` actually deploys the dotfiles to your `$HOME` directory.

A short summary of changes and an interactive confirmation prompt are shown
before any action is taken.

### Testing in sandbox

To try my dotfiles in a sandbox environment without affecting your existing
setup, run the following commands:

```sh
bash <(curl https://raw.githubusercontent.com/ebkalderon/dotfiles/master/bootstrap -sSf)
cd ~/.dotfiles

# Create sandbox $HOME directory & install dotfiles there
mkdir .fake-home
HOME=$(realpath -e .fake-home)
./dotfiles install

# See what `./dotfiles install` did to sandbox $HOME dir
tree -a .fake-home
```

This deploys the dotfiles into `~/.dotfiles/.fake-home/` instead of your actual
`$HOME` directory, leaving your existing dotfiles completely unchanged. If you
like my configuration, you may choose to deploy them (all or in part) into your
real `$HOME` directory. Otherwise, the `.fake-home` directory can be safely
discarded.

## Uninstallation

To remove one or more specific dotfiles from your system:

```sh
./dotfiles uninstall gnupg neovim
```

To remove _all_ of my dotfiles your system:

```sh
./dotfiles uninstall
```

A short summary of changes and an interactive confirmation prompt are shown
before any action is taken.

## Compatibility

Compatible with Arch Linux, Linux Mint, and macOS.

## License

These dotfiles are distributed as free and open source software under the terms
of the [MIT License](./LICENSE).
