function __adaos_explain_line --description 'Explica o comando da linha'
    set -l text (commandline)
    if test -z (string trim -- "$text")
        set text $history[1]
    end
    echo
    adaos-smart explain -- $text
    commandline -f repaint
end
