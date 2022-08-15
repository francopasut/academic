---
title: "Vim: Studio sulla costruzione di Espressioni Regolari per cancellare o ridurre righe vuote con il Comando Globale"
date: 2022-08-15
slug: vim_regex_blank_lines
categories:
  - Editors
tags:
  - Vim
  - RegEx
image:
  placement: 3
  preview_only: true 
  caption: 'Vim e RegEx'
---

{{% toc %}}

## Prefazione

Sul tema di questo articolo richiamo il mio precedente studio: ["Vim ed Espressioni Regolari per la rimozione degli spazi bianchi ridondanti"](https://francopasut.netlify.app/it/post/vim_regex_white_spaces/)

A differenza dell'articolo precedente, qui la presenza degli spazi bianchi determina soluzioni differenti rispetto alle righe vuote indipendentemente dal numero delle loro occorrenze.

Lo studio di questo articolo è dedicato sia all'analisi delle "*espressioni regolari*" che al comando globale di Vim.

## Vim ed il Comando Globale

Il comando globale in Vim è il tasto `g`.

È utile per molti scopi.

In modalità normale può essere usato per comporre comandi a più lettere, come i seguenti:

* `guw`\: trasforma la parola successiva in minuscolo
* `gUw`: trasforma la parola successiva in maiuscolo
* `gU2w`: trasforma in maiuscolo le due parole successive
* `gUe`: trasforma in maiuscolo dal cursore fino alla fine della parola
* `gu$`: trasforma tutto il minuscolo fino alla fine della riga
* `ge`:  sposta il cursore alla fine della parola precedente (la semplice `e` lo  sposta alla fine della parola successiva)

... e così via.

Il comando `g` può anche essere un *operatore di movimento*, come descritto in [questo mio articolo](https://francopasut.netlify.app/post/vim_double_motions/).

Lo stesso comando globale può comunque essere usato come *"comando ex "*, e questo è proprio ciò che serve per   questo articolo.

## Il Comando Globale come "*comando ex*"

Un "*comando ex*" è un comando Vim che,  dalla modalità normale, viene attivato con i due punti ed è seguito da un comando specifico.

Il Comando Globale `:g` di Vim come *"comando ex "* ha una struttura composita, elencata come segue:

* L'attivazione avviene premendo il doppio punto dalla Modalità Normale seguito dalla lettera `g`
* Un *modello* di ricerca
* Un comando applicato al modello di ricerca.

Ogni segmento è separato da una barra `/`.

Quindi, unendo i segmenti, ecco la struttura di base:

```
:g/pattern/comando
```

Il *pattern* può essere una stringa di testo ma anche una *espressione regolare*.

Come ogni *comando ex* di Vim può eseguire operazioni in un intervallo di righe o in ogni riga di un documento.

## Usare il comando globale per eliminare tutte le righe completamente vuote

La soluzione è, a questo scopo, un comando *ex* davvero elementare, facilmente reperibile in rete: 

```
:g/^$/d 
```

Analizziamo ogni atomo di questo comando, considerando la struttura di cui sopra (`:g/pattern/command`):

* `:g` è l'attivatore del comando globale.
* `/` è la barra di separazione tra la prima e la seconda parte della struttura.
* `^$` è il *modello di ricerca* in una *espressione regolare* molto semplice.
* `^$` è il *modello di ricerca* in una *RegEx* elementare per selezionare le righe che iniziano (`^`) e finiscono (`$`) senza caratteri o spazi bianchi all'interno.
* Segue un'altra barra di separazione (`/`) tra la seconda e la terza parte della struttura.
* La lettera `d` è il comando vero e proprio che viene applicato al *modello di ricerca* e il comando è: *cancella*.

Tradotto in linguaggio naturale umano: *trova ogni riga vuota nel documento e cancellala.*

## Uso del  Comando globale per eliminare tutte le righe contenenti spazi

La formula per eliminare le righe vuote in cui sono presenti spazi bianchi è quasi uguale, ma non del tutto, a quella precedente.

Eccola:

```
:g/^\s*$/d
```

Confrontando le due formule, è possibile estrarre la parte che non coincide:

* Prima formula: `g/^$/d`
* Seconda formula: `g/^\s*$/d`
* Parte che non coincide: `\s*`

La differenza tra la prima e la seconda formula è il frammento `\s*`: cosa significa?

* `\s` è il segno per "*carattere di spazio bianco*".
* `*` è il quantificatore per "*zero o più volte*".

Riprendendo il riassunto alla fine del paragrafo precedente, possiamo tradurre in linguaggio umano come segue: *trovare le righe vuote e le righe con uno o più spazi bianchi e cancellarle tutte*.

## E ora: ridurre le righe vuote  consecutivo ad una sola

Le prime due formule sono facilmente reperibili sul Web. Ora, però, costruiamo altre due formule basate sulle precedenti.

Ma ora si alza l'asticella della difficoltà con una formula utile per chi scrive codice o linguaggi di markup, come LaTeX o Markdown, in cui una sola riga vuota è sufficiente per mandare il testo a capo e, quindi, le righe aggiuntive sono inutili.

Il nuovo obiettivo è, quindi,  ridurre le righe vuote tra le righe scritte ed eliminare tutte le righe vuote dopo l'ultima riga scritta.

Il modello di ricerca è relativo alla presenza di  almeno due righe vuote.

Ecco la formula:

```
:g/^$\n^$/d
```

Poiché la terza formula si riferisce alle righe vuote, è necessario confrontarla con la prima, piuttosto che con la seconda in cui vengono elaborati anche gli spazi bianchi:

* Prima formula: `g/^$/d`
* Seconda formula: `g/^\s*$/d`
* Terza formula: `g/^$\n^$/d`
* Parte non coincidente: `\n`

Qual è il significato di questo piccolo pezzo di formula?

Molto semplice: il comando `\n`   corrisponde a un *line feed* e permette di trovare tutte le righe vuote vicina ad una riga vuota a capo e di cancellare tutte le occorrenze di questa ricerca.

Poiché l'operazione raggiunge il punto in cui tra due righe scritte non ci sono più due righe vuote consecutive, ma solo una singola riga vuota, questa riga NON viene cancellata.

Abbiamo quindi raggiunto l'obiettivo con una semplice duplicazione della prima formula di ricerca.

## Sempre più difficile: ridurre tutte le righe consecutive,   in cui siano presenti spazi bianchi,  ad una

Ma ora che ho costruito una nuova formula basata sulla prima, provo a costruire una nuova formula basata sulla seconda.

La quarta formula deve cercare un modello in cui ci siano almeno due righe vuote o righe con spazi bianchi e ridurlo a uno finché non ci siano più righe duplicate da confrontare.

Ecco la quarta formula:

```
g/^\s*$\n^\s*$/d
```
Ecco tutte e quattro le formule:

* Prima formula: `g/^$/d`
* Seconda formula: `g/^\s*$/d`
* Terza formula: `g/^$\n^$/d`
* Quarta formula: `g/^\s*$\n^\s*$/d`
* Parte che non coincide: `\n`

La quarta formula raddoppia lo schema della seconda, aggiungendo il comando _line feed_ già visto in precedenza (`\n`).

L'ultima formula ripulisce il documento eliminando tutte le righe ridondanti senza caratteri di testo, lasciandone solo una tra le righe di testo.

## Breve commento conclusivo

Questo studio mi ha permesso di verificare la straordinaria versatilità delle espressioni regolari che possono essere combinate tra loro e con Comando Globale di Vim per effettuare in automatico operazioni molto complesse.

Mi ricorda un gioco di costruzioni che facevo da bambino, molti anni fa.

Grazie per l'attenzione.
