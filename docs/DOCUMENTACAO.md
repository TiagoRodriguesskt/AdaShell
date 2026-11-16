# AdaShell (Terminal Inteligente) — Documentação

Um terminal no estilo do AdaOS que entende português, explica comandos, corrige erros e sugere enquanto você digita. Roda no Debian 12/13 com Xfce. A IA fica no próprio notebook (Ollama): depois de baixada, nada vai para a internet.

Criado em 13/11/2026 (kit v1); atualizado em 13/11/2026 (kit v3.12, modelo de IA escolhido pela RAM da máquina). Testado com Fish 3.7 e uma IA simulada; o `smart update` foi testado no notebook (Debian 12) em 13/11/2026 e atualizou tudo.

## Cola rápida (para decorar)

O terminal continua tendo **todos os comandos normais do Linux** (`cd`, `ls`, `cp`, `mv`, `rm`, `grep`, `find`, `sudo apt ...`, `git`, `python3`...). Por cima deles você ganhou **comandos novos**, que só existem no seu terminal.

Os comandos `smart` mostram no fim uma parte **"Por baixo"**, com os comandos normais do Linux que fazem o mesmo trabalho. Assim você usa o atalho e aprende o comando de verdade.

### Meus comandos novos

| Comando | O que faz | Exemplo |
| --- | --- | --- |
| `ask <pedido>` | Português → comando; pergunta antes de rodar | `ask mostre os arquivos maiores que 1 GB` |
| `explain <comando>` | Explica um comando parte por parte. **É um comando sozinho** (não precisa de `smart` na frente), mas `smart explain` e `smart learn explain` também funcionam | `explain chmod +x script.sh` |
| `explain` | Explica o último comando que você rodou | `explain` |
| `fix` | Analisa o último erro e sugere a correção | (depois de um erro) `fix` |
| `smart help` | Lista os comandos e atalhos | |
| `smart status` | A IA está ligada e pronta? | |
| `smart model [nome]` | Mostra ou troca o modelo da IA | `smart model qwen2.5-coder:7b` |
| `smart tips` | Todos os truques | |
| `smart update` | Atualiza sistema, ferramentas e IA | |
| `smart update --check` | Só mostra o que tem de novo | |
| `smart update --yes` | Atualiza sem perguntar | |
| `smart update --full` | Atualiza com `full-upgrade` (inclui os pacotes "mantidos"; mostra antes o que seria removido) | |
| `smart update --check --full` | Só mostra o que o `full-upgrade` removeria | |
| `smart firmware` | Mostra a máquina (fabricante, modelo, BIOS, energia) e se a BIOS pode ser atualizada pelo Linux | |
| `smart firmware --check` | Procura BIOS nova e mostra o que muda | |
| `smart firmware update` | Atualiza a BIOS (com verificações e confirmação SIM) | |
| `smart clean` | Mostra o que dá para apagar e você escolhe (cache, órfãos, logs, lixeira...) | |
| `smart clean --check` | Só mostra quanto espaço dá para liberar | |
| `smart health` | Saúde: disco, memória, temperatura, bateria, serviços | |
| `smart health --disk` | Inclui a saúde do SSD (pede a senha) | |
| `smart net` | Rede: IPs, Wi-Fi, roteador, DNS, internet, IP público, VPN | |
| `smart net --local` | Sem consultar o IP público | |
| `smart ports` | Portas abertas, o programa de cada uma e quem pode acessar | |
| `smart big [pasta] [n]` | O que mais ocupa espaço numa pasta | `smart big ~/Downloads 20` |
| `smart learn` | Aula de terminal atual | |
| `smart learn next` | Próxima aula | |
| `smart learn list` | Todas as aulas (✓ = vista) | |
| `smart learn <número>` / `<assunto>` | Vai para uma aula | `smart learn 11`, `smart learn grep` |
| `smart learn reset` | Recomeça as aulas | |
| `smart pure` | **Modo treino**: Bash puro, como num servidor da empresa. `exit` volta e mostra o resumo | |
| `smart dino` | **Jogo** de corrida no terminal | |
| `smart dino stats` | Recorde, partidas, pulos e tempo jogando | |
| `smart dino reset` | Apaga o recorde | |
| `smart update system` / `tools` / `ai` | Atualiza só uma parte | `smart update ai` |
| `z <nome>` | Pula para uma pasta que você já visitou | `z adalab` |
| `zi` | Escolhe a pasta numa lista | |
| `tldr <comando>` | Exemplos práticos de um comando | `tldr tar` |
| `ll` / `la` | Lista detalhada (com ocultos no `la`) e estado do Git | |
| `<comando> help` | Ajuda de qualquer comando novo | `ask help`, `fix help` |

### Meus atalhos de teclado

| Atalho | O que faz |
| --- | --- |
| **Alt+A** | Texto em português na linha → comando |
| **Alt+E** | Explica o comando da linha |
| **→** | Aceita a sugestão cinza |
| **Ctrl+R** | Busca no histórico |
| **Ctrl+T** | Busca um arquivo |
| **Alt+C** | Entra numa pasta |

### Comandos antigos que mudaram de cara

Alguns comandos do Linux continuam existindo, mas o terminal troca por uma versão mais bonita:

| Você digita | Roda de verdade | Para usar o original |
| --- | --- | --- |
| `ls` | `exa` com pastas primeiro | `command ls` |
| `cat` | `bat` (com cores) | `command cat` |
| `tree` | `exa --tree` | `command tree` (se instalado) |

`command <nome>` pula o apelido e roda o programa original. Útil quando um tutorial depende da saída exata do comando normal.

### Antigo × novo: o mesmo trabalho

| Tarefa | Jeito tradicional | Jeito novo |
| --- | --- | --- |
| Atualizar tudo | `sudo apt update && sudo apt upgrade` + `flatpak update` + ... | `smart update` |
| Atualizar com full-upgrade | `sudo apt update && sudo apt full-upgrade` | `smart update --full` |
| Ver qual é a máquina e a BIOS | `cat /sys/class/dmi/id/...` ou `sudo dmidecode` | `smart firmware` |
| Liberar espaço | `sudo apt clean`, `sudo apt autoremove`, `sudo journalctl --vacuum-time=2weeks`, esvaziar a lixeira... | `smart clean` |
| Ver a saúde do PC | `df -h`, `free -h`, `uptime`, `sensors`, `upower -i ...`, `systemctl --failed` | `smart health` |
| Ver a rede | `ip -br addr`, `ip route`, `nmcli dev wifi`, `curl ipinfo.io` | `smart net` |
| Ver portas abertas | `sudo ss -tulpn` | `smart ports` |
| Achar o que ocupa espaço | `du -sh * \| sort -h`, `find . -size +100M` | `smart big` |
| Aprender um comando | `man`, `tldr` | `smart learn` |
| Treinar para o servidor da empresa | abrir um `bash` | `smart pure` (com resumo dos erros) |
| Atualizar a BIOS | baixar do site do fabricante (muitas vezes só para Windows) ou `fwupdmgr refresh` + `get-updates` + `update` | `smart firmware --check` e `smart firmware update` |
| Lembrar um comando | pesquisar na internet | `ask <o que quero>` |
| Entender um comando | `man <comando>` | `explain <comando>` |
| Achar um comando antigo | `history \| grep ...` | **Ctrl+R** |
| Ir para uma pasta | `cd ~/Estudos/Fisica/Quantica` | `z quantica` |
| Corrigir um erro | ler a mensagem e pesquisar | `fix` |

## Sumário

