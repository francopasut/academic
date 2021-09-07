---
title: "LaTeX, Lilypond and lyluatex package: state-of-the-art text and music typesetting"
date: 2020-03-21
canonical_url: "https://medium.com/@francopasut/latex-lilypond-and-lyluatex-package-state-of-the-art-text-and-music-typesetting-f7c8d79ac66e/"
slug: lilypond-lyluatex
categories:
  - Editors
tags:
  - LaTeX
  - Lilypond
image:
  placement: 3
  preview_only: true
  caption: 'Music sheet'
---





## LaTeX e Lilypond  ##

*LaTeX* è un linguaggio di marcatura per  impaginare testi e notazione matematica, scientifica ed altro allo  \"*stato dell'arte\"* 

*Lilypond* è l'equivalente per la notazione musicale.

*LaTeX e  Lylipond* insieme sono un eccellente sistema per combinare notazione musicale e testi all'interno dei documenti.

Tuttavia non è semplicissimo generare testi in cui vengono utilizzanti entrambi i linguatti di marcatura.

Questo breve articolo è una semplice introduzione introduction all'utilizzo di  *LaTeX e Lilypond* insieme.

## Prerequisiti per comprendere questo articolo  ##

Per comprendere il contenuto di questo articolo è, ovviamente, necessario conoscere i linguaggi di marcatura di cui si parla: *LaTeX* e *Lilypond*.

Esistono molti tutorial in  Internet per imparare ad utilizzare LaTeX.

For *Lilypond*, il migliore corso introduttivo è quello disponibile alla pagina ufficiale  \ <https://lilypond.org/website/manuals.html>

Ovviamente occorre anche conoscere la notazione musicale.

## La soluzione proposta dal sito Lilypond  ##



Nel manuale d'uso vi è una sezione su come utilizzare il linquaggio all'interno di documenti scritti in  *LaTeX*: [Section 3.2.1](https://lilypond.org/doc/v2.22/Documentation/usage/latex).

Secondo il manuale ufficiale occorre salvare il documento  con estensione *.lytex* extension (ad esempio: '*lilybook.lytex*') e, quindi, eseguire due passaggi.

Prima di tutto occorre lanciare, in un terminale, il seguente comando: `lilypond-book --output=out --pdf lilybook.lytex.`

In questo modo si ottiene un documento in formato `.tex` che può essere successivamente elaborato e compilato  con il tipico comando di  LaTeX *pdflatex* come, ad esempio, `pdflatex lilybook.tex` per ottenere il documento finale   *lilybook.pdf*.

Pertanto, utilizzando questo sistema, occorre prima scrivere la notazione musicale nel documento *.lytex*, generare il documento in  *.tex* dal tale *.lytex e, quindi, compilare il  *.pdf*.

Il problema è che se occorre modificare la parte musicale è necessario rifare tutto il procedimento da capo!

Effettivamente non è molto comodo da utilizzare.

## La soluzione in singolo comando con il pacchetto lyluatex  ##

Fortunatamente da qualche anno è presente nelle distribuzioni  [TEX Live](https://ctan.org/pkg/texlive) e [MiKTEX](https://ctan.org/pkg/miktex) l'incredibile pacchetto  ***lyluatex*** che consente di inserire partiture musicali complete direttamente all'interno di documenti LaTeX.

Occorre semplicemente aggiungere la direttiva `\usepackage{lyluatex}` nel   *preambolo* del documento in LaTeX per essere pronti ad utilizzare i comandi *Lilypond*.

Naturalmente occorre anche installare  *lilypond* stesso nel sistema operativo.

A questo punto potete utilizzare il comando  `\lilypond{...}` per brevi inserti musicali in linea ed il comando di ambiente  `\begin{lilypond} ... \end{lilypon}` per blocchi di partiture musicali.

Di seguito riporto un esempio  **codice inline con testo e musica**:

```lilypond 
Inline music fragment insertion test: \lilypond{\new RhythmicStaff { \time 3/4 c4( c16) c c c c c c c \bar "|."}}
```

Di seguito, invece, riporto un esempio di **codice con testo e frammento di partitura musicale **:

```lilypond
Start slowly and then increase in ascending until you reach the forte, then decrease in descending until you reach the piano. Then repeat the scales (always in groups of three) with the colors in reverse, that is to start strong and decrease ifno to the floor in ascending, then increase to the strong in descending.



\begin{lilypond}
\header {
  title = "C Major Scale"
}



\layout {
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
  }
}
\relative c' {
  
  \clef F 
  c,4-1\p\<\startGroup_\markup{gr. 3} d-2 e-3\stopGroup f-1\startGroup_\markup{gr. 4} g-2 a-3 b-4 \stopGroup
  \clef G
  c4-1\startGroup_\markup{gr. 3} d-2 e-3\stopGroup f-1\startGroup_\markup{gr. 4}
  g-2 a-3 b-4\stopGroup c-1\startGroup_\markup{gr. 3}
  d-2 e-3\stopGroup f-1\startGroup_\markup{gr. 4+1} g-2 a-3 b-4 c-5\f\!\stopGroup b-4\>\startGroup_\markup{gr. 4} a-3
  g-2 f-1\stopGroup e-3\startGroup_\markup{gr. 3} d-2 c-1\stopGroup b-4\startGroup_\markup{gr. 4} a-3 g-2 f-1\stopGroup e-3\startGroup_\markup{gr. 3} d-2 c-1\stopGroup
  \clef F b-4\startGroup_\markup{gr. 4} a-3 g-2 f-1\stopGroup e-3\startGroup_\markup{gr. 3} d-2 c-1\p\!\stopGraceMusic r
}
\end{lilypond}



Perform loudly with the right hand and softly with the left hand, then vice versa. Then switch the \textit{crescendo} and \textit{diminuendo} between the two hands.
```

Occorre, al termine della redazione del documento composito,  **compilarlo usando *lualatex*** (Non *pdflatex*!) con il suffisso opzione `--shell-escape` nella linea di comando.

Il comando completo è, pertanto:  `lualatex --shell-escape document.tex`.

Tutto qui! Occorre un po' di pazienza per consentire a  *lyluatex* di compilare le partiture in *lilypond* ed, alle fine, avrebe il vostro documento perfettamente impaginato con  *testo e musica*, come nel caso dei seguenti esempi compilati dai frammenti di codice sopra riportati.

## ESEMPIO IN LINEA:  ##

![Inline insertion](inline-music-fragment.png)

## ESEMPIO DI PARTITURA:  ##

![Block insertion](block-music-fragment.png)

Grazie per la vostra attenzione.


[Pubblicato in origine su Medium](https://medium.com/@francopasut/latex-lilypond-and-lyluatex-package-state-of-the-art-text-and-music-typesetting-f7c8d79ac66e)
