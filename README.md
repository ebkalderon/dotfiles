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
   * [bash](./packages/configs/files/bashrc)
   * [gdb](./packages/configs/files/gdbinit)
   * [git](./packages/configs/files/gitconfig)
   * [gnupg](./packages/configs/files/gnupg/)
   * [mpd](./packages/configs/files/mpd/)
   * [ncmpcpp](./packages/configs/files/ncmpcpp/)
   * [neovim](./packages/configs/files/config/nvim/)
   * [tmux](./packages/configs/files/tmux.conf)
   * [top](./packages/configs/files/toprc)
2. [Dconf Settings](./packages/dconf/)
   * [gedit](./packages/dconf/files/org.gnome.gedit.preferences.dconf)
   * [Tilix](./packages/dconf/files/com.gexperts.Tilix.dconf)
3. [Applications](./packages/apps/)
   1. [Core utilities](./packages/apps/files/core.list)
   2. [Desktop applications](./packages/apps/files/desktop.list)
   3. [DIY electronics tools](./packages/apps/files/electronics.list)
   4. [Graphics programming tools](./packages/apps/files/graphics.list)
   5. [Visual theme](./packages/apps/files/theme.list)
   6. [WhatsApp desktop client for Linux](./packages/whatsapp/)

## Installation

```
$ git clone https://github.com/ebkalderon/dotfiles ~/.dotfiles
$ cd ~/.dotfiles
$ ./dotfiles install
```

## Updating

To grab the latest version while preserving uncommitted local changes, run:

```
$ dotfiles update
```

## License

These dotfiles and bootstrap scripts are distributed as free and open source
software under the terms of the [MIT License](./LICENSE).
