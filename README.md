# Dotfiles

Many people are posting their configuration files on GitHub, so here are mine.
Keep in mind that these dotfiles are for my own personal use, so occasional
breakage may occur.

The install script backs up your existing dotfiles to `~/.dotfiles_old/`, in
case you don't like my setup.

![Screenshot](./screenshot.png)

## Features

This repository organizes all of the included functionality into self-contained
bundles of files and scripts called [_packages_](./packages/README.md). Each
package is built to handle a specific task, e.g. symlinking dotfiles in the home
directory, installing programs, customizing the look and feel, etc. Using the
included `dotfiles` command, you can pick and choose which packages to install.

1. [Configuration Files](./packages/configs/)
   * [bash](./packages/configs/files/home/dot-bashrc)
   * [cointop](./packages/configs/files/home/.config/cointop)
   * [gdb](./packages/configs/files/home/dot-gdbinit)
   * [git](./packages/configs/files/home/dot-gitconfig)
   * [gnupg](./packages/configs/files/home/.gnupg/)
   * [mpd](./packages/configs/files/home/.mpd/)
   * [ncmpcpp](./packages/configs/files/home/.ncmpcpp/)
   * [neovim](./packages/configs/files/home/.config/nvim/)
   * [tmux](./packages/configs/files/home/dot-tmux.conf)
   * [top](./packages/configs/files/home/dot-toprc)
2. [Dconf Settings](./packages/dconf/)
   * [gedit](./packages/dconf/files/org.gnome.gedit.preferences.dconf)
   * [Tilix](./packages/dconf/files/com.gexperts.Tilix.dconf)
3. [Applications](./packages/apps/)
   1. [Core utilities](./packages/apps/files/core.list)
   2. [Desktop applications](./packages/apps/files/desktop.list)
   3. [DIY electronics tools](./packages/apps/files/electronics.list)
   4. [Graphics programming tools](./packages/apps/files/graphics.list)
   5. [Visual theme](./packages/apps/files/theme.list)
4. [DIY WhatsApp Desktop Client for Linux](./packages/whatsapp/)

## Installation

```sh
sudo pacman -S stow # GNU stow is required
git clone https://github.com/ebkalderon/dotfiles ~/.dotfiles
cd ~/.dotfiles
./dotfiles install
```

## Updating

To grab the latest version while preserving uncommitted local changes, run:

```sh
dotfiles update
```

## License

These dotfiles and bootstrap scripts are distributed as free and open source
software under the terms of the [MIT License](./LICENSE).
