function config_prepare() {
    mkdir -p ~/.bashrc.d ~/.config
}

function config_cleanup() {
    if [ -d ~/.bashrc.d ]; then
        find ~/.bashrc.d -xtype l -delete -print
        rmdir --ignore-fail-on-non-empty ~/.bashrc.d || true
    fi
}
