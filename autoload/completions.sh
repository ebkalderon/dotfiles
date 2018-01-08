#
# autoload/completions.sh
#

_dotfiles() {
  local cur prev words cword split
  _init_completion -s || return

  if [[ ${prev} == @(-h | --help | -v | --version) ]]; then
    return 0
  fi

  local cmd="${words[1]}"
  case "${cmd}" in
    install | remove)
      COMPREPLY=( $(compgen -W '--package --verbose' -- "${cur}") )
      return 0
      ;;
    list)
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

  ${split} && return 0

  if [[ ${cword} == 1 ]]; then
    local opts='install list reload remove update -h --help -v --version'
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
    return 0
  fi
}

complete -F _dotfiles dotfiles
