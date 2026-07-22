---
title: "LilyPond, MusicXML ed Intelligenza Artificiale"
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
canonicalUrl: https://francopasut-en.blogspot.com/2026/07/lilypond-musicxml-and-artificial.html
---

- [1. Scrivere la musica: perché l'Intelligenza Artificiale preferisce LilyPond ai software grafici](#1-scrivere-la-musica-perché-lintelligenza-artificiale-preferisce-lilypond-ai-software-grafici)
- [2. I software grafici ed il linguaggio MusicXML](#2-i-software-grafici-ed-il-linguaggio-musicxml)
- [3. È possibile scrivere partiture direttamente con il linguaggio MusicXML?](#3-è-possibile-scrivere-partiture-direttamente-con-il-linguaggio-musicxml)
- [4. Perdita di informazioni durante il passaggio in MusicXML](#4-perdita-di-informazioni-durante-il-passaggio-in-musicxml)
- [5. Usare i sistemi di Intelligenza Artificiale come OCR](#5-usare-i-sistemi-di-intelligenza-artificiale-come-ocr)
- [6. Prova di OCR per LilyPond e MusicXML](#6-prova-di-ocr-per-lilypond-e-musicxml)
- [7. Altra prova](#7-altra-prova)
- [8. In conclusione](#8-in-conclusione)


## 1. Scrivere la musica: perché l'Intelligenza Artificiale preferisce LilyPond ai software grafici

Per la sintesi di questo articolo vedi [questa pagina](https://francopasut.wordpress.com/2026/07/05/perche-lia-preferisce-lilypond-e-i-limiti-di-musicxml/).

Nel panorama della notazione musicale digitale esistono due approcci radicalmente diversi: da un lato i software grafici (WYSIWYG) come **MuseScore**, **Finale** e **Sibelius**, dall'altro **LilyPond**, basato interamente su codice testuale puro.

Un file scritto in LilyPond, con estensione `.ly`, non è altro che semplice testo, esattamente come un sorgente di una linguaggio di programmazione, tipo Python, o di un linguaggio di marcatura, come  HTML, Markdown e LaTeX.

Questa natura testuale lo rende **immediatamente utilizzabile da qualsiasi IA**.

Un modello linguistico può leggere, comprendere, modificare e generare codice LilyPond in modo nativo, senza bisogno di filtri o conversioni, sfruttando la stessa logica con cui compilano righe di linguaggi di programmazione o documenti in LaTeX.

## 2. I software grafici ed il linguaggio MusicXML

Al contrario, programmi come MuseScore o Sibelius memorizzano le informazioni in formati proprietari binari, che possono contenere XML strutturati.

L'IA non può "leggere" direttamente questi file.

Per permettere a un'Intelligenza Artificiale di analizzare o scrivere una partitura creata con questi applicativi, è necessario convertire il binario in un linguaggio di trasporto.

Qui entra in gioco il linguaggio **MusicXML**.

Questo linguaggio rappresenta uno standard di interscambio universale basato su testo che descrive la partitura in modo analitico — nota per nota, battuta per battuta — fungendo da ponte tra l'interfaccia grafica e l'elaborazione dei dati.

L'IA legge, quindi, il file di interscambio e non il documento originale.

## 3. È possibile scrivere partiture direttamente con il linguaggio MusicXML?

Sì, è teoricamente possibile scrivere partiture direttamente in MusicXML, ma nella pratica è una scelta estremamente faticosa e sconsigliata per gli esseri umani.

Il motivo è strutturale: MusicXML è un formato basato su XML (Extensible Markup Language) progettato come formato di interscambio tra diversi software musicali (come Finale, Sibelius, MuseScore o Dorico), e non come linguaggio di codifica per la scrittura manuale. Di conseguenza, è incredibilmente prolisso e verboso.

Ad esempio, per scrivere una semplice nota (ad esempio, un Do centrale con la durata di una semiminima/quarto), il codice MusicXML necessario è il seguente:

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

Quindi, servono dieci righe di codice annidato per descrivere una singola nota. 

Moltiplicando  questo codice per rappresentare una battuta di quattro quarti oppure per un intero brano polifonico, si raggiungerebbero facilmente  migliaia di righe di tag XML, rendendo il *debug* e la visualizzazione "umana" del codice praticamente impossibili.

Più avanti riporto alcuni frammenti completi in linguaggio MusicXML.

## 4. Perdita di informazioni durante il passaggio in MusicXML

Il linguaggio  MusicXML è nato come un formato di interscambio. Il suo scopo principale è tradurre le note, le durate e la struttura musicale di base in modo che un file creato, ad esempio, su Sibelius possa essere aperto su MuseScore o Finale senza dover ricominciare da capo.

Tuttavia la partitura generata dopo il trasferimento attraverso MusicXML può essere molto diversa rispetto a quella di origine.

In particolare potrebbero esserci problemi per i dettagli geometrici e per la  gestione della Polifonia (Voci e Livelli).

MuseScore gestisce la polifonia tramite le "Voci" (1, 2, 3, 4), Finale usa i "Layers", Sibelius i "Voices".

Quando MusicXML traduce queste strutture, il software che riceve il file potrebbe confondere la Voce 2 con la Voce 3, invertendo l'orientamento delle gambe delle note (su/giù) o unendo erroneamente due voci distinte in un unico accordo.

In breve: il MusicXML è eccellente per salvare lo "scheletro" musicale (note, ritmi, tonalità), soprattutto in brani monodici, ma l'eleganza grafica della partitura originale deve essere quasi sempre ricostruita dopo l'importazione.

Nel prosieguo di questo articolo trovate  esempi reali e completi di codice **MusicXML** e **LilyPond**.

## 5. Usare i sistemi di Intelligenza Artificiale come OCR

Un "nuovo" sistema di condivisione delle partiture mosicali è costituito proprio dai software di Intelligenza Artificiale.

In questo articolo ho provato a convertire semplici partiture, con un minimo di polifonia, utilizzando Gemini.

Il primo test è quella relativo al  riconoscimento di una semplicissima partitura in PDF con conversione del contenuto prima in LilyPond e, poi, in MusicXML caricato in MuseScore.

## 6. Prova di OCR per LilyPond e MusicXML

Ecco la clip originale in LilyPond, prima in versione codice sorgente e, poi, in PDF:

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

Ho effettuato l'OCR caricando il PDF su Gemini e chiedendo l'output in LilyPond, ed ecco il risultato, anche in questo caso prima con il relativo codice e, poi, nella versione compilata.

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

Ed ecco, invece, la versione on OCR in formato MusicXML e successiva importazione in MuseScore.

ATTENZIONE: il sorgente in MusicXML è, come sopra anticipato, **lunghissimo**: Consiglio di scorrere velocemente fino alla fine del sorgente.

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

## 7. Altra prova

Vista la chiara insufficienza del risultato in MusicXML ho provato ed esportare il sorgente in LilyPond direttamente in formato MusicXML, senza passare dall'OCR del PDF.

Per tale operazione ho utilizzato il seguente comando:

    ly musicxml Fra-Martino-Campanaro.ly > Fra-Martino-Campanaro.musicxml

Riporto integralmente il codice MusicXML ottenuto: anche in questo caso consiglio di scorrere velocemente.

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

Il risultato in PDF è il seguente:

![img](./fra_martino_export_ly_28-6-2026.png)

Molto meglio rispetto all'OCR da PDF a MusicXML.

Ricordo, in ogni caso, che questa versione è stata ottenuta da conversione diretta da LilyPond.

Come sopra anticipato: in questo caso MusicXML ha conservato la struttura melodica polifonica dell'originale.

## 8. In conclusione

LilyPond sembra essere stato creato apposta per l'intelligenza artificiale. 

Ovviamente non è così perché risale a molto prima della nascita delle attuali soluzioni di IA.

In ogni caso si coordina perfettamente non solo per la scrittura di partiture mediante caratteri di testo ma anche per i risultati del riconoscimento ottico  di partiture già stampate. 

Per le operazioni di OCR LilyPond fornisce risultati migliori rispetto a MusicXML.

Il trasferimento dal codice LilyPond ad MusicXML, invece, fornisce risultati abbastanza attendibili.

Vi ringrazio per l'attenzione.

