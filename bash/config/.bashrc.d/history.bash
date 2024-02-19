#
# ~/.bashrc.d/history.bash
#

# Don't put duplicate lines in the history. See bash(1) for more options...
# or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length, see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
