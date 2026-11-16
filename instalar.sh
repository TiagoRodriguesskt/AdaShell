#!/usr/bin/env bash
# Terminal Inteligente (estilo AdaOS) — instalador para Debian 12/13 + Xfce
#
# Uso:   bash instalar.sh            (pergunta se quer a IA local)
#        bash instalar.sh --ia       (instala a IA local sem perguntar)
#        bash instalar.sh --sem-ia   (só o terminal, sem IA)
#
# Rode como usuário comum (NÃO com sudo). O script pede a senha só para o apt.

set -uo pipefail

KIT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.config/adaos/backup-terminal"
MODELO_PADRAO="qwen2.5-coder:3b"

bronze() { printf '\033[38;2;205;168;105m%s\033[0m\n' "$*"; }
ok()     { printf '\033[38;2;63;167;127m  ✓ %s\033[0m\n' "$*"; }
aviso()  { printf '\033[38;2;208;86;107m  ! %s\033[0m\n' "$*"; }
etapa()  { echo; bronze "[$1/9] $2"; }

if [ "$(id -u)" -eq 0 ]; then
    aviso "Rode sem sudo: bash instalar.sh"
    exit 1
fi

IA="perguntar"
case "${1:-}" in
    --ia) IA="sim" ;;
    --sem-ia) IA="nao" ;;
    -h|--help|help) sed -n '2,9p' "$0"; exit 0 ;;
esac

mkdir -p "$BACKUP" "$HOME/.local/bin" "$HOME/.config/fish/conf.d" \
         "$HOME/.config/fish/functions" "$HOME/.config/adaos"

# Guarda uma cópia de um arquivo antes de trocar (só na primeira vez)
guardar() {
    local alvo="$1"
    local copia="$BACKUP/${alvo#"$HOME"/}"
    if [ -e "$alvo" ] && [ ! -e "$copia" ]; then
        mkdir -p "$(dirname "$copia")"
        cp -a "$alvo" "$copia"
    fi
}

# ---------------------------------------------------------------------------
etapa 1 "Pacotes do Debian (pede a senha)"
sudo apt-get update -qq || aviso "apt update falhou; continuando"
# shellcheck disable=SC1091
. /etc/os-release
pacotes=(fish fzf zoxide bat fd-find tealdeer command-not-found curl python3 fwupd
         smartmontools lm-sensors ncdu btop
         libnotify-bin fonts-jetbrains-mono)
if [ "${VERSION_ID:-0}" -ge 13 ] 2>/dev/null; then pacotes+=(eza); else pacotes+=(exa); fi
for p in "${pacotes[@]}"; do
    if dpkg -s "$p" >/dev/null 2>&1; then
        ok "$p (já instalado)"
    elif sudo apt-get install -y -qq "$p" >/dev/null 2>&1; then
        ok "$p"
    else
        aviso "$p não pôde ser instalado (o resto continua funcionando)"
    fi
done

# ---------------------------------------------------------------------------
etapa 2 "Prompt starship (na sua pasta, sem sudo)"
if command -v starship >/dev/null 2>&1 || [ -x "$HOME/.local/bin/starship" ]; then
    ok "starship já instalado"
else
    if curl -fsSL https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin" >/dev/null; then
        ok "starship instalado em ~/.local/bin"
    else
        aviso "não consegui baixar o starship; o prompt padrão do fish será usado"
    fi
fi

# ---------------------------------------------------------------------------
etapa 3 "fastfetch (informações da máquina ao abrir)"
if command -v fastfetch >/dev/null 2>&1; then
    ok "fastfetch já instalado"
elif sudo apt-get install -y -qq fastfetch >/dev/null 2>&1; then
    ok "fastfetch (apt)"
elif [ "$(dpkg --print-architecture)" = "amd64" ]; then
    tmp="$(mktemp -d)"
    if curl -fsSL -o "$tmp/fastfetch.deb" \
        https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb \
        && sudo apt-get install -y -qq "$tmp/fastfetch.deb" >/dev/null 2>&1; then
        ok "fastfetch (pacote oficial do GitHub)"
    else
        aviso "fastfetch não instalado (opcional)"
    fi
    rm -rf "$tmp"
