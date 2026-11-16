function fish_user_key_bindings
    # fzf: Ctrl+R (histórico), Ctrl+T (arquivos), Alt+C (pastas)
    if test -f /usr/share/doc/fzf/examples/key-bindings.fish
        source /usr/share/doc/fzf/examples/key-bindings.fish
        fzf_key_bindings
    end

    # Alt+A: texto em português na linha -> comando
    bind \ea __adaos_nl2cmd
    # Alt+E: explica o comando que está na linha
    bind \ee __adaos_explain_line
end
