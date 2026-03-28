---
title: "LilyPond: exploring polyphonic notation"
date: 2026-03-28
slug:  lilypond_polifonia_28-3-2026
categories:
  - Blog
tags:
  - LilyPond
image:
  placement: 3
  preview_only: false 
  caption: 'LilyPond and Polyphony'
canonicalUrl: https://francopasut-en.blogspot.com/2026/03/lilypond-exploring-polyphonic-notation.html
---


- [1. A Very Brief Introduction](#1-a-very-brief-introduction)
- [2. What are note stems?](#2-what-are-note-stems)
- [3. Stem Handling in Polyphonic Notation](#3-stem-handling-in-polyphonic-notation)
- [4. Musical Examples](#4-musical-examples)
- [5. The quick construction](#5-the-quick-construction)
- [6. Example of a more detailed quick construct](#6-example-of-a-more-detailed-quick-construct)

# 1. A Very Brief Introduction

I’ve finally understood the “logic” behind LilyPond’s syntax as it relates to the different ways of writing multiple voices.

I’m writing down my “discovery” right away before I forget it—after all, that’s exactly what this “blog” is for!

**Polyphony** is a compositional technique in which several independent melodic lines are layered and performed simultaneously, creating a sonic texture in which each voice retains its autonomy while harmonizing with the others.

The evolution of polyphony marked the transition from a linear conception of music (e.g., Gregorian monody) to one based on architectural complexity (e.g., counterpoint).

LilyPond handles polyphony excellently, even on the same staff, as is the case with the piano.

When two or more melodies share the same staff, the orientation of note stems and other ancillary elements must be managed to reduce the risk of collisions.

# 2. What are note stems?

**Note stems** are the vertical lines connected to note heads that indicate the duration of the sound.

Their direction (upward or downward) is not merely aesthetic; it serves as a genuine “signaling tool” for the readability of the music.

In polyphony, stems become essential for a specific reason: they allow you to visually distinguish the different melodic lines (voices) that move simultaneously.

LilyPond handles note stems with great precision.

In the “normal” configuration, stems are determined by the position of the notes on the staff, as shown in the following excerpt from the LilyPond Notation Guide:

![img](./gambi_26-3-2026.png)

In polyphonic notation, the handling must be adjusted.

# 3. Stem Handling in Polyphonic Notation

To handle stems in polyphonic notation, you must assign a specific voice to each part.

In LilyPond, these specific roles are assigned using the following commands:

-   \voiceOne
-   \voiceTwo
-   \voiceThree
-   \voiceFour
-   \oneVoice

Each command has a specific effect, as shown in the following  summary table:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Steams Direction</th>
<th scope="col" class="org-left">Ties Direction</th>
<th scope="col" class="org-left">Notes</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">\voiceOne</td>
<td class="org-left">Up</td>
<td class="org-left">Up</td>
<td class="org-left">Usually the higher voice</td>
</tr>

<tr>
<td class="org-left">\voiceTwo</td>
<td class="org-left">Down</td>
<td class="org-left">Down</td>
<td class="org-left">Usually the lower voice</td>
</tr>

<tr>
<td class="org-left">\voiceThree</td>
<td class="org-left">Up</td>
<td class="org-left">Up</td>
<td class="org-left">Third item (horizontally shifted)</td>
</tr>

<tr>
<td class="org-left">\voiceFour</td>
<td class="org-left">Down</td>
<td class="org-left">Down</td>
<td class="org-left">Fourth item (shifted horizontally)</td>
</tr>

<tr>
<td class="org-left">\oneVoice</td>
<td class="org-left">Automatic</td>
<td class="org-left">Automatic</td>
<td class="org-left">Restore default behavior</td>
</tr>
</tbody>
</table>

# 4. Musical Examples

To illustrate the effect of these commands, I have included a few brief musical examples.

These examples are intended solely to demonstrate the characteristics of polyphonic notation in LilyPond.

In the first example, I have included a very simple excerpt in which the commands \voiceOne, \voiceTwo, and \oneVoice are clearly shown.

    
    \version "2.24.4"
    \new Staff \relative c'' {
      <<
        \new Voice {
          \voiceOne
          g4 f e d
        }
        \new Voice {
          \voiceTwo
          e2 c
        }
      >>
      \oneVoice % Return to single-voice writing
      g'4 a g2
    }

Here is the result:

![img](./esempio_esplicito_1_26-3-2026.png)

As you can easily see in the first bar, the stems of the upper voice are all pointing upward because they are affected by the /voiceOne command.

In the second bar, **the same notes** have stems pointing partly downward and partly upward, since the previous effect has been neutralized by the /oneVoice command.

Just for fun, here’s the same fragment **after removing the voiceOne and voiceTwo commands**.

![img](./esempio_esplicito_2_26-3-2026.png)

The difference is clear: just look at the confusion in the first measure!

To ensure that commands work simultaneously without interfering with one another, each group of notes must reside in a separate “bubble” (a “Voice” context).

In other words, the `/new Voice` command at the beginning of each polyphonic voice makes those voices manageable without conflicting with the other voices in the score.

# 5. The quick construction

LilyPond also offers a “quick” system for creating polyphonic fragments.

The syntax is as follows: `<< ... \\ ... >>`.

This is the fastest method, as LilyPond automatically assigns \voiceOne to the first section and \voiceTwo to the second (separated by the double backslash \\\\).

Here is a simple example:

    
    \relative c'' {
      <<
        { g4 f e d } \\ % It automatically becomes \voiceOne
        { e2 c }      % It automatically becomes \voiceTwo
      >>
    }

![img](./esempio_rapido_1_26-3-2026.png)

However, for complete control, it is best to use the previous method by explicitly declaring the Voice contexts.

This way, as mentioned above, you can decide exactly when to enable or disable the voice style.

# 6. Example of a more detailed quick construct

Below is a slightly more detailed version of the “quick construct”:

    \version "2.24.0"
    
    \header {
      title = "Polyphonic Example for Piano"
      composer = "Franco"
    }
    
    piano_upper = \relative c' {
      \clef treble
      \key g \major
      \time 4/4
    
      <<
        % Voce 1 (Upper - stems up)
        { r4 g'8( fis) g4 d | e8( fis g a) b4 g }
        \\
        % Voce 2 (Lower - stems down)
        { d2 d | c4 e d2 }
      >>
    }
    
    piano_lower = \relative c {
      \clef bass
      \key g \major
      \time 4/4
    
      <<
        % Voce 3 (Higher in the bass)
        { b'4 b b b | a c b2 }
        \\
        % Voce 4 (Lower nel basso)
        { g2 g | g1 }
      >>
    }
    
    \score {
      \new PianoStaff <<
        \new Staff = "upper" \piano_upper
        \new Staff = "lower" \piano_lower
      >>
      \layout { }
      \midi { }
    }

Here's the result:

![img](./esempio_rapido_2_26-3-2026.png)

In the previous example, there are a few passages that will terrify composition teachers: the two parallel fifths in the first and second quarters of the second bar and the double half-step (or modal interval) in the third quarter.

However, this is merely an example of polyphonic notation using LilyPond and, fortunately for me, not a harmony exercise.

**Notes on the commands used:**

-   `\\ (Double Backslash)`: This is the separator between voices. Everything before it goes into Voice 1, everything after it into Voice 2.
-   `\relative c'`: Defines the starting octave. It is very useful for avoiding having to write too many apostrophes or commas for each note.
-   `PianoStaff`: Groups the two staves (treble and bass clefs) with the typical piano-style side bar.

Thank you for your attention.