fi

# ---------------------------------------------------------------------------
etapa 4 "Bancos de dados de ajuda (tldr e command-not-found)"
# O tealdeer do Debian 12 (1.5.0) usa um endereço antigo, já desligado.
# Abaixo de 1.7.3, instala o binário novo do GitHub em ~/.local/bin.
versao_tldr="$(tldr --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)"
if [ -n "$versao_tldr" ] && [ "$(printf '%s\n1.7.3\n' "$versao_tldr" | sort -V | head -1)" != "1.7.3" ]; then
    case "$(dpkg --print-architecture)" in
        amd64) arq=x86_64 ;; arm64) arq=aarch64 ;; *) arq="" ;;
    esac
    if [ -n "$arq" ] && curl -fsSL -o "$HOME/.local/bin/tldr.novo" \
        "https://github.com/tealdeer-rs/tealdeer/releases/latest/download/tealdeer-linux-$arq-musl"; then
        chmod +x "$HOME/.local/bin/tldr.novo" && mv "$HOME/.local/bin/tldr.novo" "$HOME/.local/bin/tldr"
        ok "tealdeer novo instalado em .local/bin, na sua pasta (o do Debian $versao_tldr usa endereço antigo)"
    fi
fi
TLDR="$(command -v tldr)"; [ -x "$HOME/.local/bin/tldr" ] && TLDR="$HOME/.local/bin/tldr"
if [ -n "$TLDR" ]; then
    if "$TLDR" --update >/dev/null 2>&1; then ok "exemplos do tldr atualizados"; else aviso "tldr --update falhou"; fi
fi
command -v update-command-not-found >/dev/null 2>&1 && \
    sudo update-command-not-found >/dev/null 2>&1 && ok "command-not-found atualizado"

