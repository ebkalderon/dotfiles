#
# autoload/prompt.sh
#

# Define the `__git_ps1` utility function (this is only needed on platforms
# which don't already include `git-prompt.sh` in /etc/bash_completion.d/)
if [[ -f /usr/share/git/completion/git-prompt.sh ]]; then
    source /usr/share/git/completion/git-prompt.sh
elif [[ -f /usr/lib/git-core/git-sh-prompt ]]; then
    source /usr/lib/git-core/git-sh-prompt
fi

# Prints the current branch, if the current dir is within a Subversion repo.
#
# Accepts a `printf(1)` format string as an optional argument. If left
# unspecified, the format string defaults to " (%s)". Prints nothing if the
# current directory is not within a Subversion working directory.
function __svn_ps1() {
    local printf_format svn_info
    printf_format="${1:- (%s)}"

    svn_info="$( (svn info | grep ^URL) 2> /dev/null )"

    if [[ -n "$svn_info" ]] ; then
        local branch branch_pattern trunk_pattern
        branch_pattern="^URL: .*/(branch(es)?|tags)/([^/]+)"
        trunk_pattern="^URL: .*/trunk(/.*)?$"

        if [[ $svn_info =~ $branch_pattern ]]; then
            branch=${BASH_REMATCH[3]}
        elif [[ $svn_info =~ $trunk_pattern ]]; then
            branch='trunk'
        else
            branch='(svn)'
        fi

        printf "$printf_format" "$branch"
    fi
}

# Generates a colorful PS1 prompt
function _prompt() {
    local blue="\[\$(tput setaf 4)\]"
    local green="\[\$(tput setaf 2)\]"
    local magenta="\[\$(tput setaf 5)\]"
    local red="\[\$(tput setaf 1)\]"
    local reset="\[\$(tput sgr0)\]"
    local yellow="\[\$(tput setaf 3)\]"

    local branch="\$(__git_ps1 \"${magenta}%s \")\$(__svn_ps1 \"${magenta}%s \")"
    PS1="${blue}\u${reset}@${green}\h ${red}\W ${branch}${yellow}\$ ${reset}"
}

# Use VTE features if available, like keeping the same CWD when opening new tabs
if [[ -f /etc/profile.d/vte.sh ]]; then
    source /etc/profile.d/vte.sh
elif [[ -f /etc/profile.d/vte-2.91.sh ]]; then
    source /etc/profile.d/vte-2.91.sh
fi

# Treat $PROMPT_COMMAND as array if Bash >= 5.1
if [[ "${PROMPT_COMMAND@a}" == 'a' ]]; then
    PROMPT_COMMAND+=('_prompt')

    if declare -f __vte_osc7 > /dev/null; then
        PROMPT_COMMAND+=('__vte_osc7')
    fi
else
    PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }_prompt"

    if declare -f __vte_osc7 > /dev/null; then
      PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }__vte_osc7"
    fi
fi
