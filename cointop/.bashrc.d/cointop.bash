#
# ~/.bashrc.d/cointop.bash
#

# Point `cointop` to XDG config location on macOS
if [[ "${OSTYPE}" =~ darwin ]]; then
  export COINTOP_CONFIG=~/.config/cointop
fi
