---
title: "Vim e la ricerca di testo contenente una barra obliqua o un punto di domanda"
date: 2021-10-01
canonical_url: "https://francopasut.blogspot.com/2021/01/vim-e-la-ricerca-di-testo-contenente.html"
slug: vim_special_search
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: true 
  caption: 'Vim logo'
---



## Breve premessa sulla ricerca in Vim

La ricerca in Vim viene attivata premendo in modalità normale la barra
obliqua `"/"` (da non confondere con la barra retroversa
`"\"`) o il punto di domanda.

Nel primo caso viene attivata la ricerca dal cursore in avanti, nel
secondo caso all\'indietro.

Per avanzare il puntatore nei risultati della ricerca si preme il
carattere `"n"` (mnemonico per \"*next*\"). Per invertire la
direzione del puntatore si preme il carattere `"N"`, ovvero
\"n maiuscolo\".

Ma cosa accade se nel testo da cercare fosse presente una barra obliqua
o un punto di domanda, ovvero gli stessi caratteri che attivano le
ricerche?

La soluzione *canonica* è quella del *carattere di Escape*.

## Uso del carattere di Escape

Il carattere di *Escape* è la barra retroversa: `"\"`.

Per trasformare il carattere speciale `"/"` (in caso di
ricerca in avanti) o `"?"` (in caso di ricerca all\'indietro)
in normale carattere di testo ricercabile occorre anteporre l\'*Escape*,
altrimenti la ricerca darebbe esito negativo.

Esempio: se nel testo da ricercare fosse presente la parola \"/test\"
l\'attivazione di una ricerca con i caratteri `//test`,
ovvero con la barra obliqua di attivazione `/` più la stringa
`/test`, darebbe risultato negativo.

Occorre anteporre il carattere di Escape per neutralizzare la barra
obliqua all\'interno del testo da cercare: \"`/\/test`\".

*Mutatis mutandis* nel caso di ricerca all\'indietro di una stringa in
cui sia presente il punto di domanda: \"`?\?test`\".

Di seguito una tabella riassuntiva di quanto sopra:

| Testo cercato   | Stringa di ricerca  |
| --------------- | ------------------- |
| /test           | `/\\/test`            |
| ?test           | `?\\?test`            |

## Il trucco della ricerca inversa

Si può evitare l\'utilizzo del carattere di *Escape* invertendo
l\'operatore di attivazione della ricerca, ovvero utilizzando la
modalità di ricerca contraria.

Quindi la ricerca senza carattere di *Escape* con gli stessi esempi
sopra riportati sarebbe la seguente:

|  Testo cercato  | Stringa di ricerca |
|  ---------------| ------------------ |
|  /test          | `?/test`             |
|  ?test          | `/?test`             |

Però a questo punto la ricerca andrebbe in direzione contraria rispetto
a quella voluta.

Si può, utilizzando il carattere `"N"`, (*n* maiuscolo) già
sopra indicato, *invertire la ricerca inversa* indirizzando, quindi, il
cursore nella medesima direzione che sarebbe stata scelta se non fosse
stato presente il carattere *speciale* all\'interno della stringa.

Questa soluzione è molto comoda quando i caratteri da *neutralizzare*
siano più di uno, ovvero al posto di \"`\/\/\/`\" si scrive
\"`?///`\" ed al posto di \"`\?\?\?`\" si scrive
\"`/???`\".

Grazie per l\'attenzione.
