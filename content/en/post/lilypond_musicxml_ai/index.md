---
title: "LilyPond, MusicXML and Artificial Intelligence"
date: 2026-07-22
slug:  lilypond_musicxml_ia
categories:
  - Blog
tags:
  - LilyPond
  - MusicXML
image:
  placement: 3
  preview_only: false 
  caption: 'LilyPond vs MusicXML'
canonicalUrl: https://francopasut.blogspot.com/2026/07/lilypond-musicxml-ed-intelligenza.html
---

- [1. Writing Music: Why Artificial Intelligence Prefers LilyPond to Graphical Software](#1-writing-music-why-artificial-intelligence-prefers-lilypond-to-graphical-software)
- [2. Graphics Software and the MusicXML Language](#2-graphics-software-and-the-musicxml-language)
- [3. Is it possible to write sheet music directly in MusicXML?](#3-is-it-possible-to-write-sheet-music-directly-in-musicxml)
- [4. Loss of Information During Conversion to MusicXML](#4-loss-of-information-during-conversion-to-musicxml)
- [5. Using Artificial Intelligence Systems Such as OCR](#5-using-artificial-intelligence-systems-such-as-ocr)
- [6. OCR Test for LilyPond and MusicXML](#6-ocr-test-for-lilypond-and-musicxml)
- [7. Another Attempt](#7-another-attempt)
- [8. In conclusion](#8-in-conclusion)


## 1. Writing Music: Why Artificial Intelligence Prefers LilyPond to Graphical Software

In the world of digital music notation, there are two radically different approaches: on one hand, graphical (WYSIWYG) software such as **MuseScore**, **Finale**, and **Sibelius**; on the other, **LilyPond**, which is based entirely on plain text.

A file written in LilyPond, with the `.ly` extension, is nothing more than plain text—just like the source code of a programming language, such as Python, or a markup language, such as HTML, Markdown, and LaTeX.

This text-based nature makes it **immediately usable by any AI**.

A language model can read, understand, modify, and generate LilyPond code natively, without the need for filters or conversions, using the same logic it employs to process lines of programming code or LaTeX documents.

## 2. Graphics Software and the MusicXML Language

In contrast, programs like MuseScore or Sibelius store information in proprietary binary formats, which may contain structured XML.

AI cannot “read” these files directly.

To enable an Artificial Intelligence to analyze or compose a score created with these applications, the binary data must be converted into a transport language.

This is where the **MusicXML** language comes into play.

This language is a universal, text-based exchange standard that describes the score analytically—note by note, measure by measure—serving as a bridge between the graphical interface and data processing.

AI, therefore, reads the exchange file rather than the original document.

## 3. Is it possible to write sheet music directly in MusicXML?

Yes, it is technically possible to write sheet music directly in MusicXML, but in practice it is an extremely laborious task and not recommended for humans.

The reason is structural: MusicXML is an XML (Extensible Markup Language)-based format designed as an interchange format between different music software programs (such as Finale, Sibelius, MuseScore, or Dorico), not as a coding language for manual composition. As a result, it is incredibly verbose and cumbersome.

For example, to write a simple note (such as a middle C with a quarter note duration), the required MusicXML code is as follows:

    <note>
      <pitch>
        <step>C</step>
        <octave>4</octave>
      </pitch>
      <duration>1</duration>
      <voice>1</voice>
      <type>quarter</type>
      <stem>up</stem>
    </note>

So, it takes ten lines of nested code to describe a single note. 

If you were to multiply this code to represent a four-four measure or an entire polyphonic piece, you would easily end up with thousands of lines of XML tags, making debugging and a “human-readable” view of the code practically impossible.

Later on, I’ll include some complete code snippets in MusicXML.

## 4. Loss of Information During Conversion to MusicXML

The MusicXML language was created as an interchange format. Its main purpose is to translate notes, durations, and basic musical structure so that a file created, for example, in Sibelius can be opened in MuseScore or Finale without having to start from scratch.

However, the score generated after conversion via MusicXML may differ significantly from the original.

In particular, there may be issues with geometric details and the handling of polyphony (voices and layers).

MuseScore handles polyphony using “Voices” (1, 2, 3, 4), Finale uses “Layers,” and Sibelius uses “Voices.”

When MusicXML converts these structures, the software receiving the file might confuse Voice 2 with Voice 3, reversing the orientation of the note stems (up/down) or erroneously merging two distinct voices into a single chord.

In short: MusicXML is excellent for preserving the musical “skeleton” (notes, rhythms, key signatures), especially in monophonic pieces, but the graphical elegance of the original score almost always needs to be reconstructed after import.

Later in this article, you’ll find real, complete examples of **MusicXML** and **LilyPond** code.

## 5. Using Artificial Intelligence Systems Such as OCR

A “new” system for sharing musical scores is based precisely on Artificial Intelligence software.

In this article, I tried converting simple scores—with minimal polyphony—using Gemini.

The first test involved recognizing a very simple PDF score, converting the content first to LilyPond and then to MusicXML, which was then loaded into MuseScore.

## 6. OCR Test for LilyPond and MusicXML

Here is the original clip in LilyPond, first as source code and then as a PDF.

Note: I have maintained the Italian text.

The song used for the rehearsals is "Brother John".

    \version "2.24.0"
    
    \header {
      title = "Fra Martino Campanaro"
      subtitle = "Canone a 2 voci sulla mano destra"
    }
    
    global = {
      \key c \major
      \time 4/4
    }
    
    melodiaPrincipale = \relative c' {
      c4 d e c | c d e c |
      e4 f g2  | e4 f g2 |
      g8 a g f e4 c | g'8 a g f e4 c |
      c4 g c2  | 
    }
    
    ultimaBattutaFormale = \relative c' {
      c4 g c2 |
    }
    
    ultimaBattutaConFermata = \relative c' {
      c4 g c2\fermata |
    }
    
    voceDestraUno = \relative c' {
      \global
      \melodiaPrincipale
      \ultimaBattutaFormale
      s1 | s1 
    }
    
    voceDestraDue = \relative c' {
      \global
      s1 | s1 
      \melodiaPrincipale
      \ultimaBattutaConFermata \bar "|."
    }
    
    manoSinistra = \relative c {
      \global
      \clef bass
      c4 g c2 | c4 g c2 | c4 g' c, 2  | c4 g' c, 2  |
      r2 g'8 a g f  | e4 c g'8 a g f | e4 c  g'8 a g f | e4 c g'8 a g f | 
      e f e d  e4 c  | r1 |  
    }
    
    \score {
      \new PianoStaff <<
    
        \new Staff = "right" <<
          \new Voice = "melodiaUno" { \voiceOne \voceDestraUno }
          \new Voice = "melodiaDue" { \voiceTwo \voceDestraDue }
        >>
    
        \new Staff = "left" {
          \manoSinistra
        }
    
      >>
      \layout { 
        \context {
          \Score
          \override BarNumber.break-visibility = ####(##f ##t ##t)
        }
      }
      \midi { \tempo 4 = 120 }
    } 

![img](./fra_martino_originale_28-6-2026.png)

I ran the OCR by uploading the PDF to Gemini and requesting the output in LilyPond, and here is the result—again, first with the corresponding code and then in the compiled version.

     \version "2.24.0"
    
    \header {
      title = "Fra Martino Campanaro"
      subtitle = "Canone a 2 voci sulla mano destra"
      tagline = ####f
    }
    
    global = {
      \key c \major
      \time 4/4
    }
    
    rightVoiceOne = \relative c' {
      \global
      \voiceOne
      c4 d e c |
      c4 d e c |
      e4 f g2 |
      e4 f g2 |
      g8 a g f e4 c |
      g'8 a g f e4 c |
      c4 g c2 |
      c4 g c2 |
      R1 |
      R1 |
    }
    
    rightVoiceTwo = \relative c' {
      \global
      \voiceTwo
      R1 |
      R1 |
      c4 d e c |
      c4 d e c |
      e4 f g2 |
      e4 f g2 |
      g8 a g f e4 c |
      g'8 a g f e4 c |
      c4 g c2 |
      c4 g c2 |
    }
    
    leftHand = \relative c {
      \global
      \clef bass
      c4 g c g |
      c4 g c g |
      c4 g c g |
      c4 g c g |
      c4 r r2 |
      c4 g c8 d e f |
      g4 g, c8 d e f |
      g4 g, c8 d e f |
      g4 g, c2 |
      g4 g, c2 |
    }
    
    \score {
      \new PianoStaff <<
        \new Staff = "right" <<
          \clef treble
          \new Voice = "v1" \rightVoiceOne
          \new Voice = "v2" \rightVoiceTwo
        >>
        \new Staff = "left" {
          \leftHand
        }
      >>
      \layout {
        \context {
          \Staff
          \consists "Merge_rests_engraver"
        }
      }
    } 

![img](./fra_martino_ocr_28-6-2026-1.png)

And here, on the other hand, is the OCR-processed version in MusicXML format, which was then imported into MuseScore.

PLEASE NOTE: As mentioned above, the MusicXML source file is **very long**: I recommend quickly scrolling to the end of the source file.

     <?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <!DOCTYPE score-partwise PUBLIC
        "-//Recordare//DTD MusicXML 3.1 Partwise//EN"
        "http://www.musicxml.org/dtds/partwise.dtd">
    <score-partwise version="3.1">
      <work>
        <work-title>Fra Martino Campanaro</work-title>
      </work>
      <identification>
        <miscellaneous>
          <miscellaneous-field name="subtitle">Canone a 2 voci sulla mano destra</miscellaneous-field>
        </miscellaneous>
      </identification>
      <part-list>
        <score-part id="P1">
          <part-name>Piano</part-name>
        </score-part>
      </part-list>
    
      <part id="P1">
        <measure number="1">
          <attributes>
            <divisions>2</divisions>
            <key>
              <fifths>0</fifths>
              <mode>major</mode>
            </key>
            <time>
              <beats>4</beats>
              <beat-type>4</beat-type>
            </time>
            <staves>2</staves>
            <clef number="1">
              <sign>G</sign>
              <line>2</line>
            </clef>
            <clef number="2">
              <sign>F</sign>
              <line>4</line>
            </clef>
          </attributes>
    
          <note>
            <pitch><step>C</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch><step>D</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch><step>E</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch><step>C</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
    
          <backup><duration>8</duration></backup>
          <note>
            <rest/>
            <duration>8</duration>
            <voice>2</voice>
            <staff>1</staff>
          </note>
    
          <backup><duration>8</duration></backup>
          <note>
            <pitch><step>C</step><octave>3</octave></pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch><step>G</step><octave>2</octave></pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch><step>C</step><octave>3</octave></pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch><step>G</step><octave>2</octave></pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
        </measure>
    
        <measure number="2">
          <note>
            <pitch><step>C</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch><step>D</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch><step>E</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch><step>C</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <backup><duration>8</duration></backup>
          <note>
            <rest/>
            <duration>8</duration>
            <voice>2</voice>
            <staff>1</staff>
          </note>
          <backup><duration>8</duration></backup>
          <note>
            <pitch><step>C</step><octave>3</octave></pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch><step>G</step><octave>2</octave></pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch><step>C</step><octave>3</octave></pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch><step>G</step><octave>2</octave></pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
        </measure>
    
        <measure number="3">
          <note>
            <pitch><step>E</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch><step>F</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch><step>G</step><octave>4</octave></pitch>
            <duration>4</duration>
            <voice>1</voice>
            <type>half</type>
            <staff>1</staff>
          </note>
          <backup><duration>8</duration></backup>
          <note>
            <pitch><step>C</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch><step>D</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch><step>E</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch><step>C</step><octave>4</octave></pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <backup><duration>8</duration></backup>
          <note>
            <pitch><step>C</step><octave>3</octave></pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch><step>G</step><octave>2</octave></pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch><step>C</step><octave>3</octave></pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch><step>G</step><octave>2</octave></pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
        </measure>
    
        </part>
    </score-partwise> 

![img](./fra_martino_ocr_28-6-2026-2.png)

## 7. Another Attempt

Given the clearly unsatisfactory result with MusicXML, I tried exporting the source from LilyPond directly to MusicXML format, without going through PDF OCR.

For this operation, I used the following command:

    ly musicxml Fra-Martino-Campanaro.ly > Fra-Martino-Campanaro.musicxml

I’m including the MusicXML code in its entirety below: again, I recommend skimming through it quickly.

     <?xml version="1.0" encoding="utf-8"?>
    <!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 2.0 Partwise//EN"
                                    "http://www.musicxml.org/dtds/partwise.dtd">
    <score-partwise version="3.0">
      <movement-title>Fra Martino Campanaro</movement-title>
      <identification>
        <encoding>
          <software>python-ly 0.9.7</software>
          <encoding-date>2026-06-28</encoding-date>
        </encoding>
        <subtitle>Canone a 2 voci sulla mano destra</subtitle>
      </identification>
      <part-list>
        <score-part id="P1">
          <part-name />
        </score-part>
      </part-list>
      <part id="P1">
        <measure number="1">
          <attributes>
            <divisions>2</divisions>
            <key>
              <fifths>0</fifths>
              <mode>major</mode>
            </key>
            <time symbol="common">
              <beats>4</beats>
              <beat-type>4</beat-type>
            </time>
            <staves>2</staves>
            <clef number="2">
              <sign>F</sign>
              <line>4</line>
            </clef>
          </attributes>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>D</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>E</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>2</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>4</duration>
            <voice>5</voice>
            <type>half</type>
            <staff>2</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
        </measure>
        <measure number="2">
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>D</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>E</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>2</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>4</duration>
            <voice>5</voice>
            <type>half</type>
            <staff>2</staff>
          </note>
        </measure>
        <measure number="3">
          <note>
            <pitch>
              <step>E</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>4</octave>
            </pitch>
            <duration>4</duration>
            <voice>1</voice>
            <type>half</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>D</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>E</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>4</duration>
            <voice>5</voice>
            <type>half</type>
            <staff>2</staff>
          </note>
        </measure>
        <measure number="4">
          <note>
            <pitch>
              <step>E</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>4</octave>
            </pitch>
            <duration>4</duration>
            <voice>1</voice>
            <type>half</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>D</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>E</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>4</duration>
            <voice>5</voice>
            <type>half</type>
            <staff>2</staff>
          </note>
        </measure>
        <measure number="5">
          <note>
            <pitch>
              <step>G</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>A</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>E</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>E</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>4</octave>
            </pitch>
            <duration>4</duration>
            <voice>2</voice>
            <type>half</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <rest />
            <duration>4</duration>
            <voice>5</voice>
            <type>half</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>A</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
        </measure>
        <measure number="6">
          <note>
            <pitch>
              <step>G</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>A</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>E</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>E</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>4</octave>
            </pitch>
            <duration>4</duration>
            <voice>2</voice>
            <type>half</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>E</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>A</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
        </measure>
        <measure number="7">
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>4</duration>
            <voice>1</voice>
            <type>half</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>G</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>2</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>A</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>2</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>2</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>2</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>E</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>E</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>A</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
        </measure>
        <measure number="8">
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>4</duration>
            <voice>1</voice>
            <type>half</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>G</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>2</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>A</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>2</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>2</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>2</voice>
            <type>eighth</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>E</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>E</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>A</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
        </measure>
        <measure number="9">
          <forward>
            <duration>8</duration>
          </forward>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>4</duration>
            <voice>2</voice>
            <type>half</type>
            <staff>1</staff>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>E</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>F</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>E</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>D</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>5</voice>
            <type>eighth</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>E</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>5</voice>
            <type>quarter</type>
            <staff>2</staff>
          </note>
        </measure>
        <measure number="10">
          <forward>
            <duration>8</duration>
          </forward>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>G</step>
              <octave>3</octave>
            </pitch>
            <duration>2</duration>
            <voice>2</voice>
            <type>quarter</type>
            <staff>1</staff>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>4</octave>
            </pitch>
            <duration>4</duration>
            <voice>2</voice>
            <type>half</type>
            <staff>1</staff>
            <notations>
              <fermata />
            </notations>
          </note>
          <backup>
            <duration>8</duration>
          </backup>
          <note>
            <rest />
            <duration>8</duration>
            <voice>5</voice>
            <type>whole</type>
            <staff>2</staff>
          </note>
        </measure>
        <measure number="11" />
      </part>
    </score-partwise> 

The result in PDF is as follows:

![img](./fra_martino_export_ly_28-6-2026.png)

Much better than OCR from PDF to MusicXML.

Keep in mind, however, that this version was obtained through direct conversion from LilyPond.

As mentioned above: in this case, MusicXML preserved the original’s polyphonic melodic structure.

## 8. In conclusion

LilyPond seems to have been created specifically for artificial intelligence. 

Of course, this isn’t the case, since it dates back to long before the advent of today’s AI solutions.

In any case, it works perfectly not only for writing scores using text characters but also for the results of optical character recognition (OCR) of already printed scores. 

For OCR operations, LilyPond provides better results than MusicXML.

Conversely, converting from LilyPond code to MusicXML yields fairly reliable results.

Thank you for your attention.

