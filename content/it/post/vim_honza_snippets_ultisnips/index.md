---
title: "Vim,  UltiSnips ed Honza vim-snippets: differenza e gestione delle cartelle snippets ed UltiSnips"
date: 2022-10-20
slug: vim_honza_snippets_ultisnips
categories:
  - Editors
tags:
  - Vim
  - Snippets
image:
  placement: 3
  preview_only: true 
  caption: 'Cartelle di Honza vim-snippets'
---

{{% toc %}}


## Qual è l'argomento di questo articolo?

  In questo articolo  parlerò di Vim, degli snippet realizzati da [SirVer UltiSnip](https://github.com/sirver/UltiSnips): "_la soluzione definitiva per gli snippet in Vim_" e [Honza vim-snippets](https://github.com/honza/vim-snippets) (di seguito indicato anche semplicemente come "honza").

 Per ulteriori informazioni si può fare riferimento a [questo mio precedente articolo](https://francopasut.netlify.app/post/vim_markdown_snippet_url/).


[SirVer UltiSnip](https://github.com/sirver/UltiSnips) è un plugin per lanciare e gestire gli snippet in Vim.

L'applicazione non contiene snippet ma  è possibile creare i propri seguendo la sintassi del plugin o utilizzare una raccolta di snippet già pronti.

[Honza vim-snippets](https://github.com/honza/vim-snippets) contiene una vasta raccolta di snippet per vari linguaggi.

In realtà nel repository [Honza GitHub](https://github.com/honza/vim-snippets) si trovano due raccolte separate di snippet per gli stessi linguaggi.

Qual è la differenza? Questo è l'argomento di cui parleremo in questo articolo.

Tutte le operazioni sono state eseguite su un computer con sistema operativo GNU/Linux.


## Honza e le raccolte di snippet

Nel repository GitHub di Honza vim-snippets si trovano, come si vede nell'immagine seguente, due diverse raccolte di snippets: un elenco sotto il nome di cartella *UltiSnips* e un altro elenco sotto la cartella chiamata *snippets*.


![immagine delle cartelle in honza](honza-folders-decorated.jpg)

Il programmatore stesso offre queste spiegazioni all'inizio della pagina GitHub (tradotto dall'inglese):

- snippets/*: snippets che usano il formato snipMate
- UltiSnips/*: frammenti che usano il formato UltiSnips

Pertanto, le due raccolte sono destinate a due diversi gestori di snippet.

## Studio sulle due liste di snippet

Nella pagina `SirVer / ultisnips` si trova questa configurazione (supponendo di usare il gestore di plugin _Vundle_ e traducendo dall'originale in inglese):

>" I frammenti sono separati dal motore. Aggiungete questo se li volete:
>Plugin 'honza/vim-snippets'

Quando ho inserito questa configurazione, però, ho avuto la disponibilità solo degli snippet contenuti nella cartella *snippets* e non, invece, di quelli presenti nella cartella *UltiSnips*.

Ho notato che i frammenti, anche se creati per snipMate, funzionano senza problemi anche con UltiSnips.

Il problema è che i frammenti creati appositamente per UltiSnips non vengono utilizzati.

Per trovare una soluzione, ho fatto molte ricerche e prove.

Naturalmente, non garantisco che questa sia l'unica soluzione possibile. Tuttavia, funziona!

Prima di tutto, ho creato una cartella in locale chiamata "UltiSnips", ma potete chiamarla come volete.

Poi ho inserito in *.vimrc* la configurazione per attivare quella cartella, con un codice come il seguente (*MioNome* è il nome utente del sistema operativo):

```vim
let g:UltiSnippetDirectories = ['/home/MioNome/UltiSnips']
```
Infine ho scaricato un file, in particolare ho provato con la cartella `markdown.snippets`, dalla collezione UltiSnips di Honza nella cartella locale chiamata UltiSnips.

Gli snippet erano tutti attivati e funzionanti. 

Funzionano anche senza il richiamo `honza.snippets` nel file .vimrc!

Questo significa che i file della collezione UltiSnips sono autoeseguibili. 

Naturalmente, in quest'ultimo caso gli *snippet honza online* non sono disponibili.

Gli *snippet locali* funzionano anche su parti di testo selezionate: è possibile applicare gli snippet in modalità VISUAL per utilizzare il resto evidenziato come snippet precompilato.

Nella cartella locale si possono anche aggiungere facilmente snippet personalizzati (per questo passaggio rimando a [questo articolo](https://francopasut.netlify.app/post/vim_markdown_snippet_url/).


Se invece si mantiene il richiamo a `honza/vim-snippets` nel file *.vimrc*, allora si avranno sia gli snippet online di Honza che quelli locali con i propri snippet personalizzati, se presenti.

Credo che questa sia la soluzione più completa per avere la massima disponibilità di risorse in ogni lingua elencata nelle cartelle di Honza.

Ovviamente un grande ringraziamento al gestore degli elenchi di snippet, il signor Honza Pokorny.

E grazie per l'attenzione.
