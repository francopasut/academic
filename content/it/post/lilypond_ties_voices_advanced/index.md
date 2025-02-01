---
title: "LilyPond, legature di valore e voci (avanzato)"
date: 2021-12-30
slug: lilypond_ties_voices_advanced
categories:
  - Musica
tags:
  - LilyPond
image:
  placement: 3
  preview_only: true 
  caption: 'LilyPond, legature di valore e voci (avanzato)'
---



## L'oggetto di questo articolo

L'oggetto dell'articolo è il medesimo di
[questo mio precedente](https://francopasut.netlify.app/it/post/lilypond_ties_voices/) ma ora ho composto, utilizzando il linguaggio LilyPond,  una breve partitura per pianoforte  con combinazioni di voci e legature di valore un po' più complesse.

Ho anche  creato un'immagine colorata con evidenza dei punti di interesse.

I seguenti termini del lessico di LilyPond devono, naturalmente, essere considerati:

- oneVoice: una linea di voce singola
- voiceOne: la melodia superiore di una composizione polifonica 
- voiceTwo: la melodia inferiore di una composizione polifonica 

## Ed ora diamo un'occhiata al codice di LilyPond

Ecco il codice completo di Lilypond in cui trovate ogni riga commentata ed, in particolare, i punti di incrocio visualizzati nella partitura in basso:

```
\version "2.22.0"
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

global = {
  \key g \major
  \time 4/4
}



right = \relative c'' 
{
  \global

  g a b c~ % single voice (oneVoice) in the right hand
  
%  POINT n. 1: from single voice (oneVoice) to upper multiple voice (voiceOne) in the right hand
				
  << { c8 d16 e f8 e  d4 c~ c8 b a g fis  d e fis g2 } % voiceOne in the right hand
     \\
     { g4 a b c~  c8 d16 e fis8 e  d4 c~ c8 d c4~ } % voiceTwo in the right hand

% POINT n. 2: return from upper multiple voice (voiceOne) to single voice (oneVoice) in the right hand

  >>
  c4 b g'2 r % single voice (oneVoice) in the right hand
}

left = \relative c' 
{
  \global
  g4 fis f e_~ % single voice (oneVoice) in the left hand

%  POINT n. 3: from single voice to lower multiple voice (voiceTwo) in left hand

  << { r4 r8 a8  d8 c b a g4  fis8 g a4 d~ } % voiceOne in the left hand
     
% POINT n. 4: return from lower multiple voice (voiceTwo) to single voice in the right hand (oneVoice)
     \\
     
     { e, 8 d cis4  d8 e fis4 g8 fis16 e  d2 r4 } % voiceTwo in the left hand
     
   >>
  d' d,  g2~ g r  % single voice (oneVoice) in the left hand
}

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } \right
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass \left }
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}

```


Il *frammento magico di codice*, come già spiegato nel 
[mio precedente articolo](https://francopasut.netlify.app/it/post/lilypond_ties_voices/), è il seguente:


```
\version "2.22.0"
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
```

Senza quella parte all'inizio, tutte le legature di valore in questo codice darebbero un segnare di errore e non sarebbero riportate nella partitura.

Il codice corrisponde a questa partitura (in cui ho soltanto aggiunto i colori alle voci distinte):



![advanced-example](lilypond-ties-advanced-example.png)

## I punti di incrocio  ##

- Punto di incrocio no. 1: potete vedere la legature di valore tra la fine della voce singola (oneVoice) e l'inizio della voce superiore (voiceOne) nella polifonia a due parti della mano destra.
- Punto di incrocio no. 2: potete vedere la legatura di valore tra la fine della voce superiore (voiceOne) nella polifonia a due voci ed il ritorno della voce singola   (oneVoice) nella mano destra.
- Punto di incrocio no. 3: potete vedere la legatura di valore tra la fine della voce singola (oneVoice) e l'inizio della voce inferiore   (voiceTwo) nella polifonia a due voci della mano sinistra.
- Punto di incrocio no. 4: potete vedere la legatura di valore tra la fine della voce inferiore  (voiceTwo) nella polifonia a due voci ed il ritorno della voce singola  (oneVoice) della mano sinistra.

## Ma il sistema non è perfetto  ##

Il sistema non è perfetto.

Durante il processo di elaborazione della partitura, viene riportato un avviso nella legatura di valore del Punto  no. 2, anche se, alla fine dell'elaborazione, la legatura viene correttamente incisa:

```
Interpreting music...
(...): warning: unterminated tie
     { g4 a b c~  c8 d16 e fis8 e  d4 c
                                       ~ c8 d c4~ } % voiceTwo in the right hand

```

Inoltre le legature non vengono visualizzate quando si genera l'equivalente audio della partitura.

Gli sviluppatori di LilyPond devono ancora mettere a punto il sistema.

Grazie per la Vostra attenzione.
