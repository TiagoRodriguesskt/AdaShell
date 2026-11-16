# Terminal Inteligente (estilo AdaOS) — carregado automaticamente pelo fish.
# Para desligar o logo ao abrir:  set -Ux ADAOS_NO_FASTFETCH 1

status is-interactive; or exit 0

# Programas instalados na sua pasta (starship, adaos-smart)
fish_add_path -g ~/.local/bin

# --- Cores da linha de comando (o que você digita) --------------------------
set -g fish_color_command F4EDE1 --bold     # comando que existe: marfim
set -g fish_color_error D0566B              # comando que não existe: vinho
set -g fish_color_param E8DFD0
set -g fish_color_quote 7FC8A9
set -g fish_color_redirection CDA869
set -g fish_color_operator CDA869
set -g fish_color_end CDA869
set -g fish_color_comment 6F7F78
set -g fish_color_autosuggestion 5E6E68      # sugestão cinza
set -g fish_color_valid_path --underline
set -g fish_pager_color_prefix CDA869 --bold
set -g fish_pager_color_progress E2C189
set -g fish_pager_color_description 8C9A94

# --- Prompt (starship), pastas inteligentes (zoxide) -----------------------
if type -q starship
    set -gx STARSHIP_CONFIG ~/.config/adaos/starship.toml
    starship init fish | source
end
if type -q zoxide
    zoxide init fish | source
end

# --- Atalhos de nomes (Debian usa nomes diferentes para alguns) -------------
if type -q batcat; and not type -q bat
    alias bat batcat
end
if type -q fdfind; and not type -q fd
    alias fd fdfind
end
if type -q bat; or type -q batcat
    set -gx BAT_THEME ansi
    alias cat 'bat --paging=never --style=plain'
end
if type -q eza
    alias ls 'eza --group-directories-first'
    alias ll 'eza -lh --git --group-directories-first'
    alias la 'eza -lah --git --group-directories-first'
    alias tree 'eza --tree --level=2'
else if type -q exa
    alias ls 'exa --group-directories-first'
    alias ll 'exa -lh --git --group-directories-first'
    alias la 'exa -lah --git --group-directories-first'
    alias tree 'exa --tree --level=2'
end

# --- Memória do último comando (para o fix e para a notificação) -----------
function __adaos_postexec --on-event fish_postexec
    set -l st $status
    set -l cmd (string trim -- $argv[1])
    test -z "$cmd"; and return
    # Não guardar os próprios comandos do terminal inteligente (mas avisar no fim)
    if not string match -qr '^(fix|ask|explain|smart)(\s|$)' -- $cmd
        set -g __adaos_last_cmd $cmd
        set -g __adaos_last_status $st
    end

    # Comando longo terminou? Avisa com notificação (bom para apt, builds...)
    if test -n "$CMD_DURATION"; and test $CMD_DURATION -gt 30000
        set -l prog (string split -f1 ' ' -- $cmd)
        if not contains -- $prog code vim nvim nano less man ssh htop btop top python3 ipython jupyter fish bash ollama
            and not string match -qr '^smart (pure|learn|dino)' -- $cmd
            if type -q notify-send
                set -l secs (math --scale=0 $CMD_DURATION / 1000)
                if test $st -eq 0
                    notify-send -a Terminal "✓ Terminou ($secs s)" "$cmd"
                else
                    notify-send -a Terminal -u critical "✗ Falhou ($secs s)" "$cmd"
                end
            end
        end
    end
end
