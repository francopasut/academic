---
title: "LilyPond, ties and voices (advanced)"
date: 2021-12-30
slug: lilypond_ties_voices_advanced
categories:
  - Music
tags:
  - LilyPond
image:
  placement: 3
  preview_only: true 
  caption: 'LilyPond, ties and voices (advanced)'
---

{{% toc %}}

## The object of this article

The object  of this article is the same as    [my this previous article](https://francopasut.netlify.app/post/lilypond_ties_voices/) but in this case I wrote a score for piano with a little bit more complex voices and ties combinations in LilyPond.

I have, then, created a colour image highlighting the points of interest.

The following terms from the LilyPond lexicon must, of course, be regarded:

- oneVoice: a single voice line
- voiceOne: the upper melody line of a  polyphonic  composition
- voiceTwo: the lower melody line of a polyphonic  composition

## And now let's have a look at the LilyPond code ##

Here's the complete LilyPond code in which you will find each line commented and, in particular, the crossing points shown in the score below.:

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



The *magic code fragment*, as already explained in [my previous article](https://francopasut.netlify.app/post/lilypond_ties_voices/), is the following:


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

Without that part at the beginning, all the ties in this code would give an error  and would not be engraved in the  score.


The code corresponds to this score (in which I have only added the colours of the voices separately):



![advanced-example](lilypond-ties-advanced-example.png)

## The  crossing points  ##

- Crossing point no. 1: here you can see the tie between the end of the single voice (oneVoice) and the beginning of the upper  voice (voiceOne) in the two-voice polyphony of the right hand.
- Crossing point no. 2: here you can see the tie between the end of the upper  voice (voiceOne) in the two-voice polyphony  and the return of the single voice (oneVoice) of the right hand.
- Crossing point no. 3: here you can see the tie between the end of the single voice (oneVoice) and the beginning of the lower  voice (voiceTwo) in the two-voice polyphony of the left hand.
- Crossing point no. 4: here you can see the tie between the end of the lower  voice (voiceTwo) in the two-voice polyphony  and the return  of the single voice (oneVoice) of the left hand.

Thank You for your attention.
