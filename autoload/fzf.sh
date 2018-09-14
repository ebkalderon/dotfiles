#
# autoload/fzf.sh
#

# Load bash integration for FZF
if [[ -d /usr/share/fzf ]]; then
  source /usr/share/fzf/key-bindings.bash
  source /usr/share/fzf/completion.bash
elif [[ -f ~/.nix-profile/share/fzf ]]; then
  source ~/.nix-profile/share/fzf/key-bindings.bash
  source ~/.nix-profile/share/fzf/completion.bash
elif [[ -f ~/.fzf.bash ]]; then
  source ~/.fzf.bash
fi

# Select `rg` if available, fall back on `find` otherwise
if command -v rg &> /dev/null; then
  FZF_DEFAULT_COMMAND='rg --files . --no-ignore --glob "!.git/*" "*/\.*"'
else
  FZF_DEFAULT_COMMAND='find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
    sed s/^..//'
fi

# Use `git ls-tree` if running in Git repository, use `rg` or `find` otherwise
export FZF_DEFAULT_COMMAND="(git ls-tree -r --name-only HEAD || ${FZF_DEFAULT_COMMAND}) 2> /dev/null"
