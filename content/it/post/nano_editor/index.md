---
title: "Nano, l'editor minimalista per editing rapido e leggero"
date: 2026-03-03
slug:  nano_editor
categories:
  - Blog
tags:
  - Nano
  - Vim
image:
  placement: 3
  preview_only: false 
  caption: 'Nano and Vim'
canonicalUrl: https://francopasut.blogspot.com/2026/03/nano-leditor-minimalista-per-editing.html
---

- [1. Perché Nano?](#1-perché-nano)
- [2. Incollare da clipboard](#2-incollare-da-clipboard)
- [3. Spostamento tra le righe](#3-spostamento-tra-le-righe)
- [4. Plugin o non plugin?](#4-plugin-o-non-plugin)
- [5. Impostazione come editor principale](#5-impostazione-come-editor-principale)
- [6. Perché NO Nano?](#6-perché-no-nano)


# 1. Perché Nano?

Nano è un editor di testo a riga di comando, noto per essere uno dei più semplici e intuitivi disponibili  nel mondo GNU/Linux.

Si trova nella maggioranza delle distribuzioni Linux ed è uno  strumento alla portata di tutti "a prima vista".

In fondo alla schermata si trova la descrizione dei comandi più ricorrenti in cui il simbolo `^` rappresenta il tasto `Ctrl` mentre il simbolo "M" indica in tasto Alt (che una volta era denominato Meta e che viene ancora chiamato così in Emacs).

Ad esempio: `^O` significa: premere `Ctrl + O` per salvare il documento corrente.

Altro esempio: `M-U` significa: premere `Alt + U` per annullare  l'ultimo comando.

Il tasto `Ctrl + Invio` consente di attivare i link contenuti all'interno dei documenti aperti in Nano.

Ecco il "menu principale" in italiano:

![img](./nano_menu_it.png)

Più  ampia è la finestra del terminale e più comandi vengono visualizzati.

La gestione dei fondamentali è, dunque, estremamente semplice e la curva di apprendimento si risolve in pochi minuti.

Tutto ciò che occorre fare è seguire le indicazioni.

Dunque basta lanciare l'editor e leggere il menù a fondo pagina.

Tutto qui!

Ecco, dunque, "perché Nano".

# 2. Incollare da clipboard

Un piccolo "incidente" è capitato quando ho dovuto incollare all'interno di Nano un frammento di testo copiato nella *clipboard*.

Il comando `^U`, indicato nel menù, non ha funzionato.

Questo piccolo problema deriva dal fatto che il  comando `^U` (Uncut) di Nano cerca testo che è stato tagliato all'interno di Nano stesso tramite `^K.`

La Clipboard di sistema non è, invece, stata tagliata all'interno di Nano ma è quella che si usa con `Ctrl+C` e `Ctrl+V` (o tasto destro del <span class="underline">mouse</span> + copia).

Per risolvere si usa la scorciatoia del Terminale: poiché Nano gira dentro un emulatore di terminale, occorre utilizzare le scorciatoie del terminale stesso, che solitamente aggiungono lo Shift al Ctrl + V: quindi si digita  `Ctrl + Shift + V`.

Problema risolto!

# 3. Spostamento tra le righe

Lo spostamento tra le righe avviene, molto semplicemente, con i tasti freccia
↑ ↓ ← →.

Oppure, e questo è particolarmente utile per chi conosce Emacs, si possono utilizzare le combinazioni:

-   `Ctrl + P` (P è per *Previous*) che si sposta alla riga precedente
-   `Ctrl + N` (N è per Next) che si sposta alla riga successiva.

Sono esattamente i comandi standard del "vecchio" Emacs, che sto utilizzando in questo momento per scrivere l'articolo in Ord Mode.

# 4. Plugin o non plugin?

L'editor Nano non supporta estensioni o *plugin*, contrariamente a  Vim (con il suo vasto ecosistema di plugin via vim-plug o simili) o altri editor avanzati.

Nano è progettato per essere leggero e semplice, puntando su configurazioni minimali piuttosto che su un sistema di plugin estensibile.

Quindi Nano offre solo queste opzioni base, adatte a editing rapidi ma non a flussi di lavoro avanzati.

# 5. Impostazione come editor principale

Per impostare Nano come editor principale in Linux occorre utilizzare una variabile d'ambiente chiamata `$EDITOR`.

Per effettuare una configurazione temporanea si digita il comando da terminale `export EDITOR='/usr/bin/nano'`.

In questo caso la configurazione sarà attiva solo fino alla chiusura del terminale.

Per rendere permanente la configurazione occorre, invece, modificare il file *.bashrc*, magari utilizzando proprio Nano con il comando `nano ~/.bashrc` ed aggiungendo, in fondo, la riga: `export EDITOR='usr/bin/nano'`.

Per salvare si preme `Ctrl+O,`, e, poi,  `Ctrl+X` per uscire.

Per applicare subito la modifica senza riavviare: `source ~/.bashrc`.

Per le distribuzioni derivate da Debian si può utilizzare anche il comando `sudo update-alternatives --config editor`.

Ovviamente il procedimento vale anche per altri editor.

# 6. Perché NO Nano?

Quindi, Nano va benissimo per configurazioni veloci ma ha alcune limitazioni rispetto ad altri editor più completi, ma anche più impegnativi.

In particolare, non ha un tasto "Copia nella Clipboard di Sistema" integrato come gli editor moderni.

Inoltre non può esteso con plugin o estensioni varie.

Vim fa tutto quello che fa Nano e molto più.

Il problema di Vim è che, contrariamente a quanto accade con Nano, occorre saperlo usare e la curva di apprendimento è piuttosto ripida.

Rammento che, come descritto in [questo mio articolo](https://francopasut.netlify.app/it/post/vim_others/), Vim può essere inteso non necessariamente riferito all'applicazione Vim ma anche alle varie modalità di emulazione illustrate in questo mio articolo.

Grazie per la vostra attenzione.
