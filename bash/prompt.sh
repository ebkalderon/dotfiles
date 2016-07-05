#
# bash/prompt.sh
#

# If in a Git repository, display branch
_prompt() {
    BRANCH=`git rev-parse --abbrev-ref HEAD 2> /dev/null`

    if [ $? -eq 0 ]; then
        echo -e "$txtblu\u$txtrst@$txtgrn\h $txtred\W $txtpur$BRANCH" \
                "$txtylw\\\$ $txtrst"
    else
        echo -e "$txtblu\u$txtrst@$txtgrn\h $txtred\W $txtylw\\\$ $txtrst"
    fi
}

PROMPT_COMMAND='PS1=$(_prompt)'

