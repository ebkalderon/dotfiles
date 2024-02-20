#
# ~/.bashrc.d/completions.bash
#

if command -v grunt > /dev/null; then
    eval "$(grunt --completion=bash)"
fi

if command -v kubectl > /dev/null; then
    eval "$(kubectl completion bash)"
fi
