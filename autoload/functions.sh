#
# autoload/functions.sh
#

# Hides .desktop file
deskhide() {
    grep -q '^NoDisplay' $1 && sed -i 's/^NoDisplay.*/NoDisplay=true/' $1 \
        || echo 'NoDisplay=true' >> $1
}

# Launches .desktop file from terminal
deskopen() {
    `grep '^Exec' $1 | tail -1 | sed 's/^Exec=//' | sed 's/%.//'` &
}

# Makes .desktop file visible
deskshow() {
    grep -q '^NoDisplay' $1 && sed -i 's/^NoDisplay.*/NoDisplay=false/' \
        $1 || echo 'NoDisplay=false' >> $1
}

# Colorized man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

# Downloads latest dotfiles from GitHub
updaterc() {
    # Pull dotfiles from git, overwriting the $DOTFILES variable in .bashrc
    git -C $DOTFILES checkout origin/master packages/configs/bashrc > /dev/null
    git -C $DOTFILES stash &> /dev/null
    git -C $DOTFILES pull

    # Restore any local uncommitted changes
    if git -C ${DOTFILES} stash show -u &> /dev/null; then
        echo "Preserved uncommitted changes."
        git -C ${DOTFILES} stash pop > /dev/null
    fi

    # Restore correct $DOTFILES variable in .bashrc and re-apply shell settings
    ${DOTFILES}/install.sh
    source ~/.bashrc
}
