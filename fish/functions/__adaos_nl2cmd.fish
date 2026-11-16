function __adaos_nl2cmd --description 'Transforma o texto da linha num comando'
    set -l text (commandline)
    if test -z (string trim -- "$text")
        echo
        echo (set_color CDA869)'Escreva o que quer fazer em português e aperte Alt+A.'(set_color normal)
        commandline -f repaint
        return
    end
    echo
    echo (set_color 6F7F78)'⚙ pensando…'(set_color normal)
    set -l cmd (adaos-smart cmd --quiet -- $text)
    if test $status -eq 0; and test -n "$cmd"
        commandline -r -- $cmd
    end
    commandline -f repaint
end
