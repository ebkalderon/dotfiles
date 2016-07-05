#
# ~/.bashrc
#

# Called by bash when used as an interactive shell

[[ $- != *i* ]] && return

# Automatically adjust the values of LINES and COLUMNS after each command
shopt -s checkwinsize

# Enable bash autocompletion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Locate bash dotfiles
DIR="/home/ekalderon/.dotfiles"
DOTFILES=`find $DIR/bash/ -type f | sort`

# Load all files found
for FILE in $DOTFILES; do
    . $FILE
done

