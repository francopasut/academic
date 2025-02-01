---
title: "Unire diverse linee di testo in Emacs utilizzando la configurazione di tastiera americana internazionale con Dead Keys"
date: 2020-08-08
canonical_url: "https://francopasut.github.io/editors/emacs-joinlines/"
slug: emacs_join_lines
categories:
  - Editors
tags:
  - Emacs
image:
  placement: 3
  caption: 'Logo di Emacs in verde'
---




## Unire diverse linee: Vim vs Emacs ##

_Vim_ ha un sistema molto semplice per unire due diverse linee di testo: basta premere il tasto `J` maiuscono nella linea superiore. 

In _Emacs_, invece, occorre utilizzare la combinazione `C-^` nella linea inferiore.

Ma questa combinazione risulta essere molto laboriosa nella configurazione di tastiera  _US International Dead Keys_  in MS Windows o GNU/Linux.

In ogni caso, con un piccolo aggiustamento, può diventare super-efficiente.

Quella che segue è, ovviamente, la mia soluzione ma ognuno può trovarne un'altra migliore.

## Caret o Circumflex  ##


Prima di tutto occorre dare un'occhiata alla tastiera con configurazione _US International Dead Keys_ in  corrispondenza al numero 6 ed, in particolare, ai due simili caretteri indicati in altro sul tasto. 


 ![Figure 1](tasto_6_US.png "Il carattere corretto è quello in alto a destra nel quadratino centrale")


Come potete vedere vi sono due caratteri molto simili tra loro: `^` (piccolo) e `^`. 

Entrambi sono lo stesso carattere, ovvero _Caret_ or _Circumflex_.

La differenza è nell'utilizzo: il primo carattere è utilizzato per i caratteri composti, come _â, ê_, etc.

Il secondo, invece, è utilizzato con carattere a sé stante.

Per la combinazione `C-^`  occorre utilizzare la seconda versione del carattere, ovvero  il carattere _circumflex_ a sé stante.


## La combinazione di tasti originale ##

La combinazione di tasti originale per unire due caratteri in Emacs è apparentemente molto semplice:  `C-^` nella linea sottostante (Ricordate la differenza con  _Vim_ in cui il carattere `J` deve essere digitato nella linea superiore).

Ma nella tastiera _US International Dead Keys Layout_  dovete premere tre diversi tasti per ottenere il carattere `^` a sé stante, _Shift + Alt Gr + 6_, e, quindi, aggiuntere il caratetre _Control_  come potete vedere nelle immagini seguenti:



![Figura 2](combinazione_mani.jpg "Come su un pianoforte, vista laterale")


![Figura 3](combinazione_mani2.jpg "Come su un pianoforte, vista dall'alto")


Non sembra una combinazione di tasti pianistica?

Non è certamente molto immediato da ottenere.

Questo è uno dei casi in cui è meglio modificare la combinazione originale.

## Una combinazione alternativa ##

È molto semplice impostare una combinazione alternativa per ottenere il risultato desiderato.

La migliore soluzione è quella di utilizzare una combinazione non già utilizzata da Emacs.

Per esempio la combinazione `C-,` (Control + virgola) può essere molto efficiente perché è semplice da raggiungere.

Per ottenere tale combinazione occorre semplicemente inserire il seguente codice nel file di configurazione _.emacs_:

``` elisp
(global-set-key (kbd "C-,") 'join-line)
```

Dopo avere riavviato Emacs potrebe semplicemente utilizzare la nuova combinazione `C-,` nella linea inferiore per unirla a quella superiore.

Grazie per la vostra attenzione.

Pubblicato in origine nel [mio Notebook](https://francopasut.github.io/editors/emacs-joinlines/)

