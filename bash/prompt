#
# bash/prompt
#

# Different colored prompts for root and regular users
function _prompt() {
    if [[ "$?" != "0" ]]; then
        errcolor=$bldred
    else
        errcolor=$bldblk
    fi

    if [[ $EUID == 0 ]]; then
        echo -ne "\[\033]0;\u@\h:\w\007\]$errcolor» $txtylw\u@\h$bldblk╺─╸[$txtwht\W$bldblk]$bldred;$txtrst "
    else
        echo -ne "\[\033]0;\u@\h:\w\007\]$errcolor» $txtylw\u@\h$bldblk╺─╸[$txtwht\W$bldblk]$bldblu;$txtrst "
    fi
}

#PROMPT_COMMAND='PS1=$(_prompt)'

PS1="$txtblu\u$txtrst@$txtgrn\h $txtred\W $txtylw\\\$ $txtrst"

