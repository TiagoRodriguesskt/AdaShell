<div align="center">

# 🜂 AdaShell

**Um terminal inteligente para Linux — entende português, explica comandos, corrige erros e ensina.**
*A smart Linux terminal that understands plain language, explains commands, fixes errors and teaches.*

Estilo [AdaOS](https://github.com/TiagoRodriguesskt) · Debian 12/13 + Xfce · Python puro · IA 100% local

![Shell](https://img.shields.io/badge/shell-fish-1E2A24)
![Python](https://img.shields.io/badge/python-3.9%2B-CDA869)
![IA local](https://img.shields.io/badge/IA-Ollama%20(local)-3FA77F)
![Licença](https://img.shields.io/badge/licen%C3%A7a-MIT-6E1F2E)

</div>

---

## O que é

O **AdaShell** transforma o terminal do Linux numa ferramenta que ajuda enquanto você trabalha, sem deixar de ser um terminal de verdade. Todos os comandos normais (`ls`, `grep`, `sudo apt`, `git`…) continuam iguais; por cima deles, o AdaShell acrescenta:

- **`ask`** — você escreve o que quer em português e ele monta o comando.
- **`explain`** — explica qualquer comando, parte por parte.
- **`fix`** — descobre por que o último comando deu erro e sugere a correção.
- **`smart`** — um canivete suíço: atualizar o sistema, limpar espaço, ver a saúde do PC, a rede, as portas abertas, atualizar a BIOS, um modo treino e até um jogo.
- **`smart learn`** — 27 aulas de terminal, uma por vez.

A IA roda no **seu próprio computador** (via [Ollama](https://ollama.com)): depois de baixada, nada é enviado para a internet. O AdaShell também funciona **sem IA** — sugestões, buscas, limpeza, saúde, aulas e o jogo não dependem dela.

```
(quantum) tiago@Warzone:~/AdaLab main *? ⏱ 5s $ ask quais pastas ocupam mais espaço aqui

  du -sh * | sort -h | tail -5

  Mostra o tamanho de cada item, ordena do menor para o maior e pega os 5 últimos.
  ✓ Seguro: só lê ou cria coisas, não apaga nada

Executar? [s/N]
```

## Destaques

| | |
| --- | --- |
| 🗣️ **Português → comando** | `ask` e o atalho **Alt+A** |
| 📖 **Aprende com você** | `explain` em qualquer comando; `smart learn` com 27 aulas e exercícios |
| 🛟 **Seguro por padrão** | todo comando é analisado em 3 níveis de risco; os perigosos pedem `SIM` |
| 🔒 **Privado** | a IA é local (Ollama). Nada sai do seu computador |
| 🧰 **Manutenção num comando** | `smart update`, `smart clean`, `smart health`, `smart net`, `smart ports` |
| 🎓 **Não vicia** | cada `smart` mostra "Por baixo" com o comando Linux equivalente; o `smart pure` treina você para servidores |
| 🦖 **Diversão** | `smart dino`, um jogo de corrida no terminal com física calibrada pelo jogo do Chrome |
| 🎨 **Visual AdaOS** | prompt starship, cores esmeralda/bronze/vinho, fonte JetBrains Mono |

## Requisitos

- **Debian 12/13 com Xfce** (funciona em outras distros baseadas em Debian; o essencial é o shell **Fish**).
- Acesso a `sudo` para instalar os pacotes.
- **Opcional:** [Ollama](https://ollama.com) para a IA (`ask`, `explain`, `fix`) — cerca de 2 GB. O instalador oferece instalar.

## Instalação

```bash
git clone https://github.com/TiagoRodriguesskt/AdaShell.git
cd AdaShell
bash instalar.sh
```

Rode **sem `sudo`** (o script pede a senha só quando precisa). Ele pergunta se você quer a IA local. Ao terminar, **feche e abra o terminal** e confira:

```fish
smart status      # a IA está pronta?
smart help        # todos os comandos
```

Opções do instalador: `bash instalar.sh --ia` (instala a IA sem perguntar) · `--sem-ia` (só o terminal).

## Comandos

### Com IA (precisam do Ollama)

| Comando | O que faz |
| --- | --- |
| `ask <pedido>` | Pedido em português → comando (mostra risco e pergunta antes de rodar) |
| `explain [comando]` | Explica um comando parte por parte (sem nada: o último) |
| `fix` | Analisa o último erro e sugere a correção |

### Manutenção e sistema

| Comando | O que faz |
| --- | --- |
| `smart update` | Atualiza sistema, ferramentas e IA (`--check`, `--yes`, `--full`, `system`/`tools`/`ai`) |
| `smart firmware` | Reconhece a máquina e atualiza a BIOS via fwupd/LVFS (`--check`, `update`) |
| `smart clean` | Mostra o que dá para apagar e libera espaço (`--check`) |
| `smart health` | Disco, memória, temperatura, bateria, serviços (`--disk` inclui o SSD) |
| `smart net` | IPs, Wi-Fi, roteador, DNS, internet, IP público, VPN (`--local`) |
| `smart ports` | Portas abertas, o programa de cada uma e quem pode acessar |
| `smart big [pasta] [n]` | O que mais ocupa espaço numa pasta |

### Aprender e praticar

| Comando | O que faz |
| --- | --- |
| `smart learn` | 27 aulas de terminal (`next`, `list`, `<nº>`, `<assunto>`, `reset`) |
| `smart pure` | Modo treino: Bash puro, como num servidor; no fim, resumo dos acertos e erros |
| `smart dino` | Jogo de corrida no terminal (`stats`, `reset`) |
| `smart tips` | Truques do terminal |

### Atalhos de teclado

| Atalho | O que faz |
| --- | --- |
| **Alt+A** | Texto em português na linha → comando (dá para editar antes do Enter) |
| **Alt+E** | Explica o comando que está na linha |
| **→** | Aceita a sugestão cinza (do histórico) |
| **Ctrl+R** / **Ctrl+T** / **Alt+C** | Busca no histórico / arquivo / pasta (fzf) |

### Funciona sem IA

Erro de digitação (`gti` → "Você quis dizer: git?"), pacote que falta, sugestão cinza do histórico, cores que mostram se o comando existe, buscas com fzf, `z <nome>` para pular de pasta, e notificação quando um comando demora mais de 30 s.

## Segurança

Cada comando é classificado **pelo próprio AdaShell** (não pela IA), em três níveis:

- ✓ **Seguro** — pergunta `[s/N]`.
- ⚠ **Atenção** (`sudo`, `rm`, `>`, `kill`…) — mostra o motivo e pergunta `[s/N]`.
- ⚠ **Perigoso** (`rm -rf ~`, `dd of=/dev/…`, `mkfs`, `curl | sh`…) — só roda se você digitar `SIM`.

Nada é executado sem a sua confirmação.

## O jogo: `smart dino`

```
            ▄█▄
           ▀▀▀▀▀                          ◁◉██▀▀▀▄▄
          █◉████▄                            ▀▄
      ▄  ▄████▀▀            ▄▀█▀▄
      ▀█▄█████▄             █ ◎ █
         █▀  ▀█             ▀▄█▄▀
▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
```

Um dinossauro steampunk corre por um mundo de engrenagens. **Espaço** pula, **↓** abaixa, **q** sai. A física do pulo foi calibrada pelas constantes do jogo original do Chrome, e a altura se ajusta ao tamanho da janela. Tem dia e noite, recorde salvo e pausa. O código (`bin/adaos-dino`) é um bom exemplo de jogo em `curses` para estudar.

## Desinstalar

```bash
bash desfazer.sh
```

Remove os arquivos do AdaShell e devolve as configurações que existiam antes. Não remove os pacotes (`fish`, `fzf`, Ollama…); para isso, use o `apt`.

## Para estudar o código

Tudo é **Python puro** (só biblioteca padrão) e scripts de shell:

| Arquivo | O que é |
| --- | --- |
| [`bin/adaos-smart`](bin/adaos-smart) | O "cérebro": IA, análise de risco, limpeza, saúde, rede, aulas |
| [`bin/adaos-dino`](bin/adaos-dino) | O jogo (Python + `curses`) |
| [`fish/`](fish/) | Comandos e atalhos do Fish |
| [`tema/`](tema/) | Prompt (starship) e cores do terminal |
| [`instalar.sh`](instalar.sh) / [`desfazer.sh`](desfazer.sh) | Instala e desfaz |

## Documentação completa

A referência detalhada — cada comando com exemplos, a física do jogo, as fórmulas, solução de problemas e ideias de exercícios — está em **[docs/DOCUMENTACAO.md](docs/DOCUMENTACAO.md)**.

Veja também o **[CHANGELOG.md](CHANGELOG.md)**.

## Licença

[MIT](LICENSE) © 2026 Tiago Rodrigues

<div align="center">
<sub>Feito para o notebook, para a empresa e para aprender. · <em>"Onde a ciência encontra a lógica."</em></sub>
</div>
