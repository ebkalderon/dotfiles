#
# ~/.bashrc.d/functions.bash
#

# Better than default `diff` command
if command -v git > /dev/null; then
    function diff() {
        git diff --no-index "$@"
    }
fi
