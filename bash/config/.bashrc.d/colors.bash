#
# ~/.bashrc.d/colors.bash
#

# Enable dircolors, if supported
if [ -x /usr/bin/dircolors ]; then
    if [ -r ~/.dircolors ]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi

    alias diff='diff --color=auto'

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias grep='grep --color=auto'

    alias ip='ip --color=auto'
fi

# Enable colored output on macOS
if [[ "$OSTYPE" =~ darwin ]]; then
    export CLICOLOR=1
    export LSCOLORS='ExGxBxDxCxEgEdxbxgxcxd'
fi

# Colorized less output
if command -v batpipe > /dev/null; then
    eval "$(batpipe)"
else
    export LESS_TERMCAP_mb=$(printf "\e[1;31m")
    export LESS_TERMCAP_md=$(printf "\e[1;31m")
    export LESS_TERMCAP_me=$(printf "\e[0m")
    export LESS_TERMCAP_se=$(printf "\e[0m")
    export LESS_TERMCAP_so=$(printf "\e[1;44;33m")
    export LESS_TERMCAP_ue=$(printf "\e[0m")
    export LESS_TERMCAP_us=$(printf "\e[1;32m")
    export LESS_TERMCAP_mr=$(tput rev)
    export LESS_TERMCAP_mh=$(tput dim)
    export LESS_TERMCAP_ZN=$(tput ssubm)
    export LESS_TERMCAP_ZV=$(tput rsubm)
    export LESS_TERMCAP_ZO=$(tput ssupm)
    export LESS_TERMCAP_ZW=$(tput rsupm)
fi

# Colorized man pages (assumes colorized less)
if command -v bat > /dev/null; then
    export MANPAGER="sh -c \"col -bx | bat -l man -p --paging=always --theme='Monokai Extended'\""
    export MANROFFOPT='-c'
else
    # Applies LESS_TERMCAP_* to entire man page
    export GROFF_NO_SGR=1
fi
