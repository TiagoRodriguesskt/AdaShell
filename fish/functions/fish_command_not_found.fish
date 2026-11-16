function fish_command_not_found --description 'Comando não encontrado: sugere correção e pacote'
    set -l name $argv[1]
    echo (set_color D0566B)"✗ comando não encontrado: $name"(set_color normal) >&2

    # 1) Erro de digitação? (instantâneo, sem IA)
    set -l close (adaos-smart suggest -- $name 2>/dev/null)
    if test -n "$close"
        echo (set_color CDA869)"  Você quis dizer: "(set_color normal)(string join ', ' (string split ' ' -- $close))"?" >&2
    end

    # 2) Pacote do Debian que tem esse comando (pacote command-not-found)
    if test -x /usr/lib/command-not-found
        /usr/lib/command-not-found -- $name 2>&1 | string match -rv '^\s*$' | sed 's/^/  /' >&2
    end
    echo (set_color 6F7F78)"  Dica: ask <o que você queria fazer>  — a IA monta o comando."(set_color normal) >&2
end