# ---------------------------------------------------------------------------
etapa 5 "Arquivos do Terminal Inteligente"
for f in "$KIT"/fish/conf.d/*.fish; do
    destino="$HOME/.config/fish/conf.d/$(basename "$f")"
    guardar "$destino"; cp "$f" "$destino"
done
for f in "$KIT"/fish/functions/*.fish; do
    destino="$HOME/.config/fish/functions/$(basename "$f")"
    guardar "$destino"; cp "$f" "$destino"
done
install -m 755 "$KIT/bin/adaos-smart" "$HOME/.local/bin/adaos-smart"
install -m 755 "$KIT/bin/adaos-dino" "$HOME/.local/bin/adaos-dino"
cp "$KIT/tema/starship.toml" "$HOME/.config/adaos/starship.toml"
if [ ! -f "$HOME/.config/adaos/smart.conf" ]; then
    printf '# Terminal Inteligente (AdaOS) — configuração\nMODEL=%s\nOLLAMA_URL=http://127.0.0.1:11434\nTIMEOUT=120\n' \
        "$MODELO_PADRAO" > "$HOME/.config/adaos/smart.conf"
fi
ok "fish: comandos ask, explain, fix, smart (e o jogo smart dino) + atalhos Alt+A e Alt+E"

# ---------------------------------------------------------------------------
etapa 6 "Bash com o mesmo prompt (para quando você usar o bash)"
guardar "$HOME/.bashrc"
if ! grep -q '>>> terminal-inteligente >>>' "$HOME/.bashrc" 2>/dev/null; then
    cat >> "$HOME/.bashrc" <<'EOF'

# >>> terminal-inteligente >>>
export PATH="$HOME/.local/bin:$PATH"
if command -v starship >/dev/null 2>&1; then
    export STARSHIP_CONFIG="$HOME/.config/adaos/starship.toml"
    eval "$(starship init bash)"
fi
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init bash)"
# <<< terminal-inteligente <<<
EOF
fi
ok "arquivo .bashrc"

# ---------------------------------------------------------------------------
etapa 7 "Terminal do Xfce: cores AdaOS, fonte JetBrains Mono e abrir no fish"
mkdir -p "$HOME/.local/share/xfce4/terminal/colorschemes"
cp "$KIT/tema/adaos.theme" "$HOME/.local/share/xfce4/terminal/colorschemes/adaos.theme"
RC="$HOME/.config/xfce4/terminal/terminalrc"
mkdir -p "$(dirname "$RC")"
guardar "$RC"
FISH_BIN="$(command -v fish || echo /usr/bin/fish)"
python3 - "$RC" "$KIT/tema/adaos.theme" "$FISH_BIN" <<'EOF'
import configparser, sys
rc_path, theme_path, fish = sys.argv[1:4]
theme = configparser.ConfigParser(); theme.optionxform = str
theme.read(theme_path)
rc = configparser.ConfigParser(); rc.optionxform = str
rc.read(rc_path)
if not rc.has_section("Configuration"):
    rc.add_section("Configuration")
c = rc["Configuration"]
for k, v in theme["Scheme"].items():
    if k != "Name":
        c[k] = v
c["FontUseSystem"] = "FALSE"
c["FontName"] = "JetBrains Mono 11"
c["RunCustomCommand"] = "TRUE"
c["CustomCommand"] = fish
# Sem isto, o Alt+A/Alt+E abririam os menus Arquivo/Editar do terminal
c["ShortcutsNoMnemonics"] = "TRUE"
with open(rc_path, "w") as f:
    rc.write(f, space_around_delimiters=False)
EOF
# xfce4-terminal 1.1 ou mais novo guarda as preferências no xfconf
if command -v xfconf-query >/dev/null 2>&1 && \
   xfconf-query -c xfce4-terminal -l >/dev/null 2>&1; then
    xq() { xfconf-query -c xfce4-terminal -p "$1" -n -t "$2" -s "$3" 2>/dev/null; }
    xq /color-foreground string "#F4EDE1"
    xq /color-background string "#000000"
    xq /color-cursor string "#CDA869"
    xq /color-cursor-use-default bool false
    xq /color-palette string "$(grep '^ColorPalette=' "$KIT/tema/adaos.theme" | cut -d= -f2)"
    xq /font-use-system bool false
    xq /font-name string "JetBrains Mono 11"
    xq /run-custom-command bool true
    xq /custom-command string "$FISH_BIN"
    xq /shortcuts-no-mnemonics bool true
fi
ok "cores, fonte, fish e Alt+A/Alt+E liberados — feche e abra o terminal"

# ---------------------------------------------------------------------------
etapa 8 "IA local (Ollama) — opcional, ~2 GB"
if [ "$IA" = "perguntar" ]; then
    echo "  A IA faz o ask, o explain e o fix. Roda no seu notebook, sem internet depois de baixada."
    read -r -p "  Instalar agora? [s/N] " resp
    case "$resp" in s|S|sim|SIM) IA="sim" ;; *) IA="nao" ;; esac
fi
if [ "$IA" = "sim" ]; then
    if ! command -v ollama >/dev/null 2>&1; then
        curl -fsSL https://ollama.com/install.sh | sh || aviso "falha ao instalar o Ollama"
    fi
    if command -v ollama >/dev/null 2>&1; then
        sudo systemctl enable --now ollama >/dev/null 2>&1 || true
        sleep 2
        modelo="$(grep '^MODEL=' "$HOME/.config/adaos/smart.conf" | cut -d= -f2)"
        ollama pull "$modelo" && ok "modelo $modelo pronto"
    fi
else
    ok "pulado — dá para instalar depois com: bash instalar.sh --ia"
fi

# ---------------------------------------------------------------------------
etapa 9 "Pronto"
echo
bronze "Feche e abra o terminal. Depois experimente:"
echo "  ask mostre as 5 pastas que mais ocupam espaço aqui"
echo "  explain tar -xzvf arquivo.tar.gz"
echo "  smart status     smart tips"
echo
echo "Para desfazer: bash $KIT/desfazer.sh"
