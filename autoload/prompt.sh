#
# autoload/prompt.sh
#

# Executes VTE-specific functions, if available
_is_vte_term() {
  if [[ -f /etc/profile.d/vte.sh ]] && [[ -n "${VTE_VERSION}" ]]; then
    __vte_prompt_command
  fi
}

# Returns the current Git branch name (example: `master`)
_branch_git() {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

# Returns the current Subversion branch name (example: `ekalderon/trunk`)
_branch_svn() {
  svn info 2> /dev/null \
    | grep '^URL:' \
    | grep -Eo '(tags|branches)/[^/]+|trunk' \
    | grep -Eo '[^/]+$' \
    | sed 'N;s/\n/\//'
}

# Builds the PS1 prompt, optionally with the current Git/Subversion branch name
_prompt() {
  local git_branch="$(_branch_git)"
  if [[ -n ${git_branch} ]]; then
    echo -e "\\[${COLOR_BLUE}\\]\\u\\[${STYLE_RESET}\\]@\\[${COLOR_GREEN}\\]\\h" \
            "\\[${COLOR_RED}\\]\\W \\[${COLOR_MAGENTA}\\]${git_branch}" \
            "\\[${COLOR_YELLOW}\\]\\\$ \\[${STYLE_RESET}\\]"
    return
  fi

  local svn_branch="$(_branch_svn)"
  if [[ -n ${svn_branch} ]]; then
    echo -e "\\[${COLOR_BLUE}\\]\\u\\[${STYLE_RESET}\\]@\\[${COLOR_GREEN}\\]\\h" \
            "\\[${COLOR_RED}\\]\\W \\[${COLOR_MAGENTA}\\]${svn_branch}" \
            "\\[${COLOR_YELLOW}\\]\\\$ \\[${STYLE_RESET}\\]"
    return
  fi

  echo -e "\\[${COLOR_BLUE}\\]\\u\\[${STYLE_RESET}\\]@\\[${COLOR_GREEN}\\]\\h" \
          "\\[${COLOR_RED}\\]\\W \\[${COLOR_YELLOW}\\]\\\$ \\[${STYLE_RESET}\\]"
}

PROMPT_COMMAND='_is_vte_term; PS1=$(_prompt)'
