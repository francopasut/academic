---
title: "Vim - VimTex, Emacs - AucTeX: creare ambienti in campi vuoti"
date: 2022-12-10
slug:  vimtex_auctex_ambienti_vuoti
categories:
  - Editor
tags:
  - Vim
  - Emacs
image:
  placement: 3
  preview_only: false 
  caption: 'Vim and Emacs al last together'
---

{{% toc %}}



## Di cosa parliamo?

Questo post è il seguito del mio precedente intitolato "[Vim, VimTex:
ambienti e comandi in
LaTeX](https://francopasut.netlify.app/post/vim_vimtex_surround/)" in
cui ho descritto la creazione di tag di ambiente nel linguaggio LaTeX
attraverso il plugin "surround.vim" di Vim.

In particolare, ho descritto come aggiungere *tag* di ambiente agli
oggetti *words* e *lines* **non vuoti**, cioè a partire da testo già
esistente.

Se avete bisogno di un promemoria sul concetto di "linea" in Vim, potete
fare riferimento a questo mio articolo:
\[\[<https://francopasut.netlify.app/post/vim_double_motions/>\]\["Cosa
si intende per "linea" in Vim? Come configurare una doppia modalità
alternata di movimento tra le righe?".\]

Qui aggiungerò alcune considerazioni sui tag per gli ambienti in LaTeX
con l'utilizzo di Vim, ma ora in **oggetti vuoti**, cioè oggetti
virtuali che verranno riempiti di testo solo dopo la creazione dei
*tag*.

## Aggiungere tag di ambiente in LaTeX a oggetti vuoti con Vim

Per aggiungere tag di ambiente in LaTeX a oggetti vuoti in Vim si usa lo
stesso comando degli oggetti base reali, cioè gli oggetti "parola" e
"linea".

In breve, si utilizzano i riferimenti agli oggetti virtuali "parola" o
"riga".

Pertanto, le combinazioni possibili sono (nel sistema operativo
GNU/Linux) le seguenti:

- `yswe nome-ambiente` per creare un ambiente attorno a un "oggetto
  parola virtuale".

- `ysse nomte-ambiente` per creare un ambiente attorno a un "oggetto
  linea virtuale".


Il risultato tra le due versioni dovrebbe essere il medesimo, ma in
  realtà non è così (almeno in Linux): con il primo comando i tag di
  ambiente sono attaccati l'uno all'altro (senza righe vuote tra loro),
  mentre con il secondo comando i tag sono separati da due righe vuote.

  Ecco due esempi con il tag `center`: il primo creato con `yswe` ed il
  secondo con `ysse`:

- Primo esempio:

  ``` latex
  \begin{center}
  \end{center}
  ```

- Secondo esempio

  ``` latex
  \begin{center}


  \end{center}
  ```


Nel primo caso, quindi, è necessario aggiungere una riga vuota sotto
  il primo tag prima di iniziare a scrivere, mentre nel secondo caso si
  può iniziare a scrivere subito.

  Eseguendo Vim in MS Windows, come debbo fare (necessariamente) per il
  mio lavoro, la seconda combinazione non funziona e la prima crea una
  riga vuota tra i tag.

## Aggiungere tag di ambiente in LaTeX al testo vuoto usando Emacs e AucTeX

Non posso, a questo punto, non menzionare il mondo parallelo di Emacs
con il pacchetto AucTeX dedicato al linguaggio LaTeX.

In AucTeX quasi tutto è integrato nel pacchetto.

Per creare una nuova coppia di tag di ambiente è necessario utilizzare
il comando `C-c C-e` seguito da *Tipo di ambiente*.

Il minibuffer propone una scelta predefinita, la stessa dell'ultima
utilizzata o "itemize" per la prima volta.

Inoltre, AucTeX imposta già il cursore nella riga all'interno
dell'ambiente appena creato

## Vim vs Emacs, ovvero VimTeX vs AucTeX

Vim è praticamente insuperabile nel suo ambiente naturale, ovvero in
GNU.

L'autore di VimTeX ha espressamente dichiarato che la programmazione non
è stata progettata per MS Windows.

In effetti sotto Windows Vim perde un po' di efficacia.

Emacs, invece, ha lo stesso funzionamento con la stessa efficacia in
entrambi i sistemi operativi.

L'impostazione del pacchetto AucTeX che tende ad avere tutte le funzioni
per LaTeX al proprio interno, può essere molto comoda.

A voi la scelta.

Grazie per la vostra attenzione.
