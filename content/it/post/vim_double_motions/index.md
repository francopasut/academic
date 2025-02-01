---
title: "Cosa si intende per \"riga\" in Vim? Come si configura una  doppia modalità alternativa di movimento tra le righe?"
date: 2022-08-05
slug: vim_double_motions
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: true 
  caption: 'Vim logo'
---





## Perché la definizione di riga Vim è "speciale"?

In Vim una "riga" è un insieme di caratteri che termina con un ritorno
capo. 

Tutto qui?

Sembra ovvio, ma cosa cambia rispetto alla definizione di "riga" di
altri sistemi di scrittura?

Semplice: in altri ambienti solitamente le "righe" si interrompono al margine destro del monitor. In Vim no.

Nulla cambia per le righe brevi, ovvero che non eccedano il margine
destro.

Cambia, invece, nel caso di righe lunghe che eccedano tale bordo.

Per Vim, quindi, *l'oggetto riga*  può essere, a monitor, visualizzato su più righe visuali.

## Movimento tra le righe in Vim?

Nella configurazione di default di Vim,  gli spostamenti verticali avvengono utilizzando i tasti corrispondenti alle lettere `j` e `k` oppure con i
tasti freccia ed hanno effetto su *righe intere*, secondo la definizione sopra riportata.

Per gli spostamenti verticali tra righe eccedenti il bordo del monitor occorre, invece,  la lettera `g` prima 
operatori di movimento `j` e `k`: quindi `gj` o `gk`.

La regola si applica anche alle operazioni sugli *oggetti di testo*.

Quindi per eliminare un frammento di riga  dal
punto del  cursore fino al bordo destro del monitor (come avviene, tanto
per intenderci, avviene con il comando `C-k` di Emacs), si utilizza il comando
`dg$`, per l'operazione inversa (dal punto del cursore sino al bordo sinistro) si digita `dg0`.

## Rimappare o no? Questo è il problema

È molto semplice rimappare i tasti di movimento. Una riconfigurazione di
base, da riportare nel file *.vimrc*, potrebbe essere la seguente:

``` vim
map j gj
map k gk
```

Questa soluzione, tuttavia, non mi piace perchè compromette la velocità di movimento complessivo di Vim.

Una soluzione alternativa è quella di rimappare soltanto i tasti freccia.

Ottenere questa configurazione è molto semplice ed è l'oggetto del
successivo paragrafo.

## Come rimappare i tasti freccia



Per ottenere tale configuazione basta inserire il seguente codice nel
file configurazione *.vimrc*:

    nnoremap <Down> gj
    nnoremap <Up> gk
    vnoremap <Down> gj
    vnoremap <Up> gk
    inoremap <Down> <C-o>gj
    inoremap <Up> <C-o>gk

Il codice è impostato per funzionare in tripla modalità: normale,
visuale ed inserimento.

Dopo il riavvio di Vim saranno disponibili i tasti freccia verticali per
i movimenti infra-righe nonché i *tipici* tasti `jk` per i movimenti *di
default* di Vim.

Grazie per l'attenzione.
