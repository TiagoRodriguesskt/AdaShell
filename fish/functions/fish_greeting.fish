function fish_greeting
    if type -q fastfetch; and not set -q ADAOS_NO_FASTFETCH
        fastfetch
    end
    set -l tips \
        'ask <pedido>  transforma português em comando (ex.: ask liste os arquivos .py modificados hoje)' \
        'Escreva o pedido na linha e aperte Alt+A: vira comando, você revisa e dá Enter' \
        'explain <comando>  explica cada parte; Alt+E explica o que está na linha' \
        'Deu erro? Digite fix' \
        'Ctrl+R busca no histórico; Ctrl+T busca arquivos; Alt+C entra numa pasta' \
        'z <parte do nome> pula para uma pasta que você já visitou' \
        '→ aceita a sugestão cinza; Alt+→ aceita só uma palavra' \
        'smart tips  mostra todos os truques'
    set -l i (random 1 (count $tips))
    echo (set_color CDA869)'✦ Dica: '(set_color F4EDE1)$tips[$i](set_color normal)
end
