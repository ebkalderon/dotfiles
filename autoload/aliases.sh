#
# autoload/aliases.sh
#

# Color support
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" \
    || eval "$(dircolors -b)"
  alias diff='diff --color=auto'
  alias dir='dir --color=auto'
  alias egrep='egrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias grep='grep --color=auto'
  alias ls='ls --color=auto'
  alias vdir='vdir --color=auto'
fi

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias diff='git diff --no-index'
alias kmpd='mpd --kill'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias vi='nvim'
alias vim='nvim'

if [[ "${OSTYPE}" =~ linux* ]]; then
  alias nix-repl='docker run --rm -it lnl7/nix nix repl "<nixpkgs>"'
  alias open='xdg-open'
  alias pacman-autoclean='sudo pacman -R $(pacman -Qdtq)'
elif [[ "${OSTYPE}" =~ darwin* ]]; then
  alias readelf='/usr/local/opt/binutils/bin/readelf'
  alias restart-nix='sudo launchctl kickstart -k system/org.nixos.nix-daemon'
fi
