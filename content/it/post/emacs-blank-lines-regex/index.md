---
title: "Emacs: Studio sulla costruzione di espressioni regolari per eliminare o ridurre le righe vuote"
date: 2022-09-05
slug: emacs_regex_blank_lines
categories:
  - Editors
tags:
  - Emacs
  - RegEx
image:
  placement: 3
  preview_only: true 
  caption: 'Emacs Logo'
---

{{% toc %}}

Dopo l'articolo su   ["Vim: Studio sulla costruzione di Espressioni Regolari per cancellare o ridurre righe vuote con il Comando Globale"](https://francopasut.netlify.app/it/post/vim_regex_blank_lines/) ho provato a confrontarmi con un'analoga operazione in  Emacs.

L'obiettivo è studiare le differenze di sintassi relative alle "espressioni regolari" tra due sistemi di scrittura.

Quello che segue  è il risultato dei miei tentativi dopo varie ricerche in rete.



## Rimuovere le righe vuote in Emacs usando RegExp ##

Innanzitutto, può essere utile visualizzare le righe vuote del documento.

Per visualizzare in anteprima le righe vuote, si può usare la funzione *whitespace-mode* (`M-x whitespace-mode <RET>`): le righe vuote saranno contrassegnate da segni di dollaro, cioè righe in cui non c'è alcun carattere, nemmeno uno spazio bianco.

A questo punto è possibile selezionare una regione o operare sull'intero documento dal punto del cursore con la funzione `flush-lines`, o con l'alias `delete-matching-lines`, per rimuovere le righe che corrispondono al risultato di una ricerca:



``` 
M-x flush-lines <RET> ^$ <RET>
```

Il significato della formula è il seguente: rimuovere tutte le righe *che iniziano con un fine riga* (`$`), cioè *tutte le righe vuote*.



## Eliminazione delle righe vuote e delle righe con spazi bianchi ##

A partire dalla funzione precedente è possibile aggiungere un piccolo pezzo di "espressione regolare" per eliminare anche le righe con spazi bianchi.

Il nuovo frammento è il seguente: `\s-*` ed è composto da due segmenti diversi:

  * `\s-` che indica lo spazio bianco
  * `*` che indica che il carattere precedente può essere ripetuto zero o più volte.

Il codice completo è il seguente: 

``` 
M-x flush-lines <RET> ^\s-*$ <RET>
```



## Ridurre le righe vuote a una sola riga usando RegExp ##

Ma ora alziamo il livello di  difficoltà con una formula utile per chi scrive codice o linguaggi di markup, come LaTeX o Markdown, in cui è sufficiente una sola riga vuota per separare le righe di testo e, quindi, le righe vuote aggiuntive sono inutili.

Il nuovo obiettivo è, quindi, ridurre le righe vuote tra le righe scritte.

Il modello punta alla ricerca di almeno due righe vuote.

Ma a questo punto il linguaggio di Emacs si discosta dalle tipiche "espressioni regolari" perché l'editor mi avverte che per inserire una nuova riga non si può usare il comando `\n`, come avrei fatto in Vim, ma la combinazione `C-q C-j`.

