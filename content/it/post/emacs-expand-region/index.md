---
title: "Emacs, Expand-region e LaTeX"
date: 2021-09-11
slug: emacs_expand_region
categories:
  - Editors
tags:
  - Emacs
image:
  placement: 3
  preview_only: true 
  caption: 'Emacs logo'
---

{{% toc %}}

## Emacs e gli *oggetti di testo*

Nei documenti complessi vi sono, spesso, frammenti di testo all'interno di ben definiti elementi semantici: parentesi di vario tipo, vigolette semlici o doppie, segni in interpunzione, ecc. 

In alcuni sistemi di scrittura (Vim, in particolare) sono chiamati "*oggetti di testo*".

Emacs  può gestire questi blocchi di testi con un pacchetto denominato [Expand-region](https://github.com/magnars/expand-region.el) che "*incrementa la regione selezionata da unità semantiche*" (definizione originale, tradotta in italiano, dalla pagina GitHub del programmatore).
 
Per installare il pacchetto potete fare riferimento alle [istruzioni](https://github.com/magnars/expand-region.el#installationw) presenti sulla pagina.

Anche se il pacchetto può funzionare con qualsiasi documento di testo,   deve essere utilizzato, per ottimizzarne le prestazioni,  all'interno di [uno dei linguaggi dedicati](https://github.com/magnars/expand-region.el#language-support).

LaTeX è uno di tessi

## Expand-region e LaTeX

L'utilizzo del pacchetto è molto semplice: occorre soltanto ricordare alcune combinazioni di tasti, come le seguenti:

| Quale combinazione? | Che effetto ha?                |
|---------------------|--------------------------------|
| `Ctrl+=`            | Espande la regione selezionata |
| `Ctrl+- Ctrl+=`     | Riduce la regione selezionata  |
| `Ctrl+0 Ctrl+=`     | Resetta la selezione           |

Nel prossimo paragrafo mostrerò alcuni brevi animazioni sull'utilizzo di questo pacchetto.

Una piccola precisazione: in questo articolo utilizzo la notazione con il segno *più*: `Ctrl+=` significa che occorre premere insieme il tasto Control + il tasto con il simbolo dell'uguale.

In altri contesti la stessa combinazione potrebbe essere indicata con il segno *meno* (esempio:`Ctrl-=`) ma il risultato è simile.

## Brevi animazioni su LaTeX e *expand-region*

Nel primo video il cursorse si trova in una Sezione in cui è presente una Sottosezione ed io premo `Ctrl+=`\` quattro volte per selezionare quattro oggetti progressivi:

![Prima clip](emacs-expand-region1.gif)

1. Al  primo *colpo* viene selezionata una parola
2. Al secondo viene selezionato il corrispondente paragrafo senza il carattere di ritorno a capo al termine della linea
3. Al terzo viene selezionato il paragrafo includendo il carattere di ritorno a capo a fine linea
4. Al quarto, infine, viene selezionata l'intera Sezione inclusa la relativa Sottosezione.

Nel successivo video mostro come ottenere lo stesso risultato utilizzando il moltiplicatore di Emacs:  `Ctrl+4 Ctrl+=`. Un'intera sequenza di quattro passaggi in un unico comando!

![Seconda clip](emacs-expand-region2.gif)

Nel terzo video la posizione di partenza del cursore si trova all'interno della Sottosezione e la stessa sequenza di prima determina la selezione soltanto della Sottosezione ma non della Sezione sovrastante.

![Terza clip](emacs-expand-region3.gif)

Infine, nel seguente video potete notare due sequenze in direzioni opposte: nella prima sequenza premo una serie di combinazioni di *Expand Region* per selezionare il testo fino ai livelli del tag  *Begin/End{document}*; nella successiva premo una serie di combinazioni del tipo *Reduce Region*  (`Ctrl+- Ctrl+=`) per ritornare all'inizio del processo.

![Quarta clip](emacs-expand-region4.gif)

Ad ogni punto di qualsiasi sequenza è possibile tornare immediatamente alla posizione originale del cursore premendo `Ctrl+0 Ctrl+=`.

Ovviamente ogni assegnazione di combinazioni di tasti alle funzioni del pacchetto può essere modificata e personalizzata a propria discrezione.

## Evil: ovvero Vim all'interno di Emacs

Emacs può simulare molto bene il comportamento di Vim mediante il pacchetto *Evil*.

In tale ambiente emulato è possibile gestire gli *oggetti di testo* come in Vim originale.

Potete leggere [questo articolo](https://francopasut.netlify.app/it/post/vim_delete_sentences/) sul tema degli *oggetti di testo* per cancellare paragrafi e frasi.

Thank you for your attention.
