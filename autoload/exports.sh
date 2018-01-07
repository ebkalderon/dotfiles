#
# autoload/exports.sh
#

# Defaults
export BROWSER=firefox
export CACA_DRIVER=ncurses # Enable watching videos as ASCII art in terminal
export EDITOR=nvim
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Colorization support
export GCC_COLORS=always
export GROFF_NO_SGR=1

# Color codes
readonly COLOR_BLACK="$(tput setaf 0)"
readonly COLOR_RED="$(tput setaf 1)"
readonly COLOR_GREEN="$(tput setaf 2)"
readonly COLOR_YELLOW="$(tput setaf 3)"
readonly COLOR_LIME_YELLOW="$(tput setaf 190)"
readonly COLOR_POWDER_BLUE="$(tput setaf 153)"
readonly COLOR_BLUE="$(tput setaf 4)"
readonly COLOR_MAGENTA="$(tput setaf 5)"
readonly COLOR_CYAN="$(tput setaf 6)"
readonly COLOR_WHITE="$(tput setaf 7)"

# Text style codes
readonly STYLE_RESET="$(tput sgr0)"
readonly STYLE_BOLD="$(tput bold)"
readonly STYLE_BLINK="$(tput blink)"
readonly STYLE_REVERSE="$(tput smso)"
readonly STYLE_UNDERLINE="$(tput smul)"
