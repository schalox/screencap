_screencap() {
  local cur prev opts opts_nocomp
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="--help --fps --input --output --filters --blind --mute --threads --"
  opts_nocomp="--help|--fps|--input|--output|--filters|--threads"

  if [[ "$prev" == "--" ]]; then
    # End of arguments -> complete filenames
    _filedir
  elif ((COMP_CWORD > 1)) && [[ -f "$prev" ]]; then
    # Last argument was a file -> no completion
    return 0
  else
    if [[ $prev =~ $opts_nocomp ]]; then
      # Last argument was one of $opts_nocomp -> no completion
      return 0
    elif [[ "$cur" == -* ]]; then
      # Current arguments starts with '-' -> complete $opts
      COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    else
      # Complete filenames
      _filedir
    fi
  fi
}

complete -F _screencap screencap
