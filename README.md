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
      * git
      * htop
      * mpd
      * ncmpcpp
      * neovim
   2. [Desktop applications](./packages/apps/files/desktop.list)
      * Firefox
      * LibreOffice

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

The MIT License (MIT)

Copyright (c) 2016-2017 Eyal Kalderon

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
