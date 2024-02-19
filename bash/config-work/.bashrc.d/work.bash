#
# ~/.bashrc.d/work.bash
#

export LIBCLANG_PATH=/usr/lib/llvm-10/lib

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -z "$RUSTUP_HOME" ]; then
  export RUSTUP_HOME="$HOME/.rustup"
  export CARGO_HOME="$HOME/.cargo"
  export PATH="$PATH:$CARGO_HOME/bin"
fi

if type -P rustup > /dev/null; then
  source <(rustup completions bash)
  source <(rustup completions bash cargo)
fi
