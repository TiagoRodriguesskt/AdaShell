function explain --description 'Explica um comando parte por parte'
    if contains -- "$argv[1]" help --help -h
        adaos-smart help explain
        return 0
    end
    set -l cmd (string join ' ' -- $argv)
    if test -z "$cmd"
        set cmd $__adaos_last_cmd
        test -n "$cmd"; or set cmd $history[1]
    end
    if test -z "$cmd"
        echo 'Passe um comando. Exemplo: explain tar -xzvf arquivo.tar.gz'
        return 2
    end
    adaos-smart explain -- $cmd
end
