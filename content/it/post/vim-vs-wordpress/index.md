---
title: "Dagli Oggetti di Testo in Vim ai Blocchi di Testo in Gutenberg per WordPress."
date: 2023-11-27
slug:  vim-vs-gutenberg
categories:
  - Blog
tags:
  - Vim
  - WordPress
  - Gutenberg
image:
  placement: 3
  preview_only: false 
  caption: 'Vim vs WordPress'
---



## A proposito di  *Vim* e *Gutenberg*

Vim è un *editor* a linea di comando. Gutenberg per WordPress è un editor visuale.

Vim è stato creato nel 1987,  come evoluzione dal precedente Vi. Gutenberg è diventato l'editor predefinito di   WordPress dalla versione 5.0 del CMS, rilasciata  il **27 novembre 2018**.

Sono strumenti di scrittura cronologicamente e strutturalmente molto distanti tra loro.

Ma, nonostante le diffenze, vi sono anche alcune analogie.

Vim consente di scrivere trattando il testo come "oggetto". Gutenberg consente di scrivere trattando il testo come "blocco".

Gli "oggetti di testo" di Vim possono essere modificati o spostati "in blocco". Lo stesso accade, ovviamente, con i "blocchi di testo" di Gutenberg.

Il principio della "scrittura a blocchi" ha origini lontane nel tempo: Vim ne è il primo esempio. Gutenberg l'ultimo.

## Esempi  di "oggetti di testo" in Vim.

*Oggetti di testo* possono essere parole, frasi, paragrafi oppure altre  combinazioni (in LaTeX, ad esempio, anche gli "ambienti" e i "comandi" sono oggetti di testo).

Ho trattato l'argomento degli "oggetti di testo" in [questo articolo](https://francopasut.netlify.app/it/post/vim_delete_sentences/), al quale rimando per i dettagli.

Il costrutto `ip`, in particolare, attiva il testo all'interno di un paragrafo. Le effettive operazioni vengono eseguite premettendo agli oggetti di testo specifici comandi.

Aggiungendo il comando `d` si cancellano tutti i caratteri presenti nell'oggetto di testo. Con il comando  `c` vengono sia cancellate che rimesse immediatamente in modalità di scrittura. Con il comando `y` il testo viene semplicemente copiato.

Senza ulterioremente approfondire i dettagli della sintassi di Vim, per i quali richiamo l'articolo sopra menzionato, riporto a titolo di esempio il comando completo `dip` che cancella tutto il contenuto all'interno dell'*oggetto di testo* "paragrafo".

In ogni caso l'*oggetto di testo*, che nel caso precedente era rappresentato dal  "paragafo",  viene gestito come un  blocco autonomo e distinto dal resto del contesto documentale ed a prescidere dalla propria lunghezza.

Altro esempio: in Vim si utilizza il comando  di copia (`yy`) per copiare una riga di testo  e incollarla in un'altra posizione (`p`).

In Vim, inoltre,  si può utilizzare il comando `ddp` per scambiare la posizione di due righe.



## Esempi di blocchi di testo in Gutenberg.

Gutenberg è basato sulla "scrittura a blocchi" che costituisce la versione "moderna" degli oggetti di testo di Vim.

Di seguito,  un esempio di operazione di cancellazione applicato ad un "blocco di testo" di Gutenberg (occorre fare riferimento al puntatore in fondo alla colonna della voce di menù):

![cancella blocco](cancella_blocco.png)

Altro esempio: in  Gutenberg si può copiare l'intero blocco di testo con il comando ***Copia*** che trovate inquadrato all'inzio della colonna del menù nell'immagine precedente. 

Lo scambio della posizione dei blocchi, in Gutenberg, si effettua trascinando e rilasciando i blocchi di testo.


## Vim e Gutenberg insieme.

Sia gli oggetti di testo in Vim che la scrittura a blocchi di testo con Gutenberg in WordPress offrono, dunque, un modo strutturato per manipolare il testo e organizzarlo nei formati desiderati.




Tanto Vim quanto Gutenberg si basano su una struttura modulare per organizzare il testo.

In Vim, è possibile utilizzare comandi specifici per manipolare i blocchi di testo, come spostare, copiare o eliminare righe.

In Gutenberg, invece, si possono utilizzare blocchi di testo autonomi per creare la  struttura di contenuti, come paragrafi, titoli, immagini o citazioni.


L'uso dei blocchi di testo in Gutenberg si presenta, dunque,  come una evoluzione (o involuzione, a seconda dei punti di vista) "visuale" degli oggetti di testo di Vim.



## In conclusione.

Le analogie tra gli oggetti di testo in Vim e la scrittura a blocchi di testo con Gutenberg in WordPress sono notevoli e gli esempi sopra riportati sono solo una sintesi.

Sembra, quindi, che vi sia un "filo rosso" che colleghi il  "leggendario" Vim con il "moderno" Gutenberg.

Grazie per l'attenzione.
