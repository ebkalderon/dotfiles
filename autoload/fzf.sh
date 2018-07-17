#
# autoload/fzf.sh
#

# Load Bash integration for FZF
if [[ -d /usr/share/fzf ]]; then
  source /usr/share/fzf/key-bindings.bash
  source /usr/share/fzf/completion.bash
elif [[ -f ~/.fzf.bash ]]; then
  source ~/.fzf.bash
fi

# Use `git ls-tree` if running in Git repository, use `find` otherwise
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'
