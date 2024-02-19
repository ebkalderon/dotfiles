#
# ~/.bashrc.d/functions.bash
#

# Better than default `diff` command
function diff() {
  git diff --no-index $@
}