1. [O que é](#1-o-que-é)
2. [Onde o terminal fica (pastas)](#2-onde-o-terminal-fica-pastas)
3. [Instalar](#3-instalar)
4. [Comandos](#4-comandos)
5. [Atalhos de teclado](#5-atalhos-de-teclado)
6. [Recursos que funcionam sem IA](#6-recursos-que-funcionam-sem-ia)
7. [Segurança: os níveis de risco](#7-segurança-os-níveis-de-risco)
8. [Como funciona por dentro](#8-como-funciona-por-dentro)
9. [Configuração](#9-configuração)
10. [Visual: prompt e cores](#10-visual-prompt-e-cores)
11. [Problemas comuns](#11-problemas-comuns)
12. [Desfazer](#12-desfazer)
13. [Estudar e modificar o código](#13-estudar-e-modificar-o-código)
14. [Histórico de versões](#14-histórico-de-versões)

---

## 1. O que é

O Terminal Inteligente junta três camadas:

| Camada | Ferramentas | Para que serve |
| --- | --- | --- |
| Shell | **Fish** | Sugestões em cinza pelo histórico, cores que mostram se o comando existe, Tab inteligente |
| Ferramentas | **starship**, **fzf**, **zoxide**, **bat**, **eza/exa**, **fd**, **tldr**, **fastfetch** | Prompt do AdaOS, buscas, pular de pasta, listagens e leitura com cores |
| IA local (opcional) | **Ollama** + um modelo de linguagem (escolhido pela RAM, veja abaixo) + **adaos-smart** (Python) | `ask`, `explain`, `fix`, Alt+A e Alt+E |

> ### 🧠 Qual modelo de IA o AdaShell usa?
>
> O AdaShell **não traz uma IA embutida**. Ele usa o **Ollama**, que roda um modelo de linguagem **no seu próprio computador**, gastando processador e memória RAM. O instalador lê a RAM e escolhe o modelo:
>
> | RAM do computador | Modelo | Download |
> | --- | --- | --- |
> | Menos de 4 GB | **nenhum** (não instale a IA) | — |
> | 4 a 8 GB | `qwen2.5-coder:1.5b` | ~1 GB |
> | 8 a 16 GB | **`qwen2.5-coder:3b`** (padrão) | ~2 GB |
> | 16 GB ou mais | `qwen2.5-coder:3b` ou `qwen2.5-coder:7b` | ~2 / ~4,7 GB |
>
> **Não use modelos grandes (13b, 30b, 70b…) em notebook**: podem travar o sistema. Ver o modelo em uso: `smart model` · trocar: `smart model <nome>` · detalhes na seção 9.

Segue as regras do AdaOS: **comandos em inglês** (`ask`, `explain`, `fix`, `smart`), **mensagens em português**, todo comando aceita `help`, visual escuro (esmeralda, bronze, vinho e marfim).

## 2. Onde o terminal fica (pastas)

O terminal não é um programa único: são arquivos de configuração espalhados nas pastas padrão do Linux. Quase tudo fica na sua pasta pessoal (`~` = `/home/tiago`), sem precisar de administrador.

### Arquivos instalados

| Pasta / arquivo | O que é |
| --- | --- |
| `~/.local/bin/adaos-dino` | O jogo `smart dino` (arquivo separado, para estudar) |
| `~/.local/bin/adaos-smart` | **O "cérebro"**: programa em Python que conversa com a IA, analisa o risco e sugere correções de digitação |
| `~/.config/fish/conf.d/adaos-terminal.fish` | Carregado toda vez que o Fish abre: cores, starship, zoxide, apelidos (`ll`, `cat`...) e notificações |
| `~/.config/fish/functions/ask.fish` | Comando `ask` |
| `~/.config/fish/functions/explain.fish` | Comando `explain` |
| `~/.config/fish/functions/fix.fish` | Comando `fix` |
| `~/.config/fish/functions/smart.fish` | Comando `smart` (atalho para o `adaos-smart`) |
| `~/.config/fish/functions/__adaos_run_suggestion.fish` | Pergunta "Executar?" e roda a sugestão da IA |
| `~/.config/fish/functions/__adaos_nl2cmd.fish` | Atalho Alt+A |
| `~/.config/fish/functions/__adaos_explain_line.fish` | Atalho Alt+E |
| `~/.config/fish/functions/fish_user_key_bindings.fish` | Registra os atalhos (Alt+A, Alt+E, Ctrl+R, Ctrl+T, Alt+C) |
| `~/.config/fish/functions/fish_greeting.fish` | Mensagem ao abrir: fastfetch + dica do dia |
| `~/.config/fish/functions/fish_command_not_found.fish` | O que aparece quando o comando não existe |
| `~/.config/adaos/smart.conf` | Configuração da IA (modelo, endereço, tempo limite) |
| `~/.config/adaos/starship.toml` | Formato e cores do prompt |
| `~/.config/adaos/learn.json` | Seu progresso nas aulas do `smart learn` |
| `~/.config/adaos/dino.json` | Recorde e estatísticas do `smart dino` |
| `~/.config/adaos/pure_history` | Histórico dos comandos do modo treino (separado do seu histórico normal) |
| `~/.config/adaos/backup-terminal/` | Cópia dos seus arquivos antigos, guardada antes da instalação |
| `~/.cache/adaos/last-suggestion` e `last-risk` | Última sugestão da IA e o nível de risco dela (temporários) |
| `~/.local/share/xfce4/terminal/colorschemes/adaos.theme` | Esquema de cores "AdaOS" do terminal do Xfce |
| `~/.config/xfce4/terminal/terminalrc` | Preferências do terminal do Xfce (cores, fonte, abrir no Fish) |
| `~/.bashrc` | Ganha um bloco entre `# >>> terminal-inteligente >>>` e `# <<< terminal-inteligente <<<` (prompt igual no Bash) |
| `~/.local/bin/starship` | O programa do prompt (instalado sem sudo) |
| `~/.local/bin/tldr` | O **tealdeer** novo, do GitHub. Substitui o do Debian 12 (1.5.0), que usa um endereço desativado (ver seção 11) |

### Arquivos do sistema (instalados pelo apt e pelo Ollama)

| Pasta / arquivo | O que é |
| --- | --- |
| `/usr/bin/fish`, `/usr/bin/fzf`, `/usr/bin/zoxide`, `/usr/bin/batcat`, `/usr/bin/fdfind`, `/usr/bin/exa`... | Programas instalados pelo apt |
| `/usr/share/doc/fzf/examples/key-bindings.fish` | Atalhos do fzf, carregados pelo kit |
| `/usr/lib/command-not-found` | Diz qual pacote tem um comando que você não tem |
| `/usr/bin/fwupdmgr` | Atualizador de firmware/BIOS (pacote `fwupd`), usado pelo `smart firmware` |
| `/sys/class/dmi/id/` | Tabela DMI: fabricante, modelo e versão da BIOS (o `smart firmware` lê daqui) |
| `/sys/class/power_supply/` | Carregador e bateria (o `smart firmware` confere antes de gravar a BIOS) |
| `/usr/sbin/smartctl` | Lê a saúde do SSD/HD (pacote `smartmontools`), usado pelo `smart health --disk` |
| `sensors`, `ncdu`, `btop` | Temperaturas (`lm-sensors`), navegador de espaço e monitor do sistema; instalados para você praticar o que o "Por baixo" ensina |
| `/usr/local/bin/ollama` | Programa da IA local |
| `/usr/share/ollama/.ollama/models/` | **Onde ficam os modelos baixados** (~2 GB o `qwen2.5-coder:3b`) |
| serviço `ollama` (systemd) | Mantém a IA ligada em `http://127.0.0.1:11434` |

### A pasta do kit

O kit que você descompactou (`~/Downloads/terminal-inteligente/`) só serve para instalar e desfazer. Depois de instalado, o terminal funciona mesmo que você apague essa pasta. Guarde-a se quiser usar o `desfazer.sh`.

Para ver tudo de uma vez:

```bash
ls ~/.config/fish/functions/ ~/.config/adaos/ ~/.local/bin/
```

## 3. Instalar

```bash
git clone https://github.com/TiagoRodriguesskt/AdaShell.git
cd AdaShell
bash instalar.sh
```

> Também dá para baixar o .zip pelo botão **Code → Download ZIP** no GitHub, descompactar e rodar o `instalar.sh`.

Rode **sem sudo**: o script pede a senha só para o apt. As 9 etapas:

| Etapa | O que faz |
| --- | --- |
| 1 | Instala os pacotes do Debian, um por um (se um falhar, os outros continuam) |
| 2 | Instala o starship em `~/.local/bin` |
| 3 | Instala o fastfetch (apt ou pacote oficial do GitHub) |
| 4 | Atualiza o tldr e o banco do command-not-found |
| 5 | Copia os arquivos do Fish, o `adaos-smart` e as configurações (guarda cópia do que já existia) |
| 6 | Coloca o prompt starship no Bash também |
| 7 | Terminal do Xfce: cores AdaOS, fonte JetBrains Mono 11, abrir direto no Fish |
| 8 | Pergunta se quer a IA local (Ollama + modelo, ~2 GB) |
| 9 | Mostra o resumo |

Opções:

| Comando | Efeito |
| --- | --- |
| `bash instalar.sh` | Pergunta sobre a IA |
| `bash instalar.sh --ia` | Instala a IA sem perguntar |
| `bash instalar.sh --sem-ia` | Só o terminal |

Depois, **feche e abra o terminal** e confira com `smart status`.

O instalador pode ser rodado de novo sem problema: ele não duplica nada e não apaga a cópia de segurança original.

## 4. Comandos

### `ask` — português → comando

```fish
ask mostre as 5 pastas que mais ocupam espaço aqui
```

Saída:

```
  du -sh * | sort -h | tail -5

  Mostra o tamanho de cada item da pasta, ordena do menor para o maior e pega os 5 últimos.
  ✓ Seguro: só lê ou cria coisas, não apaga nada

Executar? [s/N]
```

- **s** → roda. **Enter** ou **n** → cancela.
- Se o pedido não estiver claro, a IA pergunta o que falta em vez de inventar.
- O comando roda no próprio Fish (assim um `cd` continua valendo). Se ele usar sintaxe que só o Bash entende (`$(...)`, `[[ ]]`, `for ... do`), o terminal roda com `bash -c` automaticamente.
- A IA recebe como contexto: a versão do Debian, a pasta atual e os nomes de até 40 arquivos dela. Assim ela acerta nomes de arquivos.

Mais exemplos:

```fish
ask quais processos estão usando mais memória
ask encontre arquivos .py modificados nos últimos 7 dias
ask qual meu IP na rede local
ask compacte a pasta Projetos em um tar.gz
ask quanto espaço livre tem no disco
```

### `explain` — explica um comando

```fish
explain tar -xzvf arquivo.tar.gz
```

```
  tar -xzvf arquivo.tar.gz

  Extrai o conteúdo de um arquivo compactado .tar.gz.

  tar                    programa que junta e separa arquivos
  -x                     extrair
  -z                     descompactar com gzip
  -v                     mostrar cada arquivo extraído
  -f arquivo.tar.gz      o arquivo a ser lido

  ✓ Seguro: só lê ou cria coisas, não apaga nada
```

- `explain` **sozinho** explica o último comando que você rodou.
- Sem a IA, mostra o resumo offline do `tldr` (ou do `whatis`).
- Ótimo para estudar: rode `explain` em qualquer comando que encontrar num tutorial.

### `fix` — corrige o último erro

```fish
pyhton3 --version        # erro de digitação
fix
```

```
✗ pyhton3 --version (código 127)
Rodar de novo (até 20 s) para ler a mensagem de erro? [S/n] s
⚙ investigando o erro…

  Causa provável: o comando 'pyhton3' tem erro de digitação.

  python3 --version

  Roda o Python com o nome certo.
  ✓ Seguro: só lê ou cria coisas, não apaga nada

Executar? [s/N]
```

- O terminal guarda sozinho o último comando e o código de saída.
- Para ler a mensagem de erro, o `fix` roda o comando de novo (no máximo 20 s), **só se ele for seguro**. Se o comando altera o sistema (`sudo`, `rm`...), ele não roda de novo e analisa só o comando e o código.
- Se o último comando deu certo, ele avisa e pergunta se quer analisar mesmo assim.

### `smart` — controle do terminal

| Comando | O que faz |
| --- | --- |
| `smart help` | Lista os comandos e atalhos |
| `smart status` | Mostra se a IA está ligada e se o modelo está baixado |
| `smart model` | Mostra o modelo em uso |
| `smart model qwen2.5-coder:7b` | Troca o modelo |
| `smart update` | Atualiza o sistema, as ferramentas e a IA (ver abaixo) |
| `smart firmware` | Reconhece a máquina e atualiza a BIOS (ver abaixo) |
| `smart clean` | Libera espaço (ver abaixo) |
| `smart health` | Saúde do computador (ver abaixo) |
| `smart net` | Rede e internet (ver abaixo) |
| `smart ports` | Portas abertas (ver abaixo) |
| `smart big` | O que ocupa espaço (ver abaixo) |
| `smart learn` | Aulas de terminal (ver abaixo) |
| `smart pure` | Modo treino (ver abaixo) |
| `smart dino` | Jogo de corrida (ver abaixo) |
| `smart tips` | Todos os truques |
| `ask help`, `explain help`, `fix help` | Ajuda de cada comando |

### `smart update` — atualiza tudo de uma vez

Parecido com o `adaos update` do AdaOS. Algumas peças do terminal não vêm do apt e não se atualizam sozinhas; este comando cuida de todas.

```fish
smart update
```

Ele trabalha em **3 partes**, nesta ordem:

| Parte | Nome | O que atualiza | Como |
| --- | --- | --- | --- |
| 1 | `system` | Todos os pacotes do Debian (inclusive Fish, fzf, zoxide, bat...) e os apps Flatpak | `sudo apt update` + `sudo apt upgrade` + `flatpak update` |
| 2 | `tools` | **starship**, **fastfetch** (se veio do GitHub), **tealdeer** (o programa `tldr`) e seus exemplos, completar com **Tab** do Fish | Compara a versão instalada com a última do GitHub e só reinstala se houver uma mais nova |
| 3 | `ai` | **Ollama** e o **modelo** configurado | Compara a versão do Ollama com a do GitHub; `ollama pull` no modelo |

No fim aparece um resumo:

```
Resumo
  ✓ Pacotes do apt         atualizados
  ✓ Flatpak                atualizados
  ✓ starship               1.20.0 → 1.21.1
  ✓ fastfetch              2.30.1 (já é a mais nova)
  ✓ tealdeer (tldr)        1.9.1 (já é a mais nova)
  ✓ Exemplos do tldr       atualizados
  ✓ Completar com Tab      atualizado
  ✓ Ollama                 0.5.7 (já é a mais nova)
  ✓ Modelo qwen2.5-coder:3b em dia
  • Comandos ask/explain/fix: atualizam com um kit novo (bash instalar.sh)
```

`✓` deu certo · `✗` falhou · `•` só informação (nada foi feito).

**Opções:**

| Comando | O que faz |
| --- | --- |
| `smart update` | Tudo, perguntando `[S/n]` no apt e no Flatpak |
| `smart update --check` | **Só verifica**: mostra quantos pacotes e quais ferramentas têm versão nova, sem instalar nada |
| `smart update --yes` | Tudo, sem perguntar `[S/n]` |
| `smart update --full` | Tudo, usando `apt full-upgrade` no lugar do `apt upgrade` (ver abaixo) |
| `smart update --check --full` | Só verifica, e mostra também o que o `full-upgrade` removeria |
| `smart update system --full` | Só o sistema, com `full-upgrade` |
| `smart update system` | Só o sistema |
| `smart update tools` | Só as ferramentas do terminal |
| `smart update ai` | Só a IA |
| `smart update tools ai` | Duas partes (dá para combinar) |
| `smart update help` | Ajuda |

**`upgrade` × `full-upgrade` (a opção `--full`):**

| | `smart update` (usa `apt upgrade`) | `smart update --full` (usa `apt full-upgrade`) |
| --- | --- | --- |
| Atualiza os pacotes | ✓ | ✓ |
| Instala pacotes novos quando uma atualização precisa (ex.: kernel novo) | ✓ | ✓ |
| Atualiza os pacotes **"mantidos"** (*kept back*) | ✗ | ✓ |
| **Remove** pacotes para resolver um conflito | ✗ nunca | ✓ se for preciso |
| Troca a versão do Debian | ✗ | ✗ (só se `bookworm` for trocado no `sources.list`) |

"Mantidos" são atualizações que só acontecem removendo outro pacote. O `smart update` normal os deixa de lado e avisa no fim:

```
  1 pacote(s) mantido(s): linux-image-amd64
  Para atualizá-los: smart update system --full
```

Como o `--full` protege você:

1. Antes de mudar qualquer coisa, **simula** o `full-upgrade` com `apt-get -s` (só simula, não instala nem remove nada).
2. Mostra em vinho a lista do que **seria removido**:
   ```
   ⚠ O full-upgrade vai REMOVER 1 pacote(s):
     - linux-image-6.1.0-old
   ```
3. Se houver remoção, só continua se você digitar **SIM** em maiúsculas, mesmo com `--yes`. Qualquer outra resposta cancela e faz o `apt upgrade` normal, sem remover nada.
4. Se não houver remoção, mostra `✓ O full-upgrade não remove nenhum pacote` e segue normalmente.

Use o `--full` quando o `smart update` avisar que há pacotes mantidos. No dia a dia, o `smart update` normal basta.

**Detalhes importantes:**

- Pede a sua senha (sudo) só nos passos que precisam: apt e fastfetch.
- Continua no **Debian 12**: nem o `apt upgrade` nem o `full-upgrade` trocam a versão do Debian.
- **Como descobre a versão nova:** pergunta à API do GitHub (`api.github.com/repos/<projeto>/releases/latest`). Se a API não responder (ela tem limite de 60 consultas por hora), usa o plano B: abre `github.com/<projeto>/releases/latest`, que redireciona para a página da última versão, e lê o número no endereço. Sem internet, avisa e pula.
- **Os instaladores oficiais** (starship.rs e ollama.com) são baixados para um arquivo temporário e executados com `sh`, não com `curl | sh`. O arquivo é apagado depois.
- **fastfetch:** se ele veio de um repositório do apt, já é atualizado na parte 1. Se veio de um `.deb` do GitHub (o caso do Debian 12), o comando baixa o `.deb` novo e instala.
- **Comandos `ask`, `explain`, `fix` e o próprio `smart`** não são atualizados por aqui: eles mudam só quando sai um kit novo (`bash instalar.sh`).
- Ao terminar (se demorar mais de 30 s), aparece a notificação ✓/✗.
- Código de saída: `0` tudo certo · `1` alguma parte falhou · `2` opção errada.

**Rotina sugerida:** uma vez por semana, `smart update --check`; se tiver novidade, `smart update`.

Por dentro (para estudar o código, função `cmd_update` no `adaos-smart`):

| Função | O que faz |
| --- | --- |
| `version_tuple()` | Transforma `"starship 1.21.1"` em `(1, 21, 1)`. Tuplas se comparam número por número: `(1, 20, 0) < (1, 21, 1)` |
| `installed_version()` | Roda `programa --version` e extrai a versão |
| `latest_github_version()` | Descobre a última versão no GitHub (API + plano B) |
| `compare()` | Decide: não instalado / já é a mais nova / atualizar |
| `run_remote_installer()` | Baixa o instalador oficial e roda com `sh` |
| `simulate_apt()` | Roda `apt-get -s` (simulação) e lê as linhas `Inst` e `Remv` para saber o que seria instalado e removido |
| `show_removals()` | Mostra a lista de remoções em vinho |
| `fastfetch_from_github()` | Lê o `apt-cache policy` para saber de onde o fastfetch veio |
| `install_tealdeer()` | Baixa o binário do tealdeer e troca o arquivo de uma vez só (`Path.replace`), para nunca ficar pela metade |

### `smart firmware` — reconhece a máquina e atualiza a BIOS

```fish
smart firmware
```

```
Esta máquina
  Fabricante:   LENOVO
  Modelo:       ThinkPad ...  (21AH00EXBR)
  BIOS:         R23ET70W (1.46 )  de 03/15/2025 (LENOVO)
  Modo de boot: UEFI
  Energia:      carregador conectado, bateria 78%

Suporte do fabricante (LVFS)
  ✓ A BIOS pode ser atualizada pelo Linux  (fwupd vê a versão 0.1.46)
```

(Exemplo de um teste; o seu notebook mostra os dados dele.)

| Comando | O que faz |
| --- | --- |
| `smart firmware` | Mostra a máquina e se o fabricante dá suporte à atualização pelo Linux |
| `smart firmware --check` | Procura BIOS nova; mostra a versão atual → nova, a urgência, o que muda e o link das notas. Também avisa de outros firmwares com atualização (SSD, dock...) |
| `smart firmware update` | Grava a BIOS nova |
| `smart firmware help` | Ajuda |

**Como ele reconhece a máquina:** a BIOS grava os dados do computador numa tabela chamada **DMI**, que o Linux mostra como arquivos em `/sys/class/dmi/id/` (`sys_vendor`, `product_name`, `product_version`, `bios_version`, `bios_date`). Não precisa de senha. A Lenovo guarda o nome comercial ("ThinkPad ...") em `product_version` e um código em `product_name`; as outras marcas costumam fazer o contrário, e o comando trata os dois casos.

**De onde vem a BIOS nova:** do **fwupd** (programa `fwupdmgr`) e do **LVFS** (Linux Vendor Firmware Service), o serviço onde os fabricantes publicam as atualizações para Linux. O fwupd usa a mesma DMI para escolher a BIOS certa para o seu modelo. O `smart firmware` roda `fwupdmgr refresh` e `fwupdmgr get-updates --json` e mostra o resultado em português.

**Proteções do `update`:**

| Verificação | Por quê |
| --- | --- |
| Sistema iniciado em **modo UEFI** | O fwupd grava a BIOS por "cápsula UEFI"; no modo Legacy não funciona |
| **Carregador conectado** | Se o notebook desligar no meio da gravação, ele pode não ligar mais |
| **Bateria ≥ 50%** | Margem extra contra queda de energia |
| Avisos + digitar **SIM** | O notebook reinicia e grava antes do sistema abrir; não pode ser desligado |
| Atualiza **só a BIOS** | Passa o `DeviceId` da BIOS ao `fwupdmgr update`; outros firmwares ficam para você decidir |

Se alguma verificação falhar, ele explica o que fazer e não grava nada.

**O que acontece depois do SIM:**

1. O `fwupdmgr` baixa a BIOS, confere a assinatura do fabricante e pede a sua senha.
2. Pergunta se pode reiniciar. Salve tudo antes.
3. Na reinicialização, a BIOS é gravada **antes do sistema abrir**. A tela pode ficar com o logo do fabricante e uma barra de progresso por alguns minutos. **Não desligue.**
4. O Debian abre normalmente. Confira com `smart firmware`: a versão da BIOS deve ser a nova.

**⚠ A senha de supervisor:** em muitos notebooks (principalmente os ThinkPads), existe uma opção que exige a senha de supervisor para atualizar a BIOS. Se ela estiver ligada, a gravação pode ser recusada ou pedir a senha na reinicialização. Atualizar a BIOS **não remove** a senha. O ideal é resolver a senha antes de atualizar.

Por dentro (função `cmd_firmware` no `adaos-smart`):

| Função | O que faz |
| --- | --- |
| `machine_info()` | Lê a DMI e decide qual campo é o nome do modelo |
| `power_status()` | Lê `/sys/class/power_supply/*/type`, `online` (carregador) e `capacity` (bateria em %) |
| `uefi_mode()` | O sistema está em UEFI se a pasta `/sys/firmware/efi` existe |
| `fwupd_json()` | Roda `fwupdmgr ... --json` e transforma a resposta em dicionário Python |
| `is_system_firmware()` | Encontra a BIOS na lista de dispositivos (plugin `uefi_capsule`) |
| `strip_html()` | Limpa o HTML das notas da atualização para mostrar no terminal |

Funções dos comandos da v3 (para estudar):

| Função | O que faz |
| --- | --- |
| `under()` | Imprime a parte "Por baixo" |
| `human()` | Converte bytes em texto (`1536` → `1,5 KB`) dividindo por 1024 |
| `folder_size()` | Soma o tamanho dos arquivos de uma pasta com `os.walk` (o que o `du` faz) |
| `bar()` | Desenha a barra `████░░░` e escolhe a cor pela porcentagem |
| `cpu_temperature()` | Lê os sensores em `/sys/class/hwmon` (valores em milésimos de °C) |
| `meminfo()` | Lê `/proc/meminfo` (o que o `free` faz) |
| `battery_health()` | Divide `energy_full` por `energy_full_design` |
| `disk_smart()` | Roda `smartctl -j` (saída em JSON) para cada disco |
| `cmd_ports()` | Lê o `ss -tulpnH` e separa endereço, porta e programa com `rpartition(":")` e uma expressão regular |
| `LESSONS` | Lista das aulas; cada uma é uma tupla (título, explicação, exemplos, exercício) |
| `find_lesson()` / `LESSON_KEYWORDS` | Busca da aula: palavra exata → palavras do dia a dia → parte do título |
| `load_learn()` | Lê o progresso e corrige arquivos incompletos ou corrompidos |

### `smart clean` — libera espaço

```fish
smart clean --check     # só mostra
smart clean             # mostra e pergunta o que limpar
```

```
Limpeza
  1. Cache do apt                 412,0 MB  pacotes .deb já instalados, guardados à toa
  2. Pacotes órfãos                      —  3 pacote(s) que nada mais usa (inclui kernels antigos)
  3. Logs do sistema (journal)    880,0 MB  mantém só as 2 últimas semanas
  4. Miniaturas de imagens         96,3 MB  recriadas sozinhas quando você abre as pastas
  5. Lixeira                        1,2 GB  arquivos que você já mandou para a lixeira
  6. Cache do pip                 230,5 MB  downloads antigos de pacotes Python
  7. Cache do uv                    1,1 GB  downloads de pacotes Python do uv
  8. Flatpak sem uso                     —  runtimes que nenhum app usa mais

  Dá para liberar pelo menos 3,9 GB

  O que limpar? 1 3 4
```

(Números de exemplo.) Na pergunta, digite os **números** separados por espaço, **tudo** ou só **Enter** para cancelar. No fim ele mostra quanto foi liberado.

| Item | O que apaga | Comando por baixo | É seguro? |
| --- | --- | --- | --- |
| Cache do apt | Os `.deb` baixados, já instalados | `sudo apt-get clean` | Sim |
| Pacotes órfãos | Pacotes instalados como dependência que nada mais usa, inclusive kernels antigos | `sudo apt-get autoremove` | Sim (o apt mantém o kernel atual e o anterior) |
| Logs do sistema | Registros com mais de 2 semanas | `sudo journalctl --vacuum-time=2weeks` | Sim |
| Miniaturas | Imagens pequenas das pastas | apaga `~/.cache/thumbnails` | Sim, são recriadas |
| Lixeira | O que você mandou para a lixeira | esvazia `~/.local/share/Trash` | **Some de vez** |
| Cache do pip / uv | Downloads de pacotes Python | apaga `~/.cache/pip` / `uv cache clean` | Sim; os ambientes não são afetados, só baixam de novo se precisar |
| Flatpak sem uso | Runtimes que nenhum app usa | `flatpak uninstall --unused` | Sim |

### `smart health` — saúde do computador

```fish
smart health
smart health --disk     # inclui o SSD (pede a senha)
```

| Parte | O que mostra | Quando avisa ⚠ |
| --- | --- | --- |
| Disco | Uso do `/` e da pasta pessoal, com barra | Acima de 90% |
| Memória | RAM e swap usados | RAM acima de 90% |
| Processador | Carga, temperatura, tempo ligado | 85 °C ou mais |
| Bateria | Carga agora, **saúde** (capacidade atual ÷ capacidade de fábrica) e ciclos | Saúde abaixo de 60% |
| Serviços | Serviços do systemd com falha | Algum com falha |
| SSD/HD (`--disk`) | Resultado do SMART, desgaste (%), temperatura, horas ligado | SMART com falha (**faça backup!**) |

As barras mudam de cor: verde até 75%, bronze até 90%, vinho acima. No fim aparece o resumo: `✓ Tudo em ordem` ou a lista de avisos.

A saúde da bateria é a conta `energy_full ÷ energy_full_design`, lida em `/sys/class/power_supply/BAT0/`. Uma bateria nova tem perto de 100%; perdendo uns 20% depois de alguns anos, ainda é normal.

### `smart net` — rede e internet

```fish
smart net
smart net --local     # não consulta o IP público
```

Mostra:
- **Interfaces** (cabo, Wi-Fi, VPN, virtuais) e seus IPs
- **Roteador** (gateway) e **DNS**
- **Wi-Fi**: nome da rede, sinal (%) e segurança (precisa do NetworkManager)
- **Internet**: conectado ou não, e o tempo de resposta
- **IP público**, com cidade, país e provedor (consulta o site ipinfo.io)
- **VPN**: ativa ou não (procura interfaces `tun`, `wg`, `ppp`, `proton`...)

### `smart ports` — portas abertas

```fish
smart ports
```

```
  PORTA  TIPO  QUEM PODE ACESSAR     PROGRAMA        O QUE É
  631    tcp   só este PC            cupsd           impressoras (CUPS)
  5353   udp   a rede toda           avahi-daemon    descoberta na rede local (mDNS/Avahi)
  11434  tcp   só este PC            ollama          IA local (Ollama)
```

(Exemplo.) Uma **porta aberta** é um programa esperando conexões.
- **só este PC** (endereço `127.0.0.1` ou `::1`): só programas do seu notebook conectam. Seguro.
- **a rede toda** (`0.0.0.0` ou `::`): outros aparelhos da mesma rede podem tentar conectar. Confira se conhece o programa.

Ele reconhece as portas mais comuns (SSH, impressoras, Jupyter, Ollama, bancos de dados...). Bom para os estudos de segurança: é o primeiro passo de qualquer análise, olhar a própria máquina.

### `smart big` — o que ocupa espaço

```fish
smart big                  # pasta atual, 10 itens
smart big ~                # pasta pessoal
smart big ~/Downloads 20   # 20 itens
```

Mostra duas listas:
1. **Pastas e arquivos daquela pasta**, do maior para o menor, com barra proporcional.
2. **Maiores arquivos** de todas as subpastas.

Pode demorar em pastas muito grandes, porque soma arquivo por arquivo. Não segue atalhos (links simbólicos), para não contar nada duas vezes.

### `smart learn` — aulas de terminal

```fish
smart learn            # aula atual
smart learn next       # próxima
smart learn list       # todas, com ✓ nas vistas
smart learn 11         # vai para a aula 11
smart learn grep       # procura a aula sobre grep
smart learn atalho     # também entende palavras do dia a dia (veja abaixo)
smart learn reset      # recomeça
```

**Busca por assunto:** procura primeiro a palavra exata no título (`smart learn ip` abre "ip e ping", e não "pipe"), depois palavras do dia a dia, e por último parte do título.

| Você digita | Abre a aula |
| --- | --- |
| `atalho`, `ctrl`, `teclado` | Atalhos de edição |
| `logs`, `serviço` | systemctl e journalctl |
| `permissão`, `script`, `executar` | chmod |
| `variável`, `export`, `which` | Variáveis e $PATH |
| `compactar`, `zip`, `backup` | tar |
| `copiar`, `mover`, `renomear` | cp e mv |
| `apagar`, `deletar` | rm |
| `instalar`, `pacote` | sudo e apt |
| `espaço`, `disco` | df e du |
| `rede`, `internet` | ip e ping |
| `processo`, `top` | ps, top, kill |
| `erro`, `/dev/null` | Redirecionar erros |
| `histórico` | \| (pipe) |
| `ajuda`, `manual` | man, tldr, explain |

**Ao terminar a aula 27**, o `smart learn next` mostra "★ Você chegou ao fim das 27 aulas!", quantas você viu e a sugestão de treinar no `smart pure`. Depois recomeça pela aula 1.

**O progresso** (`~/.config/adaos/learn.json`) é conferido ao abrir: se o arquivo estiver faltando, corrompido ou com uma aula que não existe, o comando corrige sozinho em vez de dar erro.

Nos exemplos, `$` é um **comando** para digitar e `⌨` é um **atalho de teclado**.

**`smart learn` × `explain`:** o `smart learn` abre **aulas**; o `explain` explica **qualquer comando**. Se você digitar `smart learn explain git`, o terminal entende e roda `explain git`, com a dica de que dá para digitar só `explain git`. O mesmo vale para `ask` e `fix`.

Cada aula tem a explicação, exemplos e um **exercício** para você fazer no terminal. O progresso fica em `~/.config/adaos/learn.json`.

As 27 aulas, em ordem:

| # | Aula | # | Aula | # | Aula |
| --- | --- | --- | --- | --- | --- |
| 1 | pwd | 10 | find | 19 | Atalhos de edição |
| 2 | ls | 11 | \| (pipe) | 20 | systemctl e journalctl |
| 3 | cd | 12 | sort, uniq, wc | 21 | ip e ping |
| 4 | mkdir | 13 | chmod | 22 | curl |
| 5 | touch e echo | 14 | sudo e apt | 23 | ssh |
| 6 | cat, less, head, tail | 15 | ps, top, kill | 24 | git (básico) |
| 7 | cp e mv | 16 | df e du | 25 | Redirecionar erros |
| 8 | rm | 17 | tar | 26 | xargs |
| 9 | grep | 18 | Variáveis e $PATH | 27 | man, tldr, explain |

Sugestão de rotina: uma aula por dia. Faça o exercício e, se não entender algum comando, use `explain`.

### `smart pure` — modo treino (Bash de servidor)

Para não esquecer os comandos padrão do Linux, como os de um servidor da empresa.

```fish
smart pure
```

Abre um **Bash puro**, como o de um servidor:

| No modo treino **não** tem | Tem (como em qualquer Linux) |
| --- | --- |
| `ask`, `explain`, `fix`, `smart`, `z` | Todos os comandos padrão (`ls`, `grep`, `find`, `systemctl`...) |
| Sugestão cinza, Ctrl+R com fzf, Alt+A | Ctrl+R simples do Bash, ↑, Tab |
| Apelidos (`ll`, `la`, `cat` com cores) | `man <comando>` e `<comando> --help` |
| "Você quis dizer...?" | `bash: xyz: command not found`, como num servidor |
| Programas da sua pasta (`~/.local/bin`) | Só os programas do sistema |

O prompt mostra que você está treinando:

```
[treino] tiago@Warzone:~$
```

Ao entrar, ele sugere o exercício da sua aula atual do `smart learn`. Para sair, use **`exit`** ou **Ctrl+D**. Você volta ao terminal inteligente e vê o **resumo do treino**:

```
Resumo do treino  (12 min)
  Comandos digitados: 8   ✓ 5 certos   ✗ 3 com erro
  Mais usados: set (2), echo (2), pwd (1), ask (1), ls (1), ll (1)
  Hábitos do Fish/terminal inteligente que apareceram:
    • 'ask' é do seu terminal inteligente; num servidor não existe. Use man <comando> ou <comando> --help
    • 'set -x NOME Tiago': no Bash, crie variáveis com export NOME=valor. Lá, set -x liga o modo de depuração (linhas com +); desliga com set +x
    • 'echo (date)': no Bash, o resultado de um comando é $(comando), não (comando)
    • 'll' é um apelido; o comando padrão é ls -l (ou ls -la)
  Comandos com erro (código de saída entre colchetes)
    [127] ask liste arquivos
    [2] echo (date)
    [127] ll
```

**Os códigos de erro** (o número entre colchetes é o código de saída, `$?` no Bash):

| Código | Significa |
| --- | --- |
| `0` | Deu certo |
| `1` | Erro geral (ex.: arquivo não encontrado, nada achado pelo `grep`) |
| `2` | Uso errado (opção ou sintaxe inválida) |
| `126` | Sem permissão para executar |
| `127` | Comando não existe |
| `130` | Cancelado com Ctrl+C |

**Diferenças entre Fish e Bash** (o resumo avisa quando você usa o jeito do Fish):

| O que fazer | Fish (seu terminal) | Bash (servidor) |
| --- | --- | --- |
| Criar variável | `set -x NOME valor` | `export NOME=valor` |
| Usar o resultado de um comando | `(date)` | `$(date)` |
| Fim do `if` | `end` | `fi` |
| Fim do `for` / `while` | `end` | `done` |
| Ver o código do último erro | `echo $status` | `echo $?` |
| Lista longa | `ll` (apelido) | `ls -l` |

Sugestão de rotina: uma vez por semana, faça as tarefas do dia dentro do `smart pure`. Depois do resumo, use `explain` nos comandos que deram erro.

Por dentro: o comando abre `bash --noprofile --rcfile <arquivo temporário>`, sem o `~/.local/bin` no `PATH`. Assim o Bash não lê o seu `.bashrc` (onde estão o starship e o zoxide). O `PROMPT_COMMAND` do Bash grava cada comando e o código de saída num arquivo temporário, que o Python lê ao final para montar o resumo (função `cmd_pure`).

### `smart dino` — jogo de corrida no terminal

```fish
smart dino
```

Inspirado no jogo do dinossauro do Chrome, com um **personagem próprio do AdaOS**: um dinossauro steampunk, de cartola e óculos de aviador, correndo por um mundo de engrenagens.

```
            ▄█▄
           ▀▀▀▀▀                                       ◁◉██▀▀▀▄▄
          █◉████▄                                         ▀▄
      ▄  ▄████▀▀               ▄                  ▄▀█▀▄
      ▀█▄█████▄               ▐█▌      ▄█▀█▄      █ ◎ █
         █▀  ▀█                █       ▀█◎█▀      ▀▄█▄▀
▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
```

**Controles**

| Tecla | O que faz |
| --- | --- |
| **Espaço**, **↑** ou **w** | Pular (também começa e recomeça a partida). Se apertar até 0,15 s **antes** de pousar, ele pula assim que encostar no chão |
| **↓** ou **s** | Abaixar: **segure** enquanto o pássaro passa; ao soltar, levanta em ~0,12 s. No ar: cai mais rápido |
| **p** | Pausar / continuar |
| **m** | Som liga/desliga (o "bip" do terminal) |
| **q** | Sair |

**Obstáculos**

| Obstáculo | Cor | Como passar | Aparece a partir de |
| --- | --- | --- | --- |
| Cacto pequeno ▐█▌ (3 × 3) | esmeralda | Pular | O início |
| Engrenagem ◎ (5 × 2) | bronze | Pular | O início |
| Cacto grande (5 × 4), engrenagem grande (5 × 3) | esmeralda / bronze | Pular | 150 pontos |
| Dois cactos juntos | esmeralda | Pular (mais longe) | 200 pontos |
| Pássaro mecânico ◁◉ baixo | vinho | Pular | 300 pontos |
| Pássaro mecânico na altura da cabeça | vinho | **Abaixar** | 300 pontos |
| Pássaro mecânico alto | vinho | Continuar correndo (não pule!) | 300 pontos |

**O que acontece durante a partida**

- A **velocidade aumenta** com a pontuação, até um limite.
- A cada **100 pontos**, o placar pisca (e faz bip, se o som estiver ligado).
- A cada **700 pontos**, o dia vira **noite**: o sol dá lugar à lua e às estrelas. Depois de mais 700 pontos, amanhece.
- O fundo tem **paralaxe**: as nuvens e as montanhas andam mais devagar que o chão, dando sensação de profundidade.
- Ao bater, os olhos do dinossauro viram ✕ e aparece o placar. Se for recorde: **★ NOVO RECORDE! ★**
- **Mudou o tamanho da janela no meio da partida?** O jogo pausa, avisa "A janela mudou de tamanho: o jogo se ajustou", recalcula o chão, o pulo e o céu para o novo tamanho e **mantém a pontuação, a velocidade e os obstáculos**. Aperte `p` para continuar de onde parou. Se a janela ficar menor que 64 × 20, aparece "Janela pequena" até você aumentar de novo.
- **Resposta imediata:** o jogo fica "ouvindo" o teclado o tempo todo, e o pulo começa no instante da tecla, sem esperar o próximo quadro.
- **Espaço antes dos pássaros:** como eles voam um pouco mais rápido, o jogo deixa um espaço maior antes de cada pássaro. Depois de pousar de um pulo, sobram pelo menos 0,86 s para reagir.

**Recorde e estatísticas**

```fish
smart dino stats    # Recorde: 1234 · Partidas: 15 · Pulos: 480 · Tempo jogando: 22 min
smart dino reset    # apaga
```

Ficam em `~/.config/adaos/dino.json`.

**A física do jogo (para estudar)**

O pulo é um **lançamento vertical** (MRUV), com as mesmas fórmulas da escola, só que em "linhas do terminal". O tempo do pulo foi **calibrado pelo jogo original do Chrome** (constantes da classe `Trex` no código do Chromium).

**Do Chrome para o terminal:** o Chrome mede tudo **por quadro** (60 quadros por segundo):

| Chrome (Chromium) | Valor | Convertido para segundos |
| --- | --- | --- |
| `INITIAL_JUMP_VELOCITY` | 10 px/quadro | 10 × 60 = 600 px/s |
| `GRAVITY` | 0,6 px/quadro² | 0,6 × 60² = 2160 px/s² |
| Altura do pulo | h = v₀²/(2g) | 83 px ≈ 1,77× a altura do dinossauro (47 px) |
| Tempo no ar | t = 2v₀/g | **0,556 s** (0,278 s subindo, 0,278 s descendo) |
| `SPEED_DROP_COEFFICIENT` | 3 | ↓ no ar: gravidade × 3 |

**No `smart dino`:** o mesmo tempo no ar **e a mesma proporção de altura** do Chrome. A altura se ajusta à janela: se não couber, ela diminui, mas o tempo no ar continua 0,556 s.

| Janela | Altura do pulo | Tempo no ar |
| --- | --- | --- |
| 120 × 30 (padrão do seu terminal) | 10,6 linhas = **1,77× o dino (igual ao Chrome)** | 0,556 s |
| 90 × 24 | 10,6 linhas (igual ao Chrome) | 0,556 s |
| 64 × 20 (mínima) | 8 linhas (menor, para caber) | 0,556 s |

Partindo do tempo t = 0,556 s e da altura h, as fórmulas dão a gravidade e a velocidade (função `jump_physics()`):

| Grandeza | Na sua janela (h = 10,6) | Fórmula |
| --- | --- | --- |
| Gravidade | g ≈ 275 linhas/s² | g = 8h / t² |
| Velocidade inicial | v₀ ≈ 76 linhas/s | v₀ = g·t / 2 |
| Altura máxima | 10,6 linhas | h = v₀² / (2g) |
| Tempo no ar | 0,556 s | t = 2v₀ / g |
| Queda rápida (↓ no ar) | g × 3 | igual ao Chrome. Apertar ↓ **na subida** também corta o pulo: dá para fazer pulos curtos |
| Pulo antecipado (*jump buffer*) | 0,15 s | Apertou pular no ar, até 0,15 s antes de pousar? Pula ao pousar |
| Abaixar: 1º toque | ≈ 0,45–0,6 s | Espera de repetição do teclado (`xset q`) + 0,08 s |
| Abaixar: enquanto segura | +0,12 s por repetição | Soltou: levanta em ~0,12 s |
| Velocidade dos pássaros | 1,08 × a do chão | |
| Espaço antes de um pássaro | 1,6 × o normal + 6 colunas | |

A cada quadro (60 por segundo), o jogo faz `v = v − g·Δt` e `y = y + v·Δt`. Na horizontal é **MRU**: os obstáculos andam `velocidade × Δt` colunas por quadro.

A **distância mínima entre obstáculos** é calculada com a física, `velocidade × tempo no ar × 1,25`, para sempre dar tempo de pousar e pular de novo. Isso foi conferido com um **robô jogador**, que chegou a 3000 pontos em 40 de 40 partidas.

A **colisão** é caractere por caractere: só os blocos cheios (█ ◉ ◎ ▐ ▌ ◁) contam; os meio-blocos (▄ ▀) e a cauda do dinossauro "perdoam", para o jogo ser justo.

Por dentro (arquivo `~/.local/bin/adaos-dino`, separado do `adaos-smart`):

| Parte | O que faz |
| --- | --- |
| `JUMP_SPEED`, `GRAVITY`, ... | As constantes da física (mude e veja o que acontece!) |
| `DINO_RUN`, `DINO_DUCK`, `OBSTACLES`, `BIRD` | Os desenhos, linha por linha (espaço = transparente) |
| `Game.update()` | A física: MRUV na vertical, MRU na horizontal, paralaxe |
| `Game.spawn()` / `pick_kind()` | Sorteia obstáculos e a distância segura até o próximo. O próximo já é sorteado antes, para dar mais espaço se for um pássaro |
| `jump()` / `_do_jump()` | O pulo, com o "pulo antecipado" (`JUMP_BUFFER`) |
| `duck()` | O abaixar. O terminal só avisa quando a tecla é **apertada**, nunca quando é solta; por isso o jogo usa a repetição automática do teclado para saber se você ainda está segurando |
| `keyboard_repeat()` | Lê a espera e a velocidade de repetição do seu teclado com `xset q` |
| `air_time()` | Calcula o tempo no ar (subida + descida), usado para espaçar os obstáculos |
| `AIR_TIME`, `JUMP_RATIO`, `FAST_FALL` | Valores do Chrome (o comentário no código mostra a conversão) |
| `jump_physics()` | Calcula altura, gravidade e velocidade do pulo para o tamanho da janela |
| `Game.resize()` | Ajusta o jogo a um novo tamanho de janela sem perder a partida |
| `Game.collides()` | Colisão: compara as células sólidas do dinossauro com as dos obstáculos |
| `Game.draw()` | Desenha céu, nuvens, montanhas, chão, obstáculos, personagem e placar |
| `main()` | O laço do jogo: lê o teclado, atualiza, desenha e espera o próximo quadro. A espera é feita com `getch()` e um tempo limite, então uma tecla acorda o jogo na hora |
| `curses` | A biblioteca do Python que desenha no terminal (já vem com o Python) |

Ideias para praticar Python: mudar a gravidade para a da Lua (g ÷ 6) num "modo lunar", criar um obstáculo novo desenhando-o em `OBSTACLES`, ou mostrar a velocidade atual no placar.

### Apelidos (aliases)

| Você digita | O que roda |
| --- | --- |
| `ls` | `exa`/`eza` com pastas primeiro |
| `ll` | Lista detalhada com tamanhos legíveis e estado no Git |
| `la` | Igual ao `ll`, incluindo arquivos ocultos |
| `tree` | Árvore de pastas (2 níveis) |
| `cat arquivo` | `bat`: mostra com cores de sintaxe |
| `bat`, `fd` | Nomes normais para `batcat` e `fdfind` (o Debian usa nomes diferentes) |
| `z <nome>` | Pula para a pasta mais usada que tem esse nome |
| `zi` | Escolhe a pasta numa lista (zoxide + fzf) |
| `tldr <comando>` | Exemplos práticos de um comando |

## 5. Atalhos de teclado

| Atalho | O que faz |
| --- | --- |
| **Alt+A** | Escreva em português na linha e aperte: o texto vira comando. Você pode **editar antes** de dar Enter |
| **Alt+E** | Explica o comando que está na linha (vazia: o último) |
| **→** ou **Ctrl+F** | Aceita a sugestão cinza inteira |
| **Alt+→** | Aceita só a próxima palavra da sugestão |
| **Tab** | Completa comandos, opções, arquivos e ramos do Git; duas vezes abre o menu |
| **Ctrl+R** | Busca no histórico (fzf) |
| **Ctrl+T** | Busca um arquivo e coloca o caminho na linha |
| **Alt+C** | Busca uma pasta e entra nela |
| **Ctrl+C** | Cancela o comando ou a linha |
| **Alt+L** | Lista a pasta atual sem apagar o que você digitou |
| **Alt+H** | Mostra o manual do comando da linha |

`ask` ou Alt+A? O `ask` mostra a explicação e o risco e pergunta antes de rodar. O Alt+A só coloca o comando na linha: mais rápido, e você revisa antes do Enter.

> Se o Alt+A ou o Alt+E **abrirem um menu do terminal** (Arquivo/Editar) em vez de funcionar, o terminal do Xfce está usando Alt+letra para os menus. O `instalar.sh` já desliga isso; para resolver na mão, veja "Problemas comuns".

## 6. Recursos que funcionam sem IA

Mesmo sem o Ollama, ou com ele desligado:

| Recurso | Exemplo |
| --- | --- |
| **Erro de digitação** | `gti status` → `Você quis dizer: git?`. Procura nos programas do `PATH`, primeiro letras trocadas, depois nomes parecidos (`difflib` do Python) |
| **Pacote que falta** | Comando que não está instalado → o Debian diz qual pacote instalar (`command-not-found`) |
| **Sugestão cinza** | O Fish sugere pelo seu histórico |
| **Cores na digitação** | Comando em **marfim** = existe; em **vinho** = não existe; caminho sublinhado = arquivo existe |
| **Buscas fzf** | Ctrl+R, Ctrl+T, Alt+C |
| **zoxide** | `z proj` |
| **Notificação** | Comando com mais de 30 s mostra uma notificação ao terminar (✓ ou ✗). Não avisa para editores e programas interativos (`code`, `vim`, `ssh`, `htop`, `python3`...) |
| **Tempo no prompt** | Comando com mais de 3 s mostra `⏱ 5s` no prompt |
| **`explain` offline** | Usa o `tldr` |

## 7. Segurança: os níveis de risco

O risco é analisado **pelo próprio `adaos-smart`, com regras fixas**, e não pela IA: mesmo que a IA erre, a análise continua valendo.

| Nível | Exemplos | O que acontece |
| --- | --- | --- |
| ✓ **Seguro** | `ls`, `du`, `find`, `grep`, `mkdir`, `python3 --version` | Pergunta `Executar? [s/N]` |
| ⚠ **Atenção** | `sudo`, `rm`, `mv`, `chmod`, `kill`, `>` (sobrescrever), `systemctl stop`, `git reset --hard` | Mostra o motivo e pergunta `[s/N]` |
| ⚠ **PERIGOSO** | `rm -rf ~`, `rm -rf /`, `dd ... of=/dev/sda`, `mkfs`, `fdisk`, `wipefs`, `curl ... \| sh`, `chmod 777 /`, `shutdown`, `apt purge`, fork bomb | Só roda se você digitar **SIM** em maiúsculas |

Outras proteções:

- **Nada roda sem a sua confirmação.** O padrão é sempre "não".
- O `fix` não roda de novo um comando que não seja seguro.
- A IA recebe só a pasta atual e os nomes dos arquivos, nunca o conteúdo.
- A IA é local: os pedidos não saem do notebook.

## 8. Como funciona por dentro

```
 Você digita:  ask liste os arquivos .py
        │
        ▼
 ┌──────────────────────────┐
 │ Fish: função ask.fish    │
 └────────────┬─────────────┘
              │ adaos-smart cmd -- "liste os arquivos .py"
              ▼
 ┌──────────────────────────┐   POST /api/chat (JSON)   ┌──────────────────┐
 │ adaos-smart (Python)     │ ────────────────────────▶ │ Ollama (local)   │
 │ • monta o contexto       │ ◀──────────────────────── │ qwen2.5-coder:3b │
 │ • analisa o risco        │  {"command", "explanation"}└──────────────────┘
 │ • grava a sugestão em    │
 │   ~/.cache/adaos/        │
 └────────────┬─────────────┘
              ▼
 ┌──────────────────────────────────┐
 │ __adaos_run_suggestion.fish      │
 │ • lê a sugestão e o risco        │
 │ • pergunta [s/N] ou SIM          │
 │ • roda no Fish (ou bash -c)      │
 └──────────────────────────────────┘
```

Detalhes:

1. **A conversa com a IA** usa a API HTTP do Ollama em `http://127.0.0.1:11434/api/chat`, com `"format": "json"` (a IA é obrigada a devolver JSON) e `temperature: 0.1` (respostas estáveis, quase sem "criatividade").
2. **Três "personalidades" (prompts de sistema)** dentro do `adaos-smart`:
   - `SYSTEM_CMD`: transforma o pedido em comando → `{"command", "explanation"}`
   - `SYSTEM_EXPLAIN`: professor de Linux → `{"summary", "parts", "warning"}`
   - `SYSTEM_FIX`: diagnóstico de erro → `{"cause", "command", "explanation"}`
3. **Análise de risco**: duas listas de expressões regulares (`DANGER_PATTERNS` e `CAUTION_PATTERNS`). Se um padrão de perigo bate, o nível é `danger`; senão, se um de atenção bate, é `caution`; senão, `safe`.
4. **Memória do último comando**: a função `__adaos_postexec` escuta o evento `fish_postexec` (que o Fish dispara depois de cada comando) e guarda `__adaos_last_cmd` e `__adaos_last_status`. É isso que o `fix` usa.
5. **Fish ou Bash?** Antes de rodar, `fish --no-execute -c "comando"` testa se o Fish entende a sintaxe. Se entender, usa `eval` (o `cd` funciona); se não, usa `bash -c`.
6. **Alt+A** usa o `commandline -r`, que troca o texto da linha atual pelo comando gerado.

### Subcomandos do `adaos-smart`

O `adaos-smart` também pode ser usado direto, por exemplo em scripts:

| Subcomando | O que faz |
| --- | --- |
| `adaos-smart cmd "<pedido>"` | Pedido → comando (com explicação) |
| `adaos-smart cmd --quiet "<pedido>"` | Só o comando, sem explicação (usado pelo Alt+A) |
| `adaos-smart explain "<comando>"` | Explicação |
| `adaos-smart fix --status N --output-file f -- <comando>` | Diagnóstico |
| `adaos-smart risk -- <comando>` | Imprime `safe`, `caution` ou `danger` (sem IA) |
| `adaos-smart suggest -- <palavra>` | Comandos parecidos (sem IA) |
| `adaos-smart status`, `model`, `tips`, `help` | Iguais ao `smart` |

Códigos de saída: `0` ok · `1` sem resposta útil · `2` faltou argumento · `3` IA indisponível · `130` cancelado com Ctrl+C.

## 9. Configuração

### IA: `~/.config/adaos/smart.conf`

```ini
# Terminal Inteligente (AdaOS) — configuração
MODEL=qwen2.5-coder:3b
OLLAMA_URL=http://127.0.0.1:11434
TIMEOUT=120
```

| Chave | Significado |
| --- | --- |
| `MODEL` | Modelo do Ollama |
| `OLLAMA_URL` | Endereço do Ollama (só mude se ele estiver em outra máquina) |
| `TIMEOUT` | Segundos de espera pela resposta |

Editar: `code ~/.config/adaos/smart.conf`

### Escolher o modelo (quanto pesa a IA local)

O AdaShell não traz uma IA embutida: ele usa o **Ollama**, que roda o modelo **neste computador** (processador + RAM). O instalador lê a RAM e escolhe:

| RAM do computador | Modelo | Download | Observação |
| --- | --- | --- | --- |
| Menos de 4 GB | **não instale** | — | O instalador recomenda não instalar e pede `SIM` para continuar (usa o `0.5b`) |
| 4 a 8 GB | `qwen2.5-coder:1.5b` | ~1 GB | Leve |
| 8 a 16 GB | `qwen2.5-coder:3b` (padrão) | ~2 GB | Bom equilíbrio |
| 16 GB ou mais | `qwen2.5-coder:3b` ou `:7b` | ~2 / ~4,7 GB | O 7b é mais esperto e mais lento |

```fish
ollama pull qwen2.5-coder:7b
smart model qwen2.5-coder:7b
```

Cuidados:
- Roda no processador; placa de vídeo não é necessária.
- Enquanto responde, o modelo usa RAM e processador; depois de ~5 minutos sem uso, o Ollama libera a memória.
- **Não use modelos grandes (13b, 30b, 70b…) num notebook**: podem travar o sistema. Para comandos curtos, o 3b basta.
- Para liberar tudo na hora: `sudo systemctl stop ollama`.

### Outras opções

| Quero... | Como |
| --- | --- |
| Abrir sem o fastfetch | `set -Ux ADAOS_NO_FASTFETCH 1` (voltar: `set -e ADAOS_NO_FASTFETCH`) |
| Desligar cores nas mensagens | `set -Ux NO_COLOR 1` |
| Mudar o tempo da notificação | Em `adaos-terminal.fish`, troque `30000` (milissegundos) |
| Mudar o prompt | `code ~/.config/adaos/starship.toml` |
| Ligar/desligar a IA | `sudo systemctl start ollama` / `sudo systemctl stop ollama` |
| A IA não iniciar com o computador | `sudo systemctl disable ollama` |

## 10. Visual: prompt e cores

### Prompt

```
(quantum) tiago@warzone:~/AdaLab main *+? ⏱ 5s [1]$
```

| Parte | Cor | Quando aparece |
| --- | --- | --- |
| `(quantum)` | bronze claro | Com ambiente Python ativo |
| `tiago@warzone` | verde esmeralda | Sempre (vinho se for root) |
| `~/AdaLab` | azul | Sempre (até 4 níveis de pasta) |
| `main` | bronze | Dentro de um repositório Git |
| `*` `+` `?` | bronze | Arquivo alterado · pronto para commit · arquivo novo |
| `⇡` `⇣` | bronze | Commits para enviar · para receber |
| `⏱ 5s` | cinza | Comando demorou mais de 3 s |
| `[1]` | vinho | Código de erro do último comando |
| `$` | bronze (vinho após erro) | Sempre |

### Cores do terminal

| Uso | Cor |
| --- | --- |
| Fundo | preto `#000000` |
| Texto | marfim `#F4EDE1` |
| Cursor | bronze `#CDA869` |
| Negrito | bronze claro `#E2C189` |
| Seleção | esmeralda `#0F3D33` |
| Erro | vinho claro `#D0566B` |
| Sucesso | esmeralda claro `#3FA77F` |

Fonte: **JetBrains Mono 11**.

## 11. Problemas comuns

| Problema | Solução |
| --- | --- |
| `a IA local (Ollama) não está rodando` | `sudo systemctl start ollama` |
| `o modelo '...' não está baixado` | `ollama pull qwen2.5-coder:3b` |
| A IA demora muito | Normal na primeira pergunta (o modelo carrega na memória). Se continuar lento, use o `3b` |
| Terminal não abriu no Fish | Feche **todas** as janelas do terminal e abra de novo. Ou: Editar → Preferências → Geral → "Executar um comando personalizado" → `/usr/bin/fish` |
| Prompt sem cores/símbolos estranhos | Confira se o starship existe: `ls ~/.local/bin/starship`. Se não, rode o `instalar.sh` de novo |
| **Alt+A ou Alt+E abre um menu do terminal** (Arquivo/Editar) | O terminal do Xfce usa Alt+letra para os menus. Correção rápida: **Editar → Preferências → Avançado →** marque **"Desativar todas as teclas de acesso ao menu (como Alt+f)"**. O `instalar.sh` (v3.11+) já faz isso sozinho (opção `ShortcutsNoMnemonics`) |
| Ctrl+R não abre o fzf | `sudo apt install fzf` e abra o terminal de novo |
| `ll` sem cores do Git | Instale o `exa` (Debian 12) ou `eza` (Debian 13) |
| A sugestão da IA está errada | Use `explain` no comando, reformule o pedido com mais detalhes ou use o modelo `7b` |
| `smart update` diz "sem acesso ao GitHub" | Sem internet ou GitHub fora do ar; o resto da atualização continua. Tente de novo mais tarde |
| `smart firmware`: "O fwupd não está instalado" | `sudo apt install fwupd` (o `instalar.sh` da v2.4 já instala) |
| `smart firmware`: "O fwupd não encontrou a BIOS desta máquina" | O fabricante não publica a BIOS no LVFS. Atualize pelo site do fabricante. Lista de aparelhos suportados: https://fwupd.org/lvfs/devices/ |
| `smart firmware`: "A BIOS aparece no fwupd, mas sem permissão de atualizar" | Algo na BIOS bloqueia a gravação, como a senha de supervisor ou uma opção de "atualização de BIOS só pelo supervisor". Resolva a senha antes |
| `smart firmware update`: "Não dá para atualizar agora" | Faça o que a mensagem pede: conectar o carregador, carregar a bateria até 50% ou iniciar em modo UEFI |
| `smart health` não mostra a temperatura | O sensor não foi reconhecido. Rode `sudo sensors-detect` (aceite os padrões) e reinicie |
| `smart health --disk`: "instale com: sudo apt install smartmontools" | Instale o pacote (o `instalar.sh` da v3 já instala) |
| `smart ports` mostra `?` no programa | É um programa do sistema ou de outro usuário. Para ver: `sudo ss -tulpn` |
| `smart ports` mostra uma porta para "a rede toda" que você não conhece | Pergunte: `ask o que é a porta N`. Se for um programa que você não usa, pode desinstalá-lo ou desligar o serviço |
| `smart net`: "IP público: não consegui consultar" | O site ipinfo.io não respondeu. O resto funciona; tente mais tarde |
| `smart clean` liberou menos que o previsto | Itens do sistema (apt, logs) ficam no disco `/`; o seu cache e a lixeira ficam na pasta pessoal. Se ela estiver em outra partição, o número final não inclui essa parte |
| `smart learn explain git` diz "não achei aula" | Corrigido na v3.10: agora funciona. O jeito curto é `explain git` (o `explain` é um comando sozinho) |
| `explain` diz "a IA local (Ollama) não está rodando" | Ligue com `sudo systemctl start ollama`. Enquanto isso, o `explain` mostra o resumo do `tldr` |
| `smart learn` não acha um assunto | Tente outra palavra (ex.: `atalho`, `logs`, `permissão`) ou veja todas com `smart learn list`. Para comandos que não têm aula: `tldr <comando>` |
| `smart dino`: "Janela pequena" | Aumente a janela do terminal para pelo menos 64 × 20 (ou maximize). A partida fica pausada, com a pontuação guardada, até a janela voltar a caber |
| `smart dino`: desenhos com falhas ou desalinhados | Use a fonte JetBrains Mono (o `instalar.sh` já configura) ou outra fonte monoespaçada com os caracteres de bloco (▄ █ ▀) |
| `smart dino`: um toque rápido em ↓ deixa o dino abaixado ~0,5 s | É de propósito: o terminal não avisa quando a tecla é solta, então o 1º toque dura até o teclado começar a repetir. **Segure** ↓: ao soltar, ele levanta em ~0,12 s |
| `smart dino`: ainda sinto um pequeno atraso na tecla | Parte do atraso vem do próprio terminal. No xfce4-terminal, desligar a transparência e as animações do Xfce ajuda. Abaixar com ↓ tem ~25 ms a mais que o Espaço, porque as setas são sequências de teclas |
| `smart dino`: o som não toca | O som é o "bip" do terminal (tecla `m`). No xfce4-terminal, ative em Preferências → Avançado → "Bipe audível" |
| No `smart pure` aparecem linhas começando com `+` | Você digitou `set -x` (jeito do Fish de criar variável). No Bash, isso liga o modo de depuração. Desligue com `set +x` e use `export NOME=valor` |
| No `smart pure`, o ↑ não mostra meus comandos de sempre | É de propósito: o treino tem histórico próprio (`~/.config/adaos/pure_history`) |
| `smart update` mostra **✗ Exemplos do tldr: falhou** | O tealdeer do Debian 12 (versão 1.5.0) baixa os exemplos de um endereço antigo, que o projeto tldr-pages desativou. Corrigido no kit v2.2: o `smart update` instala o tealdeer novo (≥ 1.7.3) do GitHub em `~/.local/bin/tldr` e atualiza os exemplos. Confira com `tldr --version` |
| Quero voltar ao Bash por um momento | Digite `bash`; para voltar ao Fish, `exit` |

Para ver erros do Fish ao abrir: `fish --debug=config`.

## 12. Desfazer

```bash
bash ~/AdaShell/desfazer.sh
```

O que ele faz:

- Apaga os arquivos que o kit colocou no Fish, o `adaos-smart`, o `starship.toml` e o tema de cores.
- Tira o bloco do `~/.bashrc` (sem mexer no resto do arquivo).
- Devolve as cópias guardadas em `~/.config/adaos/backup-terminal/`.
- Faz o terminal do Xfce voltar a abrir no shell padrão.

O que ele **não** remove: os pacotes do apt e o Ollama. Para tirar a IA também:

```bash
sudo systemctl disable --now ollama
sudo rm -rf /usr/local/bin/ollama /usr/share/ollama
```

## 13. Estudar e modificar o código

O `adaos-smart` é Python puro (só biblioteca padrão: `json`, `urllib`, `re`, `difflib`, `pathlib`, `subprocess`). Bom para estudar:

| Trecho | O que você aprende |
| --- | --- |
| `ask_ai()` | Fazer uma requisição HTTP POST com `urllib` e ler JSON |
| `analyze_risk()` | Expressões regulares (`re.search`) |
| `cmd_suggest()` | Comparar textos com `difflib.get_close_matches` |
| `load_config()` / `save_config()` | Ler e gravar arquivo de configuração com `pathlib` |
| `COMMANDS` + `main()` | Despachar subcomandos com um dicionário de funções |

Ideias para praticar:

1. Adicionar um padrão perigoso novo em `DANGER_PATTERNS`.
2. Criar um subcomando `adaos-smart history` que mostra as últimas sugestões.
3. Fazer o `ask` aceitar `--explain-only` (mostra o comando sem perguntar se executa).
4. Trocar o modelo e comparar as respostas.

Abrir o código:

```bash
code ~/.local/bin/adaos-smart
code ~/.config/fish/functions/
```

Depois de editar, abra um terminal novo para testar. Para editar o kit e reinstalar, edite os arquivos em `~/AdaShell/` e rode `bash instalar.sh` de novo.

## 14. Histórico de versões

| Versão | O que mudou |
| --- | --- |
| v3.12 (16/11/2026) | Peso da IA local explicado no README e na documentação (tabela RAM × modelo); o instalador lê a RAM, recomenda o modelo (`1.5b`, `3b` ou nenhum abaixo de 4 GB) e avisa antes de instalar |
| v3.11 (16/11/2026) | O instalador desliga as teclas de acesso aos menus do terminal (`ShortcutsNoMnemonics`), para o Alt+A e o Alt+E chegarem ao AdaShell em vez de abrir os menus Arquivo/Editar |
| v3.10 (16/11/2026) | `smart explain`, `smart ask`, `smart fix` e `smart learn explain/ask/fix` passam a funcionar (com dica do jeito curto); mensagem de "aula não encontrada" sugere `explain` |
| v3.9 (16/11/2026) | `smart learn` conferido: busca acerta a palavra exata (`ip` não abre mais "pipe") e entende palavras do dia a dia; não quebra com progresso corrompido; mensagem ao terminar as 27 aulas; aulas corrigidas: 6 (o `/var/log/syslog` não existe no Debian 12 → `tail -f arquivo.log`), 12 (exercício do `history` no fish e no bash), 13 (linha `#!/bin/bash`), 18 (fish e bash separados), 19 (atalhos com ⌨), 26 (`xargs` seguro com espaços) |
| v3.8 (16/11/2026) | `smart dino`: mudar o tamanho da janela no meio da partida pausa e ajusta o jogo **sem perder a pontuação** (antes a partida recomeçava do zero) |
| v3.7 (16/11/2026) | `smart dino`: altura do pulo igual à do Chrome (1,77× o dino) quando a janela permite (ex.: 120 × 30); em janelas baixas a altura diminui e o tempo no ar continua 0,556 s; robô 30/30 em três tamanhos |
| v3.6 (16/11/2026) | `smart dino`: pulo calibrado pelas constantes do Chrome (no ar 0,556 s: 0,278 s subindo e 0,278 s descendo; ↓ no ar × 3); altura 9 linhas; robô em 40 de 40 partidas |
| v3.5 (16/11/2026) | `smart dino`: gravidade maior na descida (cai em 0,27 s em vez de 0,36 s, mesma altura); abaixar usa a repetição do teclado (levanta em 0,12 s depois de soltar, em vez de 0,57 s); robô em 40 de 40 partidas |
| v3.4 (16/11/2026) | `smart dino`: pulo antecipado (0,15 s), teclado com resposta imediata (sem esperar o quadro), mais espaço antes dos pássaros (menor tempo obstáculo → pássaro de 0,92 s para 1,58 s); robô em 40 de 40 partidas |
| v3.3 (16/11/2026) | `smart dino`: obstáculos menores e proporcionais ao personagem (engrenagens 5 × 2 e 5 × 3, cactos 3 × 3 e 5 × 4); robô continua em 40 de 40 partidas até 3000 pontos |
| v3.2 (16/11/2026) | Jogo `smart dino` (arquivo `adaos-dino`): personagem steampunk próprio, física de pulo, abaixar, pássaros mecânicos, dia e noite, paralaxe, pausa, som, recorde; testado com um robô jogador (40 de 40 partidas até 3000 pontos) |
| v3.1 (13/11/2026) | `smart pure` (modo treino em Bash puro, com resumo de acertos, erros e hábitos do Fish); sem notificação ao sair do treino ou das aulas |
| v3 (13/11/2026) | Comandos `smart clean`, `smart health`, `smart net`, `smart ports`, `smart big` e `smart learn` (27 aulas); parte "Por baixo" com os comandos Linux equivalentes; `smartmontools`, `lm-sensors`, `ncdu` e `btop` no instalador |
| v2.4 (13/11/2026) | `smart firmware` (reconhece a máquina pela DMI; BIOS pelo fwupd/LVFS, com `--check` e `update`); `fwupd` no instalador |
| v2.3 (13/11/2026) | `smart update --full` (`apt full-upgrade` com simulação e confirmação SIM para remoções); aviso de pacotes "mantidos" no `smart update` normal e no `--check` |
| v2.2 (13/11/2026) | Correção: `✗ Exemplos do tldr: falhou`. O `smart update` e o `instalar.sh` instalam o tealdeer novo do GitHub; o resumo mostra o motivo quando algo falha |
| v2.1 (13/11/2026) | Documentação: cola rápida com os comandos novos, atalhos e comandos antigos que mudaram; `smart update` testado no notebook |
| v2 (13/11/2026) | `smart update` (sistema, ferramentas e IA, com `--check`, `--yes` e partes); notificação também para comandos `smart` |
| v1 (13/11/2026) | Primeira versão: `ask`, `explain`, `fix`, `smart`; Alt+A e Alt+E; análise de risco em 3 níveis; sugestão de digitação; notificação de comandos longos; prompt e cores do AdaOS; instalador e desfazer |
