---
title: "Usare Vim per scrivere partiture in LilyPond"
date: 2022-01-28
slug: vim_write_lilypond
categories:
  - Editors
tags:
  - Vim
  - LilyPond
image:
  placement: 3
  preview_only: false
  caption: 'Vim and LilyPond per la musica'
---

{{% toc %}}


## A proposito di LilyPond

[LilyPond](http://lilypond.org/) è un linguaggio per produrre eleganti partiture musicali, strutturalmente simile a LaTeX con il quale può integrarsi per generare documenti contenenti testo e musica (per l'integrazione tra LilyPond e LaTeX richiamo [questo mio articolo](https://francopasut.netlify.app/it/post/lilypond-lyluatex/).)

Anche in LilyPond, come in LaTeX, è possibile scrivere il contenuto con vari *editor*.

Molto utile, sopratutto per imparare la sintassi, è l'editor denominato [Frescobaldi](https://www.frescobaldi.org/).

Per chi, invece, ha già imparato la sintassi, può essere utile sfruttare le infinite potenzialità di [Emacs](https://www.gnu.org/software/emacs/) e [Vim](https://www.vim.org/),

Nel manuale d'uso di LilyPond, versione 2.22, vengono riportate alcune sintetiche indicazioni per [l'utilizzo con Emacs](https://lilypond.org/doc/v2.22/Documentation/usage/text-editor-support#emacs-mode) nonché per [l'utilizzo con Vim](https://lilypond.org/doc/v2.22/Documentation/usage/text-editor-support#vim-mode). 

In questo articolo aggiungo soltanto qualche dato tecnico e pratico **per quanto concerne Vim** (ad Emacs dedicherò un successivo articolo).

Ogni passaggio è  stato provato su due distribuzioni Linux: Ubuntu 21.10 e Arch.

## Voce "Modalità di Vim" tratta dal Manuale d'Uso ufficiale di LilyPond

Riporto le indicazioni tratte dal Manuale d'Uso, attualmente disponibii al link sopra indicato, sulla descrizione e configurazione di Vim per l'utilizzo come *editor* in LilyPond:

> Per [Vim](http://www.vim.org/), sono disponibili le seguenti funzionalità per LilyPond: un plugin di riconoscimento del tipo di file, una modalità di indentazione e di evidenziazione della sintassi. Per abilitarle, crea (o modifica) il file `$HOME/.vimrc` in modo che contenga queste tre righe, in questo ordine:

```
filetype off
set runtimepath+=/usr/local/share/lilypond/current/vim/
filetype on
syntax on
```

> Se LilyPond non è installato nella directory ‘/usr/local/’, modifica il percorso in modo adeguato. Questo argomento è trattato in [Altre fonti di informazione](https://lilypond.org/doc/v2.22/Documentation/learning/other-sources-of-information).

## Osservazioni sulla configurazione di Vim per Lilypond

Le funzionalità di Vim sono contenute nelle cartelle *compiler*, *ftdetect*, *ftplugin*, *indent*, *syntax*. 

Ciascuna cartella contiene un unico documento con lo stesso nome: `lilypond.vim`.

Le cartelle devono trovarsi all’interno del percorso *path* oppure all'interno della *home* dell'utente o in una libreria condivisa, ad esempio */usr/share/vim/vimfiles/*.

La modifica del *file* di configurazione di Vim, riportata nelle istruzioni ufficiali, serve a ricomprendere le cinque cartelle all'interno del *path*. 

Se, invece,  si trovassero  già in una della locazioni sopra indicate, non occorrerebbe alcuna modifica e Vim sarebbe già pronto per essere utilizzato in *LilyPond*.

In alternativa, esiste un *plugin*  indipendente [a questo indirizzo](https://github.com/sersorrel/vim-lilypond/blob/main/ftplugin/lilypond.vim).

## Analisi dei *file* di configurazione

Riporto alcune osservazioni di sintesi sui *file* di configurazione di Vim per LilyPond:

* */compiler/lilypond.vim*: si occupa della compilazione del documento scritto in LilyPond, ovvero della trasformazione del codice in partitura nel formato PDF.
* */ftdetect/lilypond.vim*: ha la funzione di riconoscere il *tipo* di documento dall'estensione `ly` e di attribuirla a LilyPond.
* */ftplugin/lilypond.vim*: è il vero e proprio *plugin* per LilyPond in cui sono contenuti i tasti funzioni impostati, ovvero:
  * `F4` per salvare, compilare ed eseguire la versione midi tramite il software *timidity* (che, ovviamente, deve essere installato a parte);
  * `F5` per salvare e compilare (senza lanciare *timidity*);
  * `F6` per visualizzare la partitura in *pdf* con *ghostview*, anche questo da installare a parte se non già presente nel sistema;
  * `F7` per saltare all'errore precedente;
  * `F8` per saltare all'errore successivo;
  * `F9` per compilare;
  * `F10` per visualizzare un menù (generico, non specifico per LilyPond) sulla barra inferiore. Per navigare nel menù: `C-z` o `C-n` per muoversi in avanti e `C-p` per muoversi all'indietro (combinazioni derivate chiaramente dal mondo Emacs in cui la "n" sta per *next* e la "p" per *previous*), oltre ai tasti freccia;
  * `F12` per *commentare* la regione selezionata (notare il termine *regione* tipico di Emacs);
  * `S-F12` per rimuovere il *commento* dalla regione;
  * `C-n` per completare i comandi nelle modalità di Inserimento e Rimpiazzo. Anche in questo caso si usano le combinazioni `C-n` per muoversi in avanti e `C-p` per muoversi all'indietro nella finestra delle varie alternative.
* */indent/lilypond.vim*: per indentare i documenti in LilyPond
* */syntax/lilypond.vim*: contiene l'elenco dei comandi del linguaggio LilyPond utilizzato per il completamento attivabile con `Ctrl-n` sopra già descritto.

## Considerazioni sull'utilizzo di Vim per LilyPond

Il plugin per Vim non offre un menu dedicato a Lilypond. L'unica elencazione di comandi è quella contenuta all'interno del file *ftplugin* descritto al paragrafo precedente.

I comandi del linguaggio LilyPond devono, quindi, essere già conosciuti. 

Questo significa che l'utilizzo di Vim per LilyPond è utilizzabile solo da chi abbia già una buona conoscenza del linguaggio oltre che, naturlamente, di Vim.

Il completamento con `C-n` è, in ogni caso, molto efficace.

Il valore aggiunto, rispetto ad altri *editor*, è Vim stesso, con la sua infinita ricchezza di funzionalità native ed aggiuntive.

Come PDF reader per Vim consiglio [Zathura](https://pwmt.org/projects/zathura/): stessa impostazione essenziale e minimalista e stessi comandi.

Grazie per la vostra attenzione. 
