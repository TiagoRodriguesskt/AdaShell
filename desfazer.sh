#!/usr/bin/env bash
# Desfaz o Terminal Inteligente: tira os arquivos do kit e devolve as cópias
# guardadas pelo instalar.sh. Não desinstala pacotes nem o Ollama.
set -uo pipefail

KIT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.config/adaos/backup-terminal"

for f in "$KIT"/fish/conf.d/*.fish; do rm -f "$HOME/.config/fish/conf.d/$(basename "$f")"; done
for f in "$KIT"/fish/functions/*.fish; do rm -f "$HOME/.config/fish/functions/$(basename "$f")"; done
rm -f "$HOME/.local/bin/adaos-smart" "$HOME/.local/bin/adaos-dino" "$HOME/.config/adaos/starship.toml" \
      "$HOME/.local/share/xfce4/terminal/colorschemes/adaos.theme"

# Tira o bloco do .bashrc
if [ -f "$HOME/.bashrc" ]; then
    sed -i '/# >>> terminal-inteligente >>>/,/# <<< terminal-inteligente <<</d' "$HOME/.bashrc"
fi

# Devolve as cópias (arquivos que existiam antes da instalação)
if [ -d "$BACKUP" ]; then
    (cd "$BACKUP" && find . -type f ! -name .bashrc) | while read -r rel; do
        mkdir -p "$(dirname "$HOME/$rel")"
        cp -a "$BACKUP/$rel" "$HOME/$rel"
    done
fi

# Se o terminalrc não existia antes, apaga o criado pelo kit (o Xfce recria o padrão)
[ -e "$BACKUP/.config/xfce4/terminal/terminalrc" ] || rm -f "$HOME/.config/xfce4/terminal/terminalrc"

# xfce4-terminal novo (xfconf): volta a abrir o shell padrão
if command -v xfconf-query >/dev/null 2>&1; then
    xfconf-query -c xfce4-terminal -p /run-custom-command -s false 2>/dev/null || true
fi

echo "Terminal Inteligente removido. Feche e abra o terminal."
echo "Pacotes (fish, fzf, Ollama...) continuam instalados; remova com apt se quiser."
