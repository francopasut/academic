---
title: "LaTeX per atti giudiziari, configurazione di base"
date: 2018-12-15
slug:  atti_giudiziari_latex_base
categories:
  - Blog
tags:
  - LaTeX
  - Atti giudiziari
image:
  placement: 3
  preview_only: false 
  caption: 'LaTeX e la Giustizia'
canonicalUrl: https://francopasut.blogspot.com/2018/12/latex-per-atti-giudiziari.html   
---

- [1. Premessa](#1-premessa)
- [2. Dove si inseriscono le configurazioni dei documenti?](#2-dove-si-inseriscono-le-configurazioni-dei-documenti)
- [3. Impostazione della pagina](#3-impostazione-della-pagina)
- [4. Configurazione dei caratteri specifici della lingua italiana](#4-configurazione-dei-caratteri-specifici-della-lingua-italiana)
- [5. La questione delle legature](#5-la-questione-delle-legature)
- [6. Sintesi dei comandi di configurazioni trattati in questo articolo](#6-sintesi-dei-comandi-di-configurazioni-trattati-in-questo-articolo)


## 1. Premessa 

Dopo una serie di articoli comparati dedico questo articolo esclusivamente a **LaTeX** che, giorno dopo giorno, si conferma come il sistema di scrittura in assoluto migliore per qualsiasi tipologia di documento.

Gli articoli precedenti, in cui ho posto a confronto *LaTeX*, *Word* e *LibreOffice Writer*, sono i seguenti:

* [Atti giudiziari: utilizzare le variabili al posto dei nomi propri in Word, Writer e LaTeX](https://francopasut.blogspot.com/2018/10/atti-giudiziari-utilizzare-le-variabili.html)
* [PCT e collegamenti ipertestuali tra atti e documenti in Word, Writer e LaTeX](https://francopasut.blogspot.com/2018/08/pct-e-collegamenti-ipertestuali-tra.html)
* [ATTI IPERTESTUALI E PROCESSO CIVILE TELEMATICO](https://francopasut.blogspot.com/2018/05/atti-ipertestuali-e-processo-civile.html)

Per una presentazione generale di *LaTeX*, invece, richiamo questo mio articolo denominato [ATTO GIUDIZIARIO: Word contro LaTeX](https://francopasut.blogspot.com/2016/09/atto-giudiziario-word-contro-latex.html).

---

## 2. Dove si inseriscono le configurazioni dei documenti? 

Una delle prime *difficoltà* che si incontrano quando ci si avvicina ad un sistema di *editing* basato su codice di testo piuttosto che su un tradizionale programma di videoscrittura è quella di trovare il modo per inserire le istruzioni di configurazione dei documenti.

Nel caso di **LaTeX** la soluzione è molto semplice: le istruzioni per la configurazione devono essere collocate nella **parte preliminare**, ovvero in quella parte che si trova **prima** dell'inizio del documento vero e proprio.
La parte preliminare si riconosce molto facilmente perchè è quella che precede il comando `\begin{document}` che segna l'inizio della parte contenutistica del documento.

Nella parte preliminare possono (anzi *devono*) essere inseriti i richiami alle *librerie*, ovvero ai pacchetti di configurazione, nonché altri parametri, variabili e informazioni sul documento stesso.

Sono tutte informazioni di tipo *testuale*, ovvero che possono essere introdotte e variate con qualsiasi programma di scrittura nel formato testo universale.
Questo particolare consente di intervenire nel documento con qualsiasi programma di scrittura eliminando alla radice ogni problema di conversione dei formati proprietari dei tradizionali *software* di videoscrittura.

---

## 3. Impostazione della pagina

La prima configurazione da inserire nella parte preliminare è quella relativa alla pagina.

Per procedere a tale impostazione si utilizza la libreria *geometry* con una formula del seguente tipo:

```latex
\usepackage[a4paper,top=2cm,bottom=3cm,left=2.5cm,right=2.5cm]{geometry}
```

Da notare il comando iniziale `\usepackage` che costituisce lo standard per il richiamo dei pacchetti di configurazione in `LaTeX` e che mnemonicamente richiama il concetto di _usa pacchetto_.

Al termine della stringa si legge il comando `geometry` che è il nome dello specifico pacchetto richiamato in questo caso. Si tratta, in particolare, di un pacchetto che consente la personalizzazione dei margini e di altri parametri dei documenti.

Per variare i margini laterali occorre semplicemente modificare i numeri associati alle stringhe top, bottom, left e right ponendo attenzione di non utilizzare le virgole per i decimali ma i punti (esempio `left=2.5cm` e non, invece, `left=2,5cm`).

## 4. Configurazione dei caratteri specifici della lingua italiana 

Immediatamente dopo la configurazione della pagina occorre inserire le impostazioni dedicate alla lingua italiana.

La sequenza tipica è la seguente:

```latex
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[italian]{babel}
```

A questo punto si potrebbe aprire una vasta discussione sulle priorità tra i vari pacchetti sopra indicati, ma non è questo il luogo adatto.

La sequenza sopra riportata è quella che, secondo la maggioranza dei commentatori e la mia personale esperienza, garantisce la corretta impostazione di tutte le caratteristiche della lingua italiana.

La funzione svolta dai vari pacchetti è molto specifica, come dalla seguente sintetica descrizione:

1. Il pacchetto _fontenc_ fornisce l'output dei caratteri, ovvero la corretta codificazione dei caratteri nella fase di trasformazione dal codice sorgente al documento finale (tipicamente nel PDF finale).

2. Il pacchetto  _inputenc_ fornisce l'input dei caratteri, ovvero il corretto inserimento dei caratteri italiani dalla tastiera (ad esempio delle vocali accentate).

3. Il pacchetto _babel_ si occupa della personalizzazione delle lingua per quanto concerne la sillabazione (LaTeX, infatti, applica in automatico la suddivisione in sillabe delle parole nei ritorni a capo), la traduzione delle parole aggiunte dal sistema (come ad esempio la parola "Indice" al posto di "Table of contents"), della corretta formattazione di data e ora e di tutto quanto è necessario per la completa localizzazione del documento.

I tre pacchetti sono indipendenti ma sinergici tra loro: occorrono tutti e tre per scrivere e ottenere un testo correttamente conformato nella lingua specifica.

## 5. La questione delle legature

Circa tre anni fa, quando iniziai i miei esperimenti di redazione di atti giudiziari con LaTeX, trovai un ostacolo che per poco non mi indusse a rinunciare: la questione delle legature.

Una legatura tipografica non è altro che una fusione tra due (o più) lettere in un unico glifo.

Tipici esempi di legature tipografiche sono quelle tra due lettere f consecutive o tra combinazioni di lettere come fi o fl, come rappresentato nell'immagine seguente.

![img](149px-Ligature_drawing.svg.png)

Le due immagini seguenti mostrano la differenza tra un frammento di testo con e senza legature.

Frammento di testo senza legature

![img](frammento_con_legature.png)


Frammento di testo senza legature

![img](frammento_senza_legature.png)

Le legature sono certamente molto eleganti da vedere e contribuiscono a conferire al testo un effetto libro stampato molto piacevole.

Per questo LaTeX crea di _default_ le legature in totale automatismo.

I miei primi atti generati in LaTeX erano, quindi, stati generati con con legature attivate di default.

Tuttavia dopo un po' mi accorsi che nel punto in cui vi erano le legature non era possibile copiare il testo e incollarlo in altro documento. Infatti la copia dal PDF restituiva caratteri illeggibili e, quindi, del tutto inutilizzabili in altri documenti e questo era (e lo sarebbe anche oggi) in contrasto con le regole tecniche del PCT.

Come tutti sappiamo, infatti, il formato nativo digitale previsto dall'art. 12 delle specifiche tecniche del 2014 impone che l'atto debba essere ottenuto da una trasformazione di un documento testuale, senza restrizioni per le operazioni di selezione e copia di parti.

Un testo che non consenta la selezione o copia di parti non sarebbe, pertanto, conforme alle specifiche del PCT.

Anche se più di recente ho notato che il problema non si presenta più, ovvero che le legatura vengano correttamente interpretato anche in fase di copia e incolla, occorre tenere conto anche di questo potenziale conflitto e valutare se eliminare le legature dai documenti finali rinunciando ad un pizzico di eleganza per la propria tranquillità.

Per avere un testo generato senza legature è sufficiente inserire in sequenza, nella parte preliminare del documento dopo le librerie iniziali già sopra descritte, i seguenti comandi:

```latex
\usepackage{microtype}
\DisableLigatures{}
```

Il primo comando carica il pacchetto _microtype_ ed il secondo comando ordina al pacchetto di annullare l'effetto legature nel documento elaborato.

In questo modo le combinazioni _ff, fi, fl_ e simili saranno stampate con lettere separate e potranno, in ogni caso, essere copiate e incollate senza alcun problema in qualsiasi altro documento, come richiesto dai parametri del PCT.

## 6. Sintesi dei comandi di configurazioni trattati in questo articolo

Riporto, infine, la sequenza dei comandi di base per la configurazione di un atto giudiziario in LaTeX menzionati in questo articolo.

```latex
\usepackage[a4paper,top=2cm,bottom=3cm,left=2.5cm,right=2.5cm]{geometry}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[italian]{babel}
\usepackage{microtype}
\DisableLigatures{}
```

Mi riservo di approfondire il tema della configurazione degli atti giudiziari scritti in LaTeX in successivi articoli.

Grazie per l'attenzione.