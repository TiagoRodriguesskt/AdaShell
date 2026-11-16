# Histórico de versões (CHANGELOG)

Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/).

## [v3.10] — 2026-11-16
`smart explain`, `smart ask`, `smart fix` e `smart learn explain/ask/fix` passam a funcionar (com dica do jeito curto); mensagem de "aula não encontrada" sugere `explain`

## [v3.9] — 2026-11-16
`smart learn` conferido: busca acerta a palavra exata (`ip` não abre mais "pipe") e entende palavras do dia a dia; não quebra com progresso corrompido; mensagem ao terminar as 27 aulas; aulas corrigidas: 6 (o `/var/log/syslog` não existe no Debian 12 → `tail -f arquivo.log`), 12 (exercício do `history` no fish e no bash), 13 (linha `#!/bin/bash`), 18 (fish e bash separados), 19 (atalhos com ⌨), 26 (`xargs` seguro com espaços)

## [v3.8] — 2026-11-16
`smart dino`: mudar o tamanho da janela no meio da partida pausa e ajusta o jogo **sem perder a pontuação** (antes a partida recomeçava do zero)

## [v3.7] — 2026-11-16
`smart dino`: altura do pulo igual à do Chrome (1,77× o dino) quando a janela permite (ex.: 120 × 30); em janelas baixas a altura diminui e o tempo no ar continua 0,556 s; robô 30/30 em três tamanhos

## [v3.6] — 2026-11-16
`smart dino`: pulo calibrado pelas constantes do Chrome (no ar 0,556 s: 0,278 s subindo e 0,278 s descendo; ↓ no ar × 3); altura 9 linhas; robô em 40 de 40 partidas

## [v3.5] — 2026-11-16
`smart dino`: gravidade maior na descida (cai em 0,27 s em vez de 0,36 s, mesma altura); abaixar usa a repetição do teclado (levanta em 0,12 s depois de soltar, em vez de 0,57 s); robô em 40 de 40 partidas

## [v3.4] — 2026-11-16
`smart dino`: pulo antecipado (0,15 s), teclado com resposta imediata (sem esperar o quadro), mais espaço antes dos pássaros (menor tempo obstáculo → pássaro de 0,92 s para 1,58 s); robô em 40 de 40 partidas

## [v3.3] — 2026-11-16
`smart dino`: obstáculos menores e proporcionais ao personagem (engrenagens 5 × 2 e 5 × 3, cactos 3 × 3 e 5 × 4); robô continua em 40 de 40 partidas até 3000 pontos

## [v3.2] — 2026-11-16
Jogo `smart dino` (arquivo `adaos-dino`): personagem steampunk próprio, física de pulo, abaixar, pássaros mecânicos, dia e noite, paralaxe, pausa, som, recorde; testado com um robô jogador (40 de 40 partidas até 3000 pontos)

## [v3.1] — 2026-11-13
`smart pure` (modo treino em Bash puro, com resumo de acertos, erros e hábitos do Fish); sem notificação ao sair do treino ou das aulas

## [v3] — 2026-11-13
Comandos `smart clean`, `smart health`, `smart net`, `smart ports`, `smart big` e `smart learn` (27 aulas); parte "Por baixo" com os comandos Linux equivalentes; `smartmontools`, `lm-sensors`, `ncdu` e `btop` no instalador

## [v2.4] — 2026-11-13
`smart firmware` (reconhece a máquina pela DMI; BIOS pelo fwupd/LVFS, com `--check` e `update`); `fwupd` no instalador

## [v2.3] — 2026-11-13
`smart update --full` (`apt full-upgrade` com simulação e confirmação SIM para remoções); aviso de pacotes "mantidos" no `smart update` normal e no `--check`

## [v2.2] — 2026-11-13
Correção: `✗ Exemplos do tldr: falhou`. O `smart update` e o `instalar.sh` instalam o tealdeer novo do GitHub; o resumo mostra o motivo quando algo falha

## [v2.1] — 2026-11-13
Documentação: cola rápida com os comandos novos, atalhos e comandos antigos que mudaram; `smart update` testado no notebook

## [v2] — 2026-11-13
`smart update` (sistema, ferramentas e IA, com `--check`, `--yes` e partes); notificação também para comandos `smart`

## [v1] — 2026-11-13
Primeira versão: `ask`, `explain`, `fix`, `smart`; Alt+A e Alt+E; análise de risco em 3 níveis; sugestão de digitação; notificação de comandos longos; prompt e cores do AdaOS; instalador e desfazer
