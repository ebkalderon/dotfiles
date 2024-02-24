#
# ~/.bashrc.d/fzf.bash
#

# Load bash integration for FZF
if [[ -d /usr/share/fzf ]]; then
    source /usr/share/fzf/key-bindings.bash
    source /usr/share/fzf/completion.bash
elif [[ -d /usr/share/doc/fzf ]]; then
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

# Custom ** fuzzy search for man pages
_fzf_complete_man() {
    local pager='col -bx | bat -l man -p --color=always --theme="Monokai Extended"'
    local preview_cmd="echo {} | cut -f 1 -d ' ' | xargs man | $pager"
    _fzf_complete --multi --reverse --preview "$preview_cmd" -- "$@" < <(man -k . | sort)
}

_fzf_complete_man_post() {
    cut -f 1 -d ' '
}

[ -n "$BASH" ] && complete -F _fzf_complete_man -o default -o bashdefault man
