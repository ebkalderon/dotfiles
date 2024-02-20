#
# ~/.bashrc
#

# Called by bash when used as an interactive shell

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Automatically adjust the values of LINES and COLUMNS after each command
shopt -s checkwinsize

# Enable programmable bash completion features (you don't need to enable this
# if it's already enabled in /etc/bash.bashrc and /etc/profile sources
# /etc/bash.bashrc)
if ! shopt -oq posix; then
    bash_completion=(
        "/etc/bash_completion"
        "/usr/share/bash-completion/bash_completion"
        "/usr/local/share/bash-completion/bash_completion"
        "${NIX_PROFILE:-$HOME/.nix-profile}/etc/profile.d/bash_completion.sh"
    )

    for f in "${bash_completion[@]}"; do
        [[ -f "$f" ]] && source "$f"
    done
fi

# Load all scripts in ~/.bashrc.d/
for rc in ~/.bashrc.d/*; do
  source "$rc"
done
