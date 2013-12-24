_screencap() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local prev="${COMP_WORDS[COMP_CWORD-1]}"
    local opts="--help --fps --input --output --filters --blind --mute --threads --"

    [[ "$prev" == "--" ]] && return 0
    COMPREPLY+=($(compgen -W "${opts}" -- ${cur}))
}

complete -F _screencap screencap
