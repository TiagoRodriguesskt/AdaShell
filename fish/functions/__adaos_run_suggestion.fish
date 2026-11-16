function __adaos_run_suggestion --description 'Pergunta e executa a última sugestão da IA'
    set -l file ~/.cache/adaos/last-suggestion
    test -s $file; or return 1
    set -l cmd (string collect < $file)
    set -l risk safe
    test -s ~/.cache/adaos/last-risk; and set risk (string collect < ~/.cache/adaos/last-risk)

    echo
    if test "$risk" = danger
        read -l -P (set_color D0566B)'Comando PERIGOSO. Digite SIM (maiúsculo) para executar: '(set_color normal) resp
        test "$resp" = SIM; or begin
            echo 'Cancelado.'
            return 1
        end
    else
        read -l -P (set_color CDA869)'Executar? [s/N] '(set_color normal) resp
        string match -qir '^(s|sim|y|yes)$' -- $resp; or begin
            echo 'Cancelado. Dica: escreva o pedido na linha e use Alt+A para poder editar antes.'
            return 1
        end
    end

    echo (set_color 6F7F78)"› $cmd"(set_color normal)
    # Se o fish entende o comando, roda no fish (assim o cd funciona).
    # Se for sintaxe só do bash ($(...), [[ ]], for...do), roda no bash.
    if fish --no-execute -c "$cmd" 2>/dev/null
        eval $cmd
    else
        bash -c "$cmd"
    end
end
