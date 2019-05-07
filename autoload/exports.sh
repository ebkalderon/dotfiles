#
# autoload/exports.sh
#

# Defaults
export BROWSER=firefox
export CACA_DRIVER=ncurses # Enable watching videos as ASCII art in terminal
export EDITOR=nvim
export GOPATH="${HOME}/.go"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Colorization support
export GCC_COLORS=always
export GROFF_NO_SGR=1

if [[ "${OSTYPE}" == 'darwin'* ]]; then
  export CLICOLOR=1
  export LSCOLORS='ExGxBxDxCxEgEdxbxgxcxd'
fi

# Color codes
export COLOR_BLACK="$(tput setaf 0)"
export COLOR_RED="$(tput setaf 1)"
export COLOR_GREEN="$(tput setaf 2)"
export COLOR_YELLOW="$(tput setaf 3)"
export COLOR_LIME_YELLOW="$(tput setaf 190)"
export COLOR_POWDER_BLUE="$(tput setaf 153)"
export COLOR_BLUE="$(tput setaf 4)"
export COLOR_MAGENTA="$(tput setaf 5)"
export COLOR_CYAN="$(tput setaf 6)"
export COLOR_WHITE="$(tput setaf 7)"

# Text style codes
export STYLE_RESET="$(tput sgr0)"
export STYLE_BOLD="$(tput bold)"
export STYLE_BLINK="$(tput blink)"
export STYLE_REVERSE="$(tput smso)"
export STYLE_UNDERLINE="$(tput smul)"
