#
# ~/.bashrc.d/fzf.bash
#

# Load bash integration for FZF
if [[ -d /usr/share/fzf ]]; then
    source /usr/share/fzf/key-bindings.bash
    source /usr/share/fzf/completion.bash
elif [[ -f /usr/share/bash-completion/completions/fzf ]]; then
    source /usr/share/bash-completion/completions/fzf
    source /usr/share/doc/fzf/examples/key-bindings.bash
elif [[ -d /usr/share/doc/fzf/examples ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
    source /usr/share/doc/fzf/examples/completion.bash
elif command -v fzf-share > /dev/null; then
    source "$(fzf-share)/key-bindings.bash"
    source "$(fzf-share)/completion.bash"
else
    return
fi

# Select `rg` if available, fall back to `find` otherwise
if command -v rg > /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs'
fi

# Custom ** fuzzy completions
_fzf_setup_completion dir tree
_fzf_setup_completion path ll

# Custom ** fuzzy search for "git checkout"
_fzf_complete_git() {
    if git rev-parse --git-dir &> /dev/null && [[ "${COMP_WORDS[*]:1:2}" = "checkout **" ]]; then
        local branches
        branches="$(printf '  FETCH_HEAD\n  HEAD\n  ORIG_HEAD\n'; git branch -vv --all)"
        _fzf_complete --reverse -- "$@" < <(echo "$branches" | sed -E 's,^(\*| ) remotes/([^ ]+),\1 \2        ,')
    else
        _completion_loader git
        __git_wrap__git_main
        [[ "${#COMPREPLY[@]}" != 0 ]] && COMPREPLY[-1]="${COMPREPLY[-1]/%+([[:blank:]])/}"
        complete -F _fzf_complete_git -o default -o bashdefault git
    fi
}

_fzf_complete_git_post() {
    cut -c 2- | awk '{print $1}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_git -o default -o bashdefault git

# Custom ** fuzzy search for man pages
_fzf_complete_man() {
    local preview="echo {1,2} | sed 's/ (/./' | sed -E 's/\)\s*$//' | xargs man | bat -l man -pp -f"
    _fzf_complete --multi --reverse --preview "$preview" -- "$@" < <(man -k . | sort)
}

_fzf_complete_man_post() {
    awk '{print $1 "." $2}' | tr -d '()'
}

[ -n "$BASH" ] && complete -F _fzf_complete_man -o default -o bashdefault man
