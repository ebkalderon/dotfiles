#
# autoload/fzf.sh
#

# Load bash integration for FZF
if [ -d /usr/share/fzf ]; then
  source /usr/share/fzf/key-bindings.bash
  source /usr/share/fzf/completion.bash
elif command -v fzf-share &> /dev/null; then
  source "$(fzf-share)/key-bindings.bash"
  source "$(fzf-share)/completion.bash"
fi

# Select `rg` if available, fall back on `find` otherwise
if command -v rg &> /dev/null; then
  FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
else
  FZF_DEFAULT_COMMAND='find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
    sed s/^..//'
fi

# Use `git ls-tree` if running in Git repository, use `rg` or `find` otherwise
export FZF_DEFAULT_COMMAND="(git ls-tree -r --name-only --exclude-standard
  --cached --others HEAD || ${FZF_DEFAULT_COMMAND}) 2> /dev/null"
