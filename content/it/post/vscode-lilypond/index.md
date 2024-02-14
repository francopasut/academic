---
title: "Usare Visual Studio Code per scrivere partiture in LilyPond."
date: 2024-02-11
slug:  vscode-lilypond
categories:
  - Blog
tags:
  - VSCode
  - LilyPond
image:
  placement: 3
  preview_only: false 
  caption: 'LilyPond e Visual Studio Code'
---



Abstract: *Visual Studio Code* è un ottimo ambiente integrato per la scrittura dei codici  di programmazione, ma può essere utilizzato anche come editor per il linguaggio LilyPond dedicato alla scrittura della musica? 

- [1. Precedenti articoli su editor per LilyPond](#1-precedenti-articoli-su-editor-per-lilypond)
- [2. Visual Studio Code originale o Code - OSS?](#2-visual-studio-code-originale-o-code---oss)
- [3. Installazione dell'estensione VSLilyPond.](#3-installazione-dellestensione-vslilypond)
- [4. Uso di VSCode con il plugin VSLilyPond come IDE per LilyPond.](#4-uso-di-vscode-con-il-plugin-vslilypond-come-ide-per-lilypond)
- [5. Osservazioni conclusive su VSCode come IDE Per LilyPond.](#5-osservazioni-conclusive-su-vscode-come-ide-per-lilypond)


## 1. Precedenti articoli su editor per LilyPond

Sul tema della scrittura di partiture musicali tramite  LilyPond, linguaggio di marcatura equivalente al LaTeX per i testi, richiamo i miei precedenti articoli dedicati, rispettamente, ad *Emacs* e *Vim*:
- [Usare Emacs per scrivere partiture in LilyPond](https://francopasut.netlify.app/it/post/emacs_write_lilypond/)
-   [Usare Vim per scrivere partiture in LilyPond](https://francopasut.netlify.app/it/post/vim_write_lilypond/)

In questo breve articolo riporto una serie di  prove dedicate a *Visual Studio Code* per lo stesso motivo: scrivere partiture tramite  LilyPond.

## 2. Visual Studio Code originale o Code - OSS?

Visual Studio Code, per brevità *VSCode*, è un editor  di codice multipiattaforma sviluppato da Microsoft e lanciato in produzione dal 2015.

Attualmente è uno degli editor integrati più utilizzati dai programmatori.

La versione originale è distribuita da Microsoft con una licenza proprietaria.

Oltre alla versione originale è disponibile, in varie piattaforme, una versione *open source*, per brevità *Code - OSS*.


Tuttavia  *VSCode* e la versione *open source* non sono del tutto sovrapponibili per quanto concerne le estensioni disponibili.

In particolare, per quanto interessa questo articolo,  *VSCode* e *Code - OSS* hanno una notevole differenza di comportamento, alla data di questo articolo, per quanto concerne proprio le estensioni per *Lilypond*.


Per dimostare quanto sopra anticipato, riporto l'esito della ricerca di estensioni con il nome  *"lilypond"* in *VSCode*:

![lilypond_vscode](vscode_lilypond_extensions.png)

Riporto, poi, l'esito di identica ricerca in *Code - OSS*:

![lilypond_codeoss](code_oss_lilypond_extensions.png)

Per maggiore chiarezza riporto, uno di seguito all'altro, le informazioni sulle versioni:

![vscode-release](vscode-relase.png)

![codeoss-release](codeoss-release.png)

Risulta, pertanto, una notevole differenza nel numero delle estensioni per LilyPond disponibili:

- in *VSCode* ne sono disponibili otto.
- in *Code - OSS* ne è disponibile soltanto una.

Le prove sono state  effettuate, dunque, con Visual Studio Code nella versione originale  in sistemi operativi GNU/Linux, in particolare *Arch*,  *Fedora* e *Ubuntu*.

In *Arch* e *Fedora* il software *VSCode* può essere  installato dal  *Software Center* tramite [Flatpak](https://flatpak.org).

In *Ubuntu* viene installata tramite l'*App Center*.


## 3. Installazione dell'estensione VSLilyPond.

Per avere le funzionalità dedicate a *LilyPond* ho installato l'estensione [*VSLilyPond*](https://www.mutopiaproject.org/index.html), disponibile soltanto in *VSCode*, ovvero nella versione originale dell'*editor*.

L'installazione dell'estensione tramite *Software Center* in Arch e Fedora, in ambiente desktop *Gnome*, e *App Center* in Ubuntu non ha comportato alcun problema ed è stata automaticamente completata con  
 estensioni accessorie,  tra cui *LilyPond PDF Preview*.

Tuttavia  **dopo** l'installazione dell'estensione in ***Arch Linux*** il plugin *VSLilyPond* **non ha riconosciuto  il comando *lilypond* installato con l'omonimo pacchetto tramite *pacman***,  il gestore di pacchetti di tale sistema operativo.

Per rendere *visibile* il comando *lilypond* in *Arch Linux* è stato necessario scaricare ed installare  manualmente la **versione generica** del software di notazione musicale da [lilypond.org](https://lilypond.org/download.html), scompattarla in un cartella nella *home* e modificare le impostazioni di *VSCode* inserendo manualmente il percorso assoluto nella *home*.

Riporto la videata della configurazione:

![lilypond path](path_to_lilypond.png)

In *Fedora* ed in  *Ubuntu*, invece l'installazione si è subito  perfettamente integrata  nei sistemi operativi ed il comando *lilypond* è stato, in entrambi i casi, avvenuto senza alcuna modifica delle configurazione del *plugin*.

## 4. Uso di VSCode con il plugin VSLilyPond come IDE per LilyPond.

Il plugin *VSLilyPond* consente di utilizzare *VSCode* come IDE per LilyPond sfruttando la potenzialità di *IntelliSense* per la scrittura del relativo codice sorgente.

Il PDF aperto, come da istruzioni, con il plugin   *LilyPond Pdf Preview* consente la sincronizzazione diretta ed inversa con il documento sorgente.

Riporto di seguito un sorgente in LilyPond affiancato al relativo anteprima visualizzato con il *plugin* sopra indicato:

![lilypond and preview](vslilypond-pdf_preview-bach.png)

Però c'è un **fastidioso problema**:  l'anteprima, aperta seguendo le indicazioni riportate nella pagina dell'estensione [VSLilyPond-PDF-preview](https://github.com/lhl2617/VSLilyPond-PDF-preview), **non si aggiorna** nel caso di modifiche della partitura.

In pratica: le modifiche aggiunte alla partitura dopo l'apertura dell'anteprima, **non vengono visualizzate**.

Il problema è stato trattato in rete in [questa discussione](https://github.com/lhl2617/VSLilyPond-PDF-preview/issues/115) e, ad oggi, non mi risulta che sia stato risolto.

Attualmente occorre chiudere e riaprire il PDF ogni volta che occorra visualizzare  le modifiche della  partiture.

Si potrebbe, ovviamente, utilizzare un diverso *editor*, come ad esempio [Zathura](https://pwmt.org/projects/zathura/) ma si perderebbe il puntamento bidirezionale tra codice sorgente e documento in PDF, che descrivo di seguito.

*VSLilyPond-PDF-preview*  funziona, invece, molto bene per le operazioni di puntamento diretto e inverso tra sorgente e PDF (*Point and Click*).

Per il **puntamento diretto dal sorgente al PDF** si colloca il cursore sulla sinistra della nota da visualizzare, si apre la  *Command Palette* (`Ctrl + Shift + p`) e si attiva il comando `LilyPond PDF Preview: Go to PDF location from Cursor` (o l'equivalente in italiano).

Per il **puntamento inverso dal PDF al sorgente**  basta *cliccare* su qualsiasi elemento della partitura in PDF. 

## 5. Osservazioni conclusive su VSCode come IDE Per LilyPond.


*VSCode* con l'estensione  *VSLilypond* e le connesse estensioni aggiuntive può, dunque, essere utilizzato come IDE per LilyPond.

Offre  un controllo di sintassi con evidenza a colori e formattazione dedicata al linguggio, nonché funzioni di autocompletamento, grazie al motore *IntelliSense* che costituisce il suo *punto di forza* rispetto ad altre soluzioni.

Il sistema è, dunque, complessivamente molto interessante.

Ad oggi, tuttavia, rimane l'ostacolo della mancanza di aggiornamento dell'anteprima.

Trattasi di un problema abbastanza fastidioso tale da farmi dubitare di avere commesso qualche errore di configurazione, nonostante che  [non sia il solo ad averlo riscontrato](https://github.com/lhl2617/VSLilyPond-PDF-preview/issues/115).

Se qualcuno conoscesse la soluzione per l'anteprima chiederei di farmelo sapere.

Per tale motivo  credo che, nonostante le avanzate caratteristiche di VSCode, continuerò  ad utilizzare, sino alla soluzione di quel problemino, un *editor progettato e realizzato esclusivamente per *LilyPond*, come 
[Frescobaldi](https://www.frescobaldi.org),   oppure *Vim* o *Emacs*, come illustrato negli articoli menzionati nel paragrafo n. 1.

Grazie per l'attenzione.