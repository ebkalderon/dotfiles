#
# ~/.bash_profile
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable bash autocompletion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Base dotfiles directory
DIR="/home/ekalderon/.dotfiles"

# Locate bash dotfiles
DOTFILES=`find $DIR/bash/ -type f`

# Load all files found
for FILE in $DOTFILES; do
    source $FILE
done

# Go to user's home when done
cd
