function config_prepare_linux() {
    mkdir -p ~/.config
    rmdir ~/.config/procps 2> /dev/null || true
}

function config_precleanup_linux() {
    if [[ -L ~/.config/procps ]]; then
        unlink ~/.config/procps
    fi
}
