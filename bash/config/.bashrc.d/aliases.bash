#
# ~/.bashrc.d/aliases.bash
#

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'

# Editor aliases
if command -v nvim > /dev/null; then
  alias vi='nvim'
  alias vim='nvim'
fi

# Convenient `open` and `trash` commands for Linux and macOS
if [[ "$OSTYPE" =~ linux ]]; then
  command -v xdg-open > /dev/null && alias open='xdg-open'
  command -v gio > /dev/null && alias trash='gio trash'
fi
