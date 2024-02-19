function config_prepare_linux() {
    mkdir -p ~/.config/mpd/playlists
    mkdir -p ~/.local/share/mpd
    touch ~/.local/share/mpd/state
}

function config_prepare_macos() {
    mkdir -p ~/.mpd/playlists
    touch ~/.mpd/{socket,state}
}

function config_cleanup_linux() {
    if [[ -d ~/.config/mpd ]]; then
        rm -r ~/.config/mpd
    fi

    if [[ -d ~/.local/share/mpd ]]; then
        rm -r ~/.local/share/mpd
    fi
}

function config_cleanup_macos() {
    if [[ -d ~/.mpd ]]; then
        rm -r ~/.mpd
    fi
}
