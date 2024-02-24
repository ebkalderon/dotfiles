#
# ~/.profile
#

# System-wide exports for all sessions, both graphical and command-line

export BROWSER=firefox
export EDITOR=nvim

if command -v cargo > /dev/null; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

if command -v go > /dev/null; then
    export PATH="$PATH:$(go env GOPATH)/bin"
fi

if command -v ruby > /dev/null && command -v gem > /dev/null; then
    export PATH="$PATH:$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
fi

if command -v yarn > /dev/null; then
    export PATH="$PATH:$(yarn global bin)"
elif command -v yarnpkg > /dev/null; then
    export PATH="$PATH:$(yarnpkg global bin)"
fi
