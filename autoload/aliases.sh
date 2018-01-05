#
# autoload/aliases.sh
#

# Color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval \
            "$(dircolors -b)"
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
alias kff='killall firefox'
alias kmpd='mpd --kill'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias pacman-autoclean='sudo pacman -R $(pacman -Qdtq)'
alias reloadrc='source ~/.bashrc'
alias vi='nvim'
alias vim='nvim'