Ma di cosa si tratta? Ho trovato una spiegazione chiara in [questa pagina](http://xahlee.info/emacs/emacs/keystroke_rep.html): 

> `C-q` è una notazione per la conbinazione da tastiera `Ctrl+q`. Il comando invocato da questa scorciatoia è `quoted-insert`. Il comando `quoted-insert` consente di inserire un carattere e di sopprimere la normale funzione del tasto corrispondente. 

> Il carattere `C-j` in `C-q C-j` serve per inserire il carattere ASCII Line Feed (usato in unix come carattere newline), che non ha un tasto corrispondente sulla tastiera. Il comando `C-j` identifica il  Line Feed che corrisponde ad uno standard ASCII. Ovvero: i caratteri non stampabili sono rappresentati da un controllo seguito da una lettera, indipendentemente dal fatto che esista un tasto corrispondente sulla tastiera. L'avanzamento di riga è il decimo carattere ASCII e la j è la decima lettera, quindi l'avanzamento di riga è C-j. 

Ho avuto qualche problema a capire come funzionava questa combinazione, perché ogni volta che la inserivo nel minibuffer ottenevo un vero *line feed* e non un codice.

Ma dopo un po' ho capito la soluzione! Continuando con il tasto <RET>, emacs traduce la voce in `^J`, che è ciò che serve per il nostro scopo.

È inoltre necessario utilizzare un'altra funzione rispetto a quella usata in precedenza: la funzione `query-replace-regexp`.

A questo punto, è sufficiente completare la formula di *ricerca* "duplicando" le righe da cercare con `{2,}` che, con i caratteri di escape (`\`), diventa `{2,\}` e, infine, anteporre il tipico carattere Regexp che indica l'inizio della riga `^`.



Ora  è sufficiente aggiungere il comando di  *sostituzione* che, ovviamente, consiste in una sola nuova riga `C-q C-j`, visualizzato come `^J`.

Riassumendo:

- Digitare `M-x query-sostituzione-rigexp <RET>`
- Digitare: `^C-qC-j\{2,\}`
- Si ottiene, dopo aver premuto il tasto <RET>: `^^J{2,\}`.
- Quindi digitate: `C-qC-j`
- Quindi si ottiene, dopo aver premuto il tasto <RET>: `^J`

Per far funzionare il comando digitate `!`.

La funzione cerca nelle righe dal punto del cursore in avanti tutte le doppie righe vuote e le sostituisce con una singola riga vuota finché la ricerca non fallisce.

È possibile utilizzarla anche all'interno di una *regione*.

Dopo il lancio del comando rimarrà solo una riga, che è l'obiettivo desiderato.



## Ridurre le righe vuote con spazi bianchi a una sola riga vuota ##

Ancora più difficile: vorrei includere nella ricerca le righe contenenti spazi bianchi e utilizzare una formula come quella precedente per mantenere solo una riga vuota.


È necessario modificare la parte di *ricerca* per includere gli spazi bianchi da *zero a infinito* (cioè l'operatore  `*`) dall'inizio della riga.

Dopo molti tentativi, ho trovato questa soluzione (senza escape):

```
(^C-q<SPC>*C-qC-j)
```

Tradotto in linguaggio umano: a partire dall'inizio della riga (`^`), si abbinano le righe  dove sono presenti spazi bianchi da zero a infinito `C-q<SPC>*`.

Il resto della formula è come la precedente.

Inserendo il nuovo frammento (con l'escape) dopo l'inizio del precedente (la `^`), avremo questa formula (ancora come digitata sulla tastiera):

```
^\(^C-q<SPC>*C-qC-j\)\{2,\}
```
Visualizzeremo la formula nel minibuffer come segue:

```
^\(^ *
\)\{2,\}
```


Dopo il completamento, aggiungendo la seconda parte della formula uguale alla precedente (`C-qC-j`), Emacs visualizzerà: 

```
^\(^ *^J\)\{2,\} → ^J
```

Dalle mie prove la formula funziona esattamente come desiderato.

In [questa pagina] (https://emacs.stackexchange.com/questions/60063/remove-multiple-blank-lines-in-a-buffer-leave-one), tuttavia, ho trovato una formula leggermente diversa che funziona altrettanto bene:

``` 
M-x query-sostituzione-rigexp <RET> ^\(^<SPC>*C-qC-j\)+ <RET> C-qC-j
```



Riporto anche la versione senza escape per maggiore chiarezza:

``` 
M-x query-replace-regexp <RET> ^(^SPC*C-qC-j)+ <RET> C-qC-j
```

Si tratta di un approccio diverso dal precedente, ma molto interessante e funzionante.

Grazie per l'attenzione.
