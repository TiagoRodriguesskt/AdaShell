function smart --description 'Terminal Inteligente: help, status, update, learn, dino...'
    # ask, explain e fix são comandos sozinhos, mas aceitamos também
    # "smart explain git" e "smart learn explain git" (com uma dica)
    set -l rest $argv[2..-1]
    switch "$argv[1]"
        case ask explain fix
            echo (set_color 6F7F78)"(dica: pode digitar só: "(string trim -- "$argv[1] $rest")")"(set_color normal)
            $argv[1] $rest
            return $status
        case learn
            if contains -- "$argv[2]" ask explain fix
                set -l cmd $argv[2]
                set -l args $argv[3..-1]
                echo (set_color 6F7F78)"(dica: $cmd é um comando sozinho; pode digitar só: "(string trim -- "$cmd $args")")"(set_color normal)
                $cmd $args
                return $status
            end
    end
    adaos-smart $argv
end
