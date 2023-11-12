---
title: "Vim: cancellare frasi e paragrafi con gli \"Oggetti di Testo\""
date: 2021-04-20
canonical_url: "https://medium.com/@francopasut/vim-delete-sentences-and-paragraphs-via-text-objects-21d55a883e7b"
slug: vim_delete_sentences
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  caption: 'Vim logo'
---

{{% toc %}}




## Vim riduce l'affaticamento degli occhi

Un'incredibile caratteristica di Vim è la sua capacità di effettuare operazioni all'interno di interi blocchi di testo chiamati "Oggetti di Testo", come ad esempio parole, frasi e paragrafi, a prescindere dalla posizione del cursore all'interno degli oggetti.

Questo significa che potete piazzare il cursore ovunque all'interno del blocco di testo riducendo l'affaticamento degli occhi davanti al monitor.

La cancelleazione di **frasi** e **paragrafi** è un eccellente sistema per capire come questa caratteristica funzioni.

## Frasi e paragrafi 

Vim ha una specifica definizione di *frasi e paragrafi*.

Riporto la definizione originale in inglese (dal  [manuale ufficiale](http://vimdoc.sourceforge.net/htmldoc/motion.html#sentence)) tenendo conto che il concetto *sentence* è equivalente a quello di *frase* in italiano :

> A **sentence** is defined as ending at a \'.', \'!\' or \'?\' followed
> by either the end of a line, or by a space or tab.

> A **paragraph** begins after each empty line.

Il simbolo di attivazione per le *frasi* è il carattere `s` (ricordate che l'equivalente di frase è *sentence*). Il simbolo di attivazione per i paragrafi è il carattere `p`.

Per effettuare operazioni che coinvolgano gli interi blocchi di teste **a prescindere dalla posizione del cursore all'interno del blocco** occorre aggiungere i simboli `i` (mnemonico: Interno) o `a` (mnemonico: Attorno).

I possibili costrutti sono i seguenti:

| Oggetto testo | Significato          |
|---------------|----------------------|
| `is`          | *all'interno* di una frase  |
| `as`          | *attorno* ad una frase  |
| `ip`          | *all'interno* di una frase |
| `ap`          | *attorno* ad un paragrafo |

Qual è la differenza tra *all'interno* ed *attorno*? Gli **spazi bianchi**.

-   La `i` lascia immodificati gli spazi bianchi intorno all'oggetto di testo
-   La `a` estende le operazioni includendo anche ogni spazio bianco fino all'oggetto successivo

Per effettuare opezioni occorre soltanto aggiungere i comandi tipici di Vim, come *d*(elete=cancella) *c*(hange=modifica) or y(*ank*=copia).

Ecco la lista di comandi  completi per cancellare un oggetto di testo:

| Comando completo | Operazione effettuata       |
|------------------|-----------------------------|
| `dis`            | cancellazione *all'interno* di una frase  |
| `das`            | cancellazione *attorno* ad una frase|
| `dip`            | cancellazione *all'interno* di un paragrafo|
| `dap`            | cancellazione *attorno* ad un paragrafo|

Potete anche duplicare  o moltiplicare l'effetto aggiungendo all'inizio un numero, come ad esempio `2dap`.

La stessa operazione può essere, naturalmente, utilizzata per gli altri comandi.

## Esempi con brevi animazioni

Le seguenti animazioni in formato GIF sono state create con *Screenkey* e  *Peek* in ambiente Arch Linux (tenete presente che il cursore può essere ovunque all'interno dei blocchi, non necessariamente all'inizio).

Ecco il risultato dopo avere inserita la combinazione `dis`: notate gli spazi bianchi dopo la cancellazione della PRIMA frase.

![](vim_delete_sentences_1.gif)

Ecco il risultato per `das`: ora tutti gli spazi bianchi dopo la PRIMA frase sono stati eliminati.

![](vim_delete_sentences_2.gif)

Ed ecco il risultato per  `dip`: notate le tre linee vuote dopo la cancellazione del primo paragrafo.

![](vim_delete_sentences_3.gif)

Infine, ecco il risultato per `dap`: ogni spazio bianco dopo il primo paragrafo è stato eliminato ed il *focus* è puntato sul secondo paragrafo.

![](vim_delete_sentences_4.gif)

Usando gli "oggetto di testo" in Vim è possibile risparmiare molto tempo e ridurre l'affaticamente della vista!

Grazie per la vostra attenzione.




[Pubblicato in origine su Medium](https://medium.com/@francopasut/vim-delete-sentences-and-paragraphs-via-text-objects-21d55a883e7b)

