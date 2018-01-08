# Dotfiles

Many people are posting their configuration files on GitHub, so here are mine.
Keep in mind that these dotfiles are for my own personal use, so occasional
breakage may occur.

The install script backs up your existing dotfiles to `~/.dotfiles_old/`, in
case you don't like my setup.

![Screenshot](./screenshot.png)

## Included configs

* [bash](./bash/)
* [gdb](./gdbinit)
* [git](./gitconfig)
* [mpd](./mpd)
* [ncmpcpp](./ncmpcpp)
* [neovim](./nvim/)
* [tmux](./tmux.conf)
* [top](./toprc)

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
