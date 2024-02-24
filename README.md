# Dotfiles

Many people are posting their configuration files on GitHub, so here are mine.
Keep in mind that these dotfiles are for my own personal use, so occasional
breakage may occur.

![Screenshot of terminal in active use](./screenshot.png)

## Overview

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
dotfiles list                   # Lists all available dotfiles and profiles
dotfiles install bash+work fzf  # Installs `bash` configs (work profile) and `fzf` configs
dotfiles install                # Installs _all_ dotfiles compatible with your OS
```

[GNU Stow]: https://www.gnu.org/software/stow/
[pkgdocs]: ./PACKAGES.md

## Highlights

* **Supports Arch Linux, Linux Mint, and macOS**
* Colorful `bash` prompt, displays the current [git]/[svn] repo branch
* Fuzzy-find all the things with [fzf] + [ripgrep] (files, `bash` history,
  `man` pages, `git` branches, and more)
* Custom [Neovim] config with LSP and [telescope.nvim] for fuzzy-finding
* [tmux] as terminal multiplexer and session manager ([with custom theme])
* [mpd] and [ncmpcpp] for playing music in the terminal
* Beautiful [Monokai] color palette for everything :heart_eyes:

[git]: https://git-scm.com/
[svn]: https://subversion.apache.org/ 
[fzf]: https://github.com/junegunn/fzf
[ripgrep]: https://github.com/BurntSushi/ripgrep
[Neovim]: https://neovim.io/
[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim
[tmux]: https://github.com/tmux/tmux
[with custom theme]: https://github.com/ebkalderon/tmux-monokai-classic
[mpd]: https://www.musicpd.org/
[ncmpcpp]: https://github.com/ncmpcpp/ncmpcpp
[Monokai]: https://monokai.nl/

## Install

> **Warning** Please audit the [`bootstrap`](./bootstrap) script first before
> executing the commands below!

```sh
bash <(curl https://raw.githubusercontent.com/ebkalderon/dotfiles/master/bootstrap -sSf)
cd ~/.dotfiles
./dotfiles install
```

The `bootstrap` script from the snippet above performs a few pre-setup tasks
(ensuring `git`, `stow`, and `bash` are installed and fully up-to-date) and
`./dotfiles install` actually deploys the dotfiles to your `~` directory.

A short summary of changes and an interactive confirmation prompt are shown
before any action is taken.

### Install alongside existing

If you'd like to give my dotfiles a try, but don't want to replace your
existing setup, you can override `$HOME` before running `./dotfiles install`:

```sh
cd ~/.dotfiles
mkdir .sandbox
env HOME=~/.dotfiles/.sandbox ./dotfiles install
```

This will deploy everything into the `~/.dotfiles/.sandbox/` directory instead
of `~`, leaving your existing setup completely untouched. If you don't like my
setup, the `~/.dotfiles` directory can be safely discarded.

## Uninstall

To remove one or more specific dotfiles from your system:

```sh
dotfiles uninstall gnupg neovim
```

To remove _all_ of my dotfiles your system:

```sh
dotfiles uninstall
```

A short summary of changes and an interactive confirmation prompt are shown
before any action is taken.

## Key bindings

### Command-line:

Binding           | Description
------------------|----------------------------------------------------------------------
<kbd>Ctrl+R</kbd> | Fuzzy search command history with [fzf]/[ripgrep]
<kbd>Ctrl+T</kbd> | Fuzzy search filesystem in the current directory with [fzf]/[ripgrep]

TODO: List all the rest of the keybindings

## License

These dotfiles are distributed as free and open source software under the terms
of the [MIT License](./LICENSE).
