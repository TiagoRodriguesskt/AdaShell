function ask --description 'Pedido em português -> comando do Linux (IA local)'
    if test (count $argv) -eq 0; or contains -- $argv[1] help --help -h
        adaos-smart help ask
        return 0
    end
    adaos-smart cmd -- (string join ' ' -- $argv); or return $status
    __adaos_run_suggestion
end
