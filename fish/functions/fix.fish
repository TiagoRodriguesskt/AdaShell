function fix --description 'Analisa o último comando que deu erro e sugere a correção'
    if contains -- "$argv[1]" help --help -h
        adaos-smart help fix
        return 0
    end
    set -l cmd $__adaos_last_cmd
    set -l st $__adaos_last_status
    if test -z "$cmd"
        echo 'Ainda não há comando para analisar nesta janela.'
        return 1
    end
    if test "$st" = 0
        echo (set_color 3FA77F)"O último comando funcionou:"(set_color normal)" $cmd"
        read -l -P 'Analisar mesmo assim? [s/N] ' resp
        string match -qir '^(s|sim)$' -- $resp; or return 0
    end

    echo (set_color D0566B)"✗ $cmd"(set_color normal)" (código $st)"
    set -l out (mktemp)
    # Só roda de novo para ler o erro se o comando for seguro
    if test (adaos-smart risk -- $cmd) = safe
        read -l -P (set_color CDA869)'Rodar de novo (até 20 s) para ler a mensagem de erro? [S/n] '(set_color normal) resp
        if not string match -qir '^(n|nao|não|no)$' -- $resp
            timeout 20 fish -c "$cmd" >$out 2>&1 </dev/null
        end
    else
        echo (set_color 6F7F78)'(não vou rodar de novo: o comando altera o sistema)'(set_color normal)
    end

    adaos-smart fix --status $st --output-file $out -- $cmd
    set -l ok $status
    rm -f $out
    test $ok -eq 0; and __adaos_run_suggestion
end
