#
# autoload/fzf.sh
#

# Load Bash integration for FZF.

if [[ -d /usr/share/fzf ]]; then
  source /usr/share/fzf/key-bindings.bash
  source /usr/share/fzf/completion.bash
elif [[ -f ~/.fzf.bash ]]; then
  source ~/.fzf.bash
fi
