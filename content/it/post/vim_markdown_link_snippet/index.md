---
title: "Vim, Markdown, Snippets, UltiSnips: come ottenere un link ben formattato con un comando unico"
date: 2021-09-21
slug: vim_markdown_snippet_url
categories:
  - Editors
tags:
  - Vim
  - Markdown
image:
  placement: 3
  preview_only: true 
  caption: 'Vim e Markdown insieme'
---



## Obiettivo di questo articolo

L'obiettivo di questo post è quello di ottenere un link correttamente formattato in Markdown unendo in un unico comando un frammento di testo e un indirizzo Internet preventivamente salvato negli appunti di Vim.

Naturalmente presumo che chiunque stia leggendo questo post sappia come creare un *collegamento ben formattato* in Markdown, cioè testo tra parentesi quadre e URL tra parentesi tonde.

Perché mi sono posto questa domanda?

Molto semplice: Ho notato che  *"nell'altro-lato-della-luna-chiamato-Emacs"* la costruzione di un link da una *regione* (cioè un testo selezionato) è immediatamente disponibile (markdown-mode, `C-c C-l`) mentre nella lista [honza](https://github.com/honza/vim-snippets/blob/master/snippets/markdown.snippets), che è usata dal plugin Vim [UltiSnips](https://github.com/SirVer/ultisnips), la stessa funzione non è tra quelle preimpostate.


## Un'interessante soluzione trovata in rete.

Per essere onesti, il lavoro non è tutto mio: Ho trovato un'interessante proposta di soluzione su [questa pagina](https://brendandawes.com/blog/ultisnips-auto-markdown-link), che riporto di seguito:

```vim
snippet link
[${0:${VISUAL}}](${1:`!v getreg("*") `})
endsnippet
```

Ringrazio molto l'autore della soluzione: non sarei stato in grado di sviluppare la mia soluzione personale senza di essa.

Ma ho trovato alcuni dettagli che ho deciso di sviluppare a modo mio.

1. Ho notato che l'uso del registro `"*"` replicava semplicemente il testo selezionato sia nelle parentesi quadre che in quelle tonde.

2. Un altro dettaglio era che dopo la creazione del collegamento, il salto al campo successivo non funzionava con pressioni successive del tasto di espansione (`Tab`, per me).

3. Infine: avevo bisogno di un comando di lancio più breve che fosse più vicino a quelli standard, per esempio `[l`.


## La mia soluzione

1. Ho tenuto conto che quando si copia una stringa di testo negli appunti di sistema, Vim la inserisce in due registri: `"*"` e `"+"`. Tuttavia quando il primo registro era sovrascritto dal trigger (`Tab` nella mia configurazione), il frammento di testo precedente rimaneva ancora sul secondo registro. Quindi ho semplicemente cambiato il registro da `"*"` a `"+"`. Questa modifica ha risolto il primo punto.


2. Se si confronta il codice dello snippet suggerito con gli snippet standard si noterà che la prima parte è numerata con "0" invece di "1" e la seconda parte è numerata "1" invece di "2".  Quindi ho semplicemente rinumerato le due parti inserendo i numeri 1 e 2 invece di 0 e 1 e anche il secondo punto è stato risolto.

3. Il terzo punto era il più semplice: ho semplicemente cambiato il nome della stringa di attivazione da `link` a `[l` (o quello che volete).

In considerazione delle osservazioni di cui sopra, **ho sviluppato una mia versione del codice**,  che riporto di seguito:


```vim
snippet [l
[${1:${VISUAL}}](${2:`!v getreg("+")`})
endsnippet
```
Funziona alla grande!

Ovviamente lo snippet è stato caricato nel file markdown.snippets e, quindi funziona solo in tale modalità del nostro editor.  

## Una semplice animazione

Ecco una semplice animazione che illustra come funziona il codice.

La clip è stata registrata con Peek.  

Ricordate che ho usato il tasto `Tab` come trigger e la combinazione `[l` per lanciare la sostituzione.

![Vim Markdown link snippet](vim_markdown_link_snippet.gif "My code is working!")

Grazie per la vostra attenzione.
