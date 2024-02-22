function config_prepare() {
    mkdir -p ~/.bashrc.d
}

function config_finish() {
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
}

function config_cleanup() {
    if [[ -d ~/.bashrc.d ]]; then
        rmdir --ignore-fail-on-non-empty ~/.bashrc.d || true
    fi
}
