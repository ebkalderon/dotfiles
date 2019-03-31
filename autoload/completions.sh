#
# autoload/completions.sh
#

_dotfiles() {
  local cur prev words cword cmd
  _init_completion || return

  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  cmd="${words[1]}"

  case ${cmd} in
    help)
      return 0
      ;;
    install | remove)
      COMPREPLY=( $(compgen -W '--package --verbose' -- "${cur}") )
      return 0
      ;;
    list)
      return 0
      ;;
    new)
      return 0
      ;;
    reload)
      COMPREPLY=( $(compgen -W '--verbose' -- "${cur}") )
      return 0
      ;;
    update)
      COMPREPLY=( $(compgen -W '--discard-local --verbose' -- "${cur}") )
      return 0
      ;;
  esac

  if [[ ${cword} == 1 ]]; then
    local opts='help install list new reload remove update -h --help -V --version'
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
    return 0
  fi
}

complete -o nospace -F _dotfiles dotfiles
