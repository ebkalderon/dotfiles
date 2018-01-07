#
# autoload/exports.sh
#

# Defaults
export BROWSER=firefox
export CACA_DRIVER=ncurses # Enable watching videos as ASCII art in terminal
export EDITOR=nvim
export GCC_COLORS=always
export GROFF_NO_SGR=1
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

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

readonly STYLE_RESET="$(tput sgr0)"
readonly STYLE_BOLD="$(tput bold)"
readonly STYLE_BLINK="$(tput blink)"
readonly STYLE_REVERSE="$(tput smso)"
readonly STYLE_UNDERLINE="$(tput smul)"

# export txtblk='\[\e[0;30m\]' # Black - Regular
# export txtred='\[\e[0;31m\]' # Red
# export txtgrn='\[\e[0;32m\]' # Green
# export txtylw='\[\e[0;33m\]' # Yellow
# export txtblu='\[\e[0;34m\]' # Blue
# export txtpur='\[\e[0;35m\]' # Purple
# export txtcyn='\[\e[0;36m\]' # Cyan
# export txtwht='\[\e[0;37m\]' # White
# export bldblk='\[\e[1;30m\]' # Black - Bold
# export bldred='\[\e[1;31m\]' # Red
# export bldgrn='\[\e[1;32m\]' # Green
# export bldylw='\[\e[1;33m\]' # Yellow
# export bldblu='\[\e[1;34m\]' # Blue
# export bldpur='\[\e[1;35m\]' # Purple
# export bldcyn='\[\e[1;36m\]' # Cyan
# export bldwht='\[\e[1;37m\]' # White
# export unkblk='\[\e[4;30m\]' # Black - Underline
# export undred='\[\e[4;31m\]' # Red
# export undgrn='\[\e[4;32m\]' # Green
# export undylw='\[\e[4;33m\]' # Yellow
# export undblu='\[\e[4;34m\]' # Blue
# export undpur='\[\e[4;35m\]' # Purple
# export undcyn='\[\e[4;36m\]' # Cyan
# export undwht='\[\e[4;37m\]' # White
# export bakblk='\[\e[40m\]'   # Black - Background
# export bakred='\[\e[41m\]'   # Red
# export bakgrn='\[\e[42m\]'   # Green
# export bakylw='\[\e[43m\]'   # Yellow
# export bakblu='\[\e[44m\]'   # Blue
# export bakpur='\[\e[45m\]'   # Purple
# export bakcyn='\[\e[46m\]'   # Cyan
# export bakwht='\[\e[47m\]'   # White
# export txtrst='\[\e[0m\]'    # Text Reset
