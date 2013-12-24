_screencap() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="--help --fps --input --output --filters --blind --mute --threads --"

    [[ "$prev" == "--" ]] && return 0
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}

complete -F _screencap screencap
