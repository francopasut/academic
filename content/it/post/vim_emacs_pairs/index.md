---
title: "Saltare tra coppie di caratteri e tag corrispondenti in Vim ed Emacs"
date: 2022-07-11
slug: jump_vim_emacs
categories:
  - Editors
tags:
  - Vim
  - Emacs
image:
  placement: 3
  preview_only: true 
  caption: 'Vim and Emacs insieme'
---



Quando si codifica o si scrive in un linguaggio di markup come HTML, Markdown o LaTeX, è molto utile saltare attraverso coppie di caratteri corrispondenti, come parentesi o tag.

Sia Vim che Emacs hanno comandi dedicati a questo scopo.

## Saltare tra coppie di caratteri corrispondenti usando [Vim](https://www.vim.org/)

Vim utilizza un comando a "carattere singolo" per saltare alle coppie corrispondenti più vicine e posizionare il cursore in quella di chiusura: `%`.

Per esempio: supponiamo che il cursore sia posizionato all'inizio della seguente frase:

> Se volete scriverne una vostra, usate il contenuto di [sintassi-ppss (punto)].

Quando si preme `%` il cursore salta alla corrispondente parentesi quadra di chiusura.

Se si preme `%` un'altra volta, il cursore torna alla parentesi quadra di apertura corrispondente.

Se si posiziona il cursore ovunque all'interno delle parentesi quadre e si preme `%`, il cursore salta alla parentesi tonda di chiusura.

Naturalmente, se si preme un'altra volta il comando `%` il cursore salta alla parentesi tonda di apertura corrispondente.

Lo stesso comportamento si applica ai tag di ambiente in alcuni linguaggi di markup, come al tag `quote` in LaTeX con il plugin [VimTeX](https://github.com/lervag/vimtex) (sull'ambiente "quote" in LaTeX si può leggere [questo mio articolo](https://francopasut-en.blogspot.com/2016/07/quote-quotation-quoting-in-latex.html)):

```
\begin{quote}
Testo all'interno dell'ambiente `quote`.
\´fine{citazione}
```

Se si posiziona a caso  il cursore all'interno del tag `\begin{quote}` e si preme `%`, il cursore salta all'ultimo carattere del tag `\end{quote}` (cioè quello corrispondente alla chiusura).

Se si preme un'altra volta `%` o lo si preme in modo casuale all'interno del tag `´end{quote}`, il cursore salta al primo carattere del tag ``begin{quote}`.

Pertanto, Vim, utilizza un singolo carattere per le varie coppie corrispondenti.

## Per saltare tra le coppie corrispondenti usando [GNU/Emacs](https://www.gnu.org/software/emacs/)

GNU/Emacs utilizza una soluzione leggermente diversa,

Supponiamo di avere il cursore puntato all'inizio della stessa frase precedente:

> Se volete scriverne una vostra, usate il contenuto di [syntax-ppss (point)].

Con il cursore sulla parentesi quadra di apertura, si deve premere `C-M-f` (che corrisponde alla funzione `forward-sexp`) per saltare alla parentesi quadra di chiusura corrispondente.

Se ora si preme `C-M-b` (che corrisponde alla funzione `backward-sexp`) il cursore salta indietro alla parentesi quadra di apertura corrispondente.

Lo stesso accade con le parentesi tonde e altri caratteri di accoppiamento.

È necessario, tuttavia, posizionare il cursore appena sopra il carattere di apertura o di chiusura corrispondente.

Quindi: le scorciatoie da tastiera standard per saltare attraverso le coppie corrispondenti in Emacs sono: `C-M-f` in avanti e `C-M-b` all'indietro.

Ma se si usa [AUCTeX](https://www.gnu.org/software/auctex/), un *sofisticato sistema di creazione* di documenti in LaTeX, e si ha bisogno di spostarsi tra i tag di ambiente corrispondenti, è necessario conoscere altre due scorciatoie.

La frase seguente è tratta da pag. 32 del manuale AUCTeX.pdf (tradotto da me):

> AUCTEX offre scorciatoie da tastiera per spostare il punto all'inizio e alla fine dell'ambiente corrente.

A pagina 28 si trovano le scorciatoie:

> [Comando] LaTeX-trova-corrispondenza-inizio (C-M-a) Sposta il punto all'inizio dell'ambiente corrente.

> [Comando] LaTeX-trova-corrispondenza-fine (C-M-e) Sposta il punto alla 'fine' dell'ambiente corrente.

Ma attenzione: per far funzionare le scorciatoie di AucTeX è necessario posizionare il cursore **all'interno dei tag dell'ambiente**. Se il cursore si trova al di fuori dei tag o addirittura sul backslash del tag di apertura, il comando `C-M-e` darà un risultato inatteso.

Quindi, in AucTeX è possibile utilizzare le scorciatoie standard per le parentesi e altri caratteri di accoppiamento e altre scorciatoie per gli ambienti aggiuntivi.

## Riassunto per Vim ed Emacs

Possiamo riportare, quindi, un breve riassunto:

* **Vim** usa, normalmente, un solo comando per ogni apertura o chiusura di elementi di coppia o tag.
**GNU/Emacs** utilizza due diverse scorciatoie standard per l'apertura e la chiusura dei caratteri corrispondenti, oltre ad altre scorciatoie a seconda dell'ambiente di lavoro.

Grazie per l'attenzione.


