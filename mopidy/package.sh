function config_prepare_linux() {
    mkdir -p ~/.config/systemd/user/
}

function config_finish_linux() {
    echo 'To complete Mopidy setup:'
    echo '  # Install `Mopidy-Jellyfin` PyPI package, if not present'
    echo '  nvim ~/.config/mopidy/jellyfin.conf # hostname, username, password'
    echo '  systemctl --user enable mopidy --now'
}

function config_prepare_macos() {
    mkdir -p ~/.config
}

function config_finish_macos() {
    echo 'To complete Mopidy setup:'
    echo '  # Install `Mopidy-Jellyfin` PyPI package, if not present'
    echo '  nvim ~/.config/mopidy/jellyfin.conf # hostname, username, password'
    echo '  brew services start mopidy/mopidy/mopidy'
}
