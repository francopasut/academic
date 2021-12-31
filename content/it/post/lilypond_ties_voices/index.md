---
title: "LilyPond, legature di valore e voci"
date: 2021-12-01
slug: lilypond_ties_voices
categories:
  - Musica
tags:
  - LilyPond
image:
  placement: 3
  preview_only: true 
  caption: 'LilyPond, legature di valore e voci'
---

{{% toc %}}

## LilyPond: legature di valore e voci

Nella configurazione di base del linguaggio LilyPond non è possibile inserire una legatura di valore tra una nota appartenente ad una voce singola ed una nota analoga appartenemente ad un insieme di voci multiple.

Recentemente ho dovuto risolvere un passaggio d'autore riguardante un problema analogo ed ho chiesto aiuto alla splendida comunità di LilyPond.

Così ho appreso un nuovo "trucco" che vorrei condividere con tutti: è possibile modificare il _contesto_ in cui operano le legature di valore.

Più in particolare: è possibile fare in modo che le legature di valore estendano la portata dal contesto _voce_ al contesto _partitura_.

In questo modo, le legatura possono essere utilizzate nel passaggio da una singola voce ad una voce multipla.

## Un facile esempio: legatura tra una singola voce ad una voce non incise 

Nel seguente esempio riporto un esempio molto semplice di codice con un avviso di "legatura non terminata":

```
\version "2.22.1"
\relative c'
{\key c \major
  \time 4/4

    c d e f~  % implicit oneVoice
  % start multiple voices
  << { f g8 a b4 c } % implicit voiceOne 
     \\
     { c,2 d4  e  } % implicit voiceTwo 
   >>  
  }
```

Ecco la sequenza delle opeazioni:

```
lilypond 2.22.1 [easy-example1.ly] in avvio...
Elaborazione di «/tmp/frescobaldi-555a_6kd/tmpvy9_gypn/document.ly»
Analisi...
Interpretazione della musica...
/tmp/frescobaldi-555a_6kd/tmpvy9_gypn/document.ly:6:12: attenzione: legatura di valore non terminata
    c d e f
           ~  % implicit oneVoice
Pre-elaborazione degli oggetti grafici...
Determinazione del numero ottimale di pagine...
Compressione della musica in una pagina...
Disegno dei sistemi...
Conversione a «document.pdf»...
Successo: compilazione completata con successo
Completato con successo in 1.2".
```

Ecco la partitura:

![easy-example1](easy-example1.png)

Evidenziato in rosso: la legatura non è stata incisa.

## Un altro semplice esempio: la legatura da una singola voce ad una voce multipla viene incisa

Lo stesso esempio senza l'avviso di ¨legatura non terminata".

```
\version "2.22.1"
\layout {
  \context {
    \Voice
    \remove Tie_engraver
  }
  \context {
    \Staff
    \consists Tie_engraver
  }
}
\relative c'
{\key c \major
  \time 4/4
  
    c d e f~  % implicit oneVoice
  % start multiple voices
  << { f g8 a b4 c } % implicit voiceOne 
     \\
     { c,2 d4  e  } % implicit voiceTwo 
   >>  
  }

```
Ecco la registrazione delle operazioni:

```
lilypond 2.22.1 [easy-example1.ly] in avvio...
Elaborazione di «/tmp/frescobaldi-555a_6kd/tmpvy9_gypn/document.ly»
Analisi...
Interpretazione della musica...
Pre-elaborazione degli oggetti grafici...
Determinazione del numero ottimale di pagine...
Compressione della musica in una pagina...
Disegno dei sistemi...
Conversione a «document.pdf»...
Successo: compilazione completata con successo
Completato con successo in 1.2".
```


Ecco la partitura:

![easy-example2](easy-example2.png)

Evidenziato in verde: adesso la legatura risulta incisa.


Grazie per la vostra attenzione

