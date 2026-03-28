---
title: "LilyPond, alla scoperta della notazione polifonica"
date: 2026-03-28
slug:  lilypond_polifonia_28-3-2026
categories:
  - Blog
tags:
  - LilyPond
image:
  placement: 3
  preview_only: false 
  caption: 'LilyPond e polifonia'
canonicalUrl: https://francopasut.blogspot.com/2026/03/lilypond-alla-scoperta-della-notazione.html
---

- [1. Brevissima premessa](#1-brevissima-premessa)
- [2. Cosa sono i gambi delle note?](#2-cosa-sono-i-gambi-delle-note)
- [3. Gestione dei gambi nella scrittura polifonica](#3-gestione-dei-gambi-nella-scrittura-polifonica)
- [4. Esempi musicali](#4-esempi-musicali)
- [5. Il costrutto rapido](#5-il-costrutto-rapido)
- [6. Esempio di costrutto rapido più articolato](#6-esempio-di-costrutto-rapido-più-articolato)

# 1. Brevissima premessa

Finalmente ho capito la "logica" del linguaggio LilyPond connessa alle  diverse modalità di scrittura delle  voci multiple.

Scrivo subito la mia "scoperta" prima che me ne dimentichi, in fondo questo "blog" server proprio a questo!

La **polifonia** è una tecnica compositiva in cui diverse linee melodiche indipendenti vengono sovrapposte ed eseguite contemporaneamente, creando un tessuto sonoro in cui ogni voce mantiene la propria autonomia pur armonizzandosi con le altre.

L'evoluzione della polifonia ha segnato il passaggio da una concezione lineare della musica (ad esempio: la monodia gregoriana) ad una basata sulla complessità architettonica (ad esempio: il contrappunto).

LilyPond ha una gestione eccellente della polifonia, anche sullo stesso rigo,  come nel caso del pianoforte.

Quando due o più melodie condividono lo stesso rigo, occorre gestire l'orientamento dei gambi delle note e degli altri elementi accessori per ridurre il rischio di collisioni.

# 2. Cosa sono i gambi delle note?

I **gambi delle note** sono le linee verticali collegate alle teste delle note che indicano la durata del suono.

La loro direzione (verso l'alto o verso il basso) non è solo estetica, ma funge da vero e proprio "strumento di segnaletica" per la leggibilità della musica.

Nella polifonia, i gambi diventano fondamentali per un motivo preciso: permettono di distinguere visivamente le diverse linee melodiche (voci) che si muovono simultaneamente.

LilyPond ha una gestione molto precisa dei gambi delle note.

Nella "normale" configurazione i gambi sono gestiti dalla posizione delle note sul rigo, come dal seguente frammento tratto dal Manuale di Notazione di LilyPond:

![img](./gambi_26-3-2026.png)

Nella scrittura polifonica la gestione deve essere modificata.

# 3. Gestione dei gambi nella scrittura polifonica

Per la gestione dei gambi nella scrittura polifonica è necessario attribuire alle voci un ruolo specifico.

Il ruolo specifico viene attribuito, in LilyPond, con i seguenti comandi:

-   \voiceOne
-   \voiceTwo
-   \voiceThree
-   \voiceFour
-   \oneVoice

Ogni comando ha uno specifico effetto, come da seguente  tabella sinottica:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Comando</th>
<th scope="col" class="org-left">Direzione Gambi</th>
<th scope="col" class="org-left">Direzione Legature</th>
<th scope="col" class="org-left">Note</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">\voiceOne</td>
<td class="org-left">Su</td>
<td class="org-left">Su</td>
<td class="org-left">Solitamente la Voce superiore</td>
</tr>

<tr>
<td class="org-left">\voiceTwo</td>
<td class="org-left">Giù</td>
<td class="org-left">Giù</td>
<td class="org-left">Solitamente la Voce inferiore</td>
</tr>

<tr>
<td class="org-left">\voiceThree</td>
<td class="org-left">Su</td>
<td class="org-left">Su</td>
<td class="org-left">Terza voce (spostata orizzontalmente)</td>
</tr>

<tr>
<td class="org-left">\voiceFour</td>
<td class="org-left">Giù</td>
<td class="org-left">Giù</td>
<td class="org-left">Quarta voce (spostata orizzontalmente)</td>
</tr>

<tr>
<td class="org-left">\oneVoice</td>
<td class="org-left">Automatico</td>
<td class="org-left">Automatico</td>
<td class="org-left">Ripristina il comportamento standard</td>
</tr>
</tbody>
</table>

# 4. Esempi musicali

Per comprendere l'effetto dei comandi riporto alcuni breve esempi musicali.

Gli esempi  hanno il solo scopo di rappresentare le caratteristiche della scrittura polifonica con LilyPond.

Nel primo esempio riporto un semplicissimo frammento in cui sono chiaramente visibili i comandi \voiceOne, \voiceTwo e \oneVoice.

    
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
      \oneVoice % Torna alla scrittura a voce singola
      g'4 a g2
    }

Ecco il risultato:

![img](./esempio_esplicito_1_26-3-2026.png)

Come potete facilmente constatare nella prima battuta i gambi della voce superiore sono tutti verso l'alto perché sono sotto l'effetto del comando /voiceOne.

Nella seconda battuta **le stesse note** hanno gambi in parte verso il basso ed in parte verso l'alto, in quanto l'effetto precedente è stato neutralizzato dal comando /oneVoice.

Per curiosità riporto lo stesso frammento **dopo avere eliminato i comandi voiceOne e voiceTwo**.

![img](./esempio_esplicito_2_26-3-2026.png)

La differenza è evidente: guardate la confusione della prima misura!

Per far sì che i comandi funzionino contemporaneamente senza interferire tra loro, ogni gruppo di note deve abitare in una "bolla" separata (un contesto "Voice").

In pratica: il comando `/new Voice` all'inizio di ogni voce polifonica rende le voci gestibili senza contrasti con la altre voci presenti nella partitura.

# 5. Il costrutto rapido

LilyPond offre anche un sistema "rapido" per la creazione di frammenti polifonici.

Lo schema è il seguente: `<< ... \\ ... >>`.

Questo è il metodo più veloce in quanto LilyPond assegna automaticamente \voiceOne alla prima sezione e \voiceTwo alla seconda (separate dal doppio backslash \\\\).

Ecco un semplice esempio:

    
    \relative c'' {
      <<
        { g4 f e d } \\ % Diventa automaticamente \voiceOne
        { e2 c }      % Diventa automaticamente \voiceTwo
      >>
    }

![img](./esempio_rapido_1_26-3-2026.png)

Per un controllo totale è, tuttavia, meglio utilizzare il metodo precedente dichiarando esplicitamente i contesti Voice.

In questo modo è possibile, come sopra precisato, decidere esattamente quando attivare o disattivare lo stile delle voci.

# 6. Esempio di costrutto rapido più articolato

Di seguito riporto una versione del "costrutto rapido" un po' più articolata:

    \version "2.24.0"
    
    \header {
      title = "Esempio Polifonico per Pianoforte"
      composer = "Franco"
    }
    
    piano_upper = \relative c' {
      \clef treble
      \key g \major
      \time 4/4
    
      <<
        % Voce 1 (Superiore - gambi in su)
        { r4 g'8( fis) g4 d | e8( fis g a) b4 g }
        \\
        % Voce 2 (Inferiore - gambi in giù)
        { d2 d | c4 e d2 }
      >>
    }
    
    piano_lower = \relative c {
      \clef bass
      \key g \major
      \time 4/4
    
      <<
        % Voce 3 (Superiore nel basso)
        { b'4 b b b | a c b2 }
        \\
        % Voce 4 (Inferiore nel basso)
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

Ecco il risultato:

![img](./esempio_rapido_2_26-3-2026.png)

Nell'esempio precedente ci sono alcuni passaggi che faranno "inorridire" i docenti di composizione: le due quinte parallele nel primo e secondo quarto  della seconda battuta e la doppia mediante (o modale) del terzo quarto.

Tuttavia trattasi di un mero esempio di scrittura polifonica tramite LilyPond e, per mia fortuna, non un esercizio di armonia.

**Osservazioni sui comandi utilizzati:**

-   `\\ (Double Backslash)`: È il separatore tra le voci. Tutto ciò che sta prima va nella Voice 1, tutto ciò che sta dopo nella Voice 2.
-   `\relative c'`: Definisce l'ottava di partenza. È molto utile per evitare di scrivere troppi apostrofi o virgole per ogni nota.
-   `PianoStaff`: Raggruppa i due righi (chiave di violino e chiave di basso) con la tipica graffa laterale del pianoforte.

Grazie per la Vostra attenzione.
