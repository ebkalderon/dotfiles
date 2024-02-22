function config_cleanup() {
    if [[ -d ~/.bashrc.d ]]; then
        rmdir --ignore-fail-on-non-empty ~/.bashrc.d || true
    fi
}
