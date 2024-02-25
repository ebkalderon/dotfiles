function config_prepare() {
    mkdir -p ~/.config
}

function config_precleanup() {
    if [[ -L ~/.config/ncmpcpp ]]; then
        unlink ~/.config/ncmpcpp
    fi
}
