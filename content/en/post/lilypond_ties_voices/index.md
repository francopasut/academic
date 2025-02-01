---
title: "LilyPond, ties and voices"
date: 2021-12-01
slug: lilypond_ties_voices
categories:
  - Music
tags:
  - LilyPond
image:
  placement: 3
  preview_only: true 
  caption: 'LilyPond, ties and voices'
---



## LilyPond: ties and voices

In the  default LilyPond configuration, it is not possible to tie a  note in a single-voice with the same note but belonging to a contextual multi-voices environment.

I recently had to resolve an author's passage involving just such a problem and asked for help to the amazing LilyPond community.

So I learned a new "trick" that I would like to share with everyone: you can change the *context* in which ties operate.

More in particular: it is possible to make ties work from the *voices* context to the *scores* context.

In this way, ties can also be engraved switching from single voice to a multiple voice.

## An easy example: tie from a single voice to multiple voices not engraved 

In the following example I report a very simple code fragment with an "unterminated tie" warning:

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

Here's the log:

```
Starting lilypond 2.22.1 [easy-example1.ly]...
Processing `/home/franco/Documents/easy-example1.ly'
Parsing...
Interpreting music...
/home/franco/Documents/easy-example1.ly:6:12: warning: unterminated tie
    c d e f
           ~  % implicit oneVoice
Preprocessing graphical objects...
Finding the ideal number of pages...
Fitting music on 1 page...
Drawing systems...
Success: compilation successfully completed
Completed successfully in 1.2".
```

Here's the score:

![easy-example1](easy-example1.png)

Highlighted in red: the tie has not been engraved.

## Another easy example: tie  from a single voice to multiple voices engraved 

The same code fragment without the "unterminated tie" warning:

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
Here's the new log file:

```
Starting lilypond 2.22.1 [easy-example1.ly]...
Processing `/tmp/frescobaldi-jz_pyunm/tmpg8nfdn1r/easy-example1.ly'
Parsing...
Interpreting music...
Preprocessing graphical objects...
Finding the ideal number of pages...
Fitting music on 1 page...
Drawing systems...
Converting to `easy-example1.pdf'...
Success: compilation successfully completed
Completed successfully in 1.3".
```


Here's the score:

![easy-example2](easy-example2.png)

Highlighted in green: now tie has  been regularly engraved.


Thank you for your attention.

