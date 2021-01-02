---
title: "Emacs, Markdown-mode, inserimento di spazi nei collegamenti testuali creati con il comando \"C-c C-l\""
date: 2020-08-01
canonical_url: "https://francopasut.github.io/editors/emacs-space-link-text/"
slug: emacs_markdown_spaces
categories:
  - Editors
tags:
  - Emacs
  - Markdown
image:
  placement: 3
  caption: 'Emacs logo'
---

{{% toc %}}


##  Le risorse di riferimento: Emacs, Markdown-mode


Questo articolo riguarda le seguenti risorse:




- Emacs: GNU Emacs 26.3 (build 1, x86_64-pc-linux-gnu, GTK+ Version 3.22.30) of 2019-12-03
- Markdown Mode: markdown-mode-20200622.20
- OS: Linux Ubuntu 20.4 LTS, Linux Fedora 32

Il problema in poche parole: occorre inserire un collegamento testuale in un documento scritta utilizzato il Markdown-mode for Emacs e nel testo descrittivo del collegamento occorre inserire uno o più spazi.

Questi sono i singoli passaggi:

1. Digitate a tastiera il comando `C-c C-l`
2. Inserite un collegamento e premete `Return`
3. Inserite una descrizione del collegamento con alcuni spazi all'interno ... **STOP!**

A questo punto noterete che il _minibuffer_ di Emacs non accetterà gli spazi e riceverte un avviso del tipo "_No match_".

C'è qualche problema? Avete commesso qualche errore?

Nulla del genere.

Trattasi di un comportamento previsto del programma.


Per tale problema ho recentemente inviato una sengalazione presso jrblevin/markdown-mode e la soluzione è stata immediata.


## La soluzione del servizio ufficiale di assistenza 

Se avete necessità di inserire spazi nel vostro testo descrittivo del collegamento in Markdown-mode potete utilizzare la combinazione `C-q` seguita dal tasto `spazio`.

`C-q` lancia il comando quoted-insert (come riscontrato nel global-map), che è una funzione interattiva di Lisp.


Il comando legge il successivo carattere e lo inserisce nel testo.

Se il carattere successivo è uno _spazio_ lo inserisce nel minibuffer e voi avrete risolto il problema.

Se volete utilizzare direttamente il tasto  `spazio`  la _minibuffer-local-completion-map_ nel vostro _.emacs_ file come di seguito indicato: 


```elisp
(defun my/markdown-mode-hook ()
  (define-key minibuffer-local-completion-map (kbd "SPC") 'self-insert-command))
  
```




Ringazio il servizio di assistenza jrblevin/markdown-mode Team per la soluzione.

Grazie a tutti per la vostra attenzione.


Pubblicato in origine sul [mio Notebook](https://francopasut.github.io/editors/emacs-space-link-text/)

