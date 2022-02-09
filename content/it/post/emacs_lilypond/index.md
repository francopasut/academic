---
title: "Usare Emacs per scrivere partiture in LilyPond"
date: 2022-02-09
slug: emacs_write_lilypond
categories:
  - Editors
tags:
  - Emacs
  - LilyPond
image:
  placement: 3
  preview_only: false
  caption: Emacs and LilyPond per la musica'
---

{{% toc %}}


## A proposito di LilyPond

[LilyPond](http://lilypond.org/) è un linguaggio per produrre eleganti partiture musicali, strutturalmente simile al linguaggio LaTeX con il quale può integrarsi per generare documenti con testo e musica (per l'integrazione tra LilyPond e LaTeX richiamo [questo mio articolo](https://francopasut.netlify.app/it/post/lilypond-lyluatex/).)

Anche in LilyPond, come in LaTeX, è possibile scrivere il contenuto con vari editor.

Molto utile, soprattutto per la fase iniziale, è l'editor specifico denominato [Frescobaldi](https://www.frescobaldi.org/).

Per chi ha imparato la sintassi è possibile, invece,  sfruttare le infinite potenzialità di [Emacs](https://www.gnu.org/software/emacs/) o [Vim](https://www.vim.org/).

Questo articolo è dedicato ad Emacs. Un analogo articolo dedicato a Vim è [pubblicato qui](https://francopasut.netlify.app/it/post/vim_write_lilypond/).

Nel manuale d'uso di LilyPond,  attualmente alla versione 2.22, vengono riportate alcune indicazioni specifiche per [l'utilizzo con Emacs](https://lilypond.org/doc/v2.22/Documentation/usage/text-editor-support#emacs-mode) (vedasi paragrafo successivo).

Qui trovate   alcune informazioni aggiuntive sulla configurazione e sull'interfaccia di Emacs dedicata a LilyPond.

Tutti i passaggi  sono stati provati su due distribuzioni Linux: Ubuntu 21.10 e Arch.

## Voce "Modalità di Emacs" tratta dal Manuale d'Uso ufficiale di LilyPond

Riporto le indicazioni tratte dal Manuale d'Uso, al link sopra indicato, relative all'utilizzo di Emacs in LilyPond:

> Emacs ha una modalità ‘lilypond-mode’, che fornisce il completamento delle parole, l’indentazione, le parentesi automatiche e la colorazione della sintassi specifiche di LilyPond, comode scorciatoie per la compilazione e la possibilità di leggere i manuali di LilyPond usando Info. Se ‘lilypond-mode’ non è installato nel tuo computer, vedi sotto.

> Una modalità Emacs per inserire la musica e eseguire LilyPond è presente nell’archivio dei sorgenti nella directory ‘elisp’. Lancia make install per installarla in elispdir. Il file `lilypond-init.el` deve essere messo in load-path\* `/site-start.d/` o aggiunto a ‘`~/.emacs’` oppure ‘`~/.emacs.el`’.\*

> Come utente normale, puoi aggiungere il percorso dei sorgenti (ad esempio `~/site-lisp/)~` al tuo load-path aggiungendo la seguente riga (modificata di conseguenza) al file \~/.emacs

```
(setq load-path (append (list (expand-file-name "~/site-lisp")) load-path)) 
```

## Configurazione di Emacs per LilyPond

La modalità *Lilypond-mode*, menzionata nel manuale, non è un   pacchetto separato nell'[archivio Melpa](https://melpa.org/#/) (in cui è attualmente presente soltanto il pacchetto [flycheck-lilypond](https://melpa.org/#/flycheck-lilypond) dedicato a questo linguaggio) ma è un pacchetto integrato nativamente in Emacs.

Tuttavia le funzioni  **devono essere attivate** nel *file* di configurazione (normalmente `~/.emacs`).

A questo proposito [trovate una descrizione completa in questa pagina](http://www.geoffhorton.com/lilymacs.html).

Le linee da inserire nel file di configurazione sono le seguenti:


```
(autoload 'LilyPond-mode "lilypond-mode")
(setq auto-mode-alist
      (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))

(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))
```

Con questa configurazione,  Emacs *dovrebbe* attivare le funzioni dedicate quando viene caricato un documento con l'estensione *.ly*.

Se, invece,  le funzioni non venissero attivate all'apertura di  un file con estensione *.ly*), occorrerebbero alcuni passaggi aggiuntivi.

Prima di tutto è necessario cercare il percorso del pacchetto *lilypond-mode* utilizzando il comando  `locate lilypond-mode.el` (potrebbe essere necessario installare il  pacchetto *mlocate* con le procedure previste per le diverse distribuzioni, ad esempio `sudo pacman -S mlocate` in Arch) o altro comando analogo.

Una volta trovato il percorso (ad esempio: `~/lilypond/usr/share/emacs/site-lisp`),  occorre premettere la seguente linea,   come indicato nel manuale LilyPond:

```
(setq load-path (append (list (expand-file-name "~/lilypond/usr/share/emacs/site-lisp")) load-path))
```
Nel mio caso ho dovuto integrare il codice soltanto in Ubuntu con il seguente percorso: `~/lilypond/usr/share/emacs/site-lisp`)


## Utilizzo di Emacs per LilyPond ##

Quando si carica in Emacs un documento con estensione *.ly* vengono rese disponibili alcune funzionalità dedicate molto interessanti.

In primo luogo viene creata, contrariamente a quanto avviene con Vim, una voce di menu denominata esplicitamente *LilyPond*, come da video di seguito riportato:

![Menu LilyPond in Emacs](video_menu_lilypond.gif)

Inoltre nel menu *Command* viene riportata la combinazione di tasti per la compilazione del codice scritto in LilyPond e la generazione delle partiture in PDF, ovvero `C-c C-l` , come documentato  nell'immagine di seguito riportata:

![Menu Command in Emacs](menu_command.png)

Per il resto è... Emacs con tutto il suo potenziale di scrittura.

Per leggere i documenti in PDF consiglio Zathura, minimalista con  comandi  *vim-like*, oppure Okular,  che ha una struttura graficamente più ricca.

Grazie per la vostra attenzione.
