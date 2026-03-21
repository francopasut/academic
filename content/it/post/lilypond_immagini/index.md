---
title: "LilyPond: estrazione di frammenti musicali in formato PDF o PNG"
date: 2026-03-21
slug:  lilypond_immagini
categories:
  - Blog
tags:
  - LilyPond
image:
  placement: 3
  preview_only: false 
  caption: 'Music and computer'
canonicalUrl: https://francopasut.blogspot.com/2026/03/lilypond-estrazione-di-frammenti.html
---

- [1. LilyPond, estrazioni di frammenti di partiture: metodo dettagliato](#1-lilypond-estrazioni-di-frammenti-di-partiture-metodo-dettagliato)
- [2. Formato di output: PDF e PNG.](#2-formato-di-output-pdf-e-png)
- [3. Estrarre un frammento dall'inizio di una partitura](#3-estrarre-un-frammento-dallinizio-di-una-partitura)
- [4. Aumentare la risoluzione delle immagini](#4-aumentare-la-risoluzione-delle-immagini)
- [5. Esportazione rapida di un frammento](#5-esportazione-rapida-di-un-frammento)


# 1. LilyPond, estrazioni di frammenti di partiture: metodo dettagliato

Questo articolo è stato scritto utilizzando la versione 2.24.4 di LilyPond con riferimento alla relativa  [pagina 3.4.1 del manuale ufficiale](https://lilypond.org/doc/v2.24/Documentation/notation/extracting-fragments-of-music.it.html).

La pagina fornisce un'indicazione corretta ma parziale: il codice è incompleto in quanto mancante della parte musicale.

Ho scritto, partendo  dall'esempio contenuto nel manuale ma semplificando i parametri musicali, un modello completo anche con un frammento musicale.

Il modello   estrae dal file di *input* un frammento che inizia **dopo** la prima semiminima nella seconda misura (2 1 4) e termina **dopo** la prima semiminima nella terza misura (3 1 4).

    \version "2.24.4"
    
    \layout {
      clip-regions = #(list
        (cons
          (make-rhythmic-location 2 1 4)
          (make-rhythmic-location 3 1 4))
      )
    }
    
    \relative c' {
      \time 4/4
      c4 d e f |    % Battuta 1 (sarà ignorata nel clip)
      g4 a b c |    % Battuta 2 (inclusa in parte)
      d4 c b a |    % Battuta 3 (inclusa n parte)
      g4 f e d c1 | % Battuta 4 e 5 (ignorate)
    }

Si compila con `lilypond -dclip-systems filename.ly` in cui, ovviamente, il nome del file deve essere quello reale.

![img](./prova-from-2.1.4-to-3.1.4-clip_16-3-2026.png)


# 2. Formato di output: PDF e PNG.

Il nome del file *output* dell'operazione precedente è : "filename-from-2.1.4-to-3.1.4-clip.pdf".

Nel manuale ufficiale di LilyPond si afferma che in mancanza di specifiche indicazioni il formato di *output* sarebbe EPS. 

In realtà, come risulta dal nome del file sopra riportato il formato di *output* di *default* è PDF.

Inoltre il manuale menziona la possibilità di impostare il formato di *output* in PNG ma non fornisce alcun esempio.

In realtà la soluzione è molto semplice: basta inserire il formato nella stringa di generazione: `lilypond -dclip-systems --png filename.ly`.

Notare l'istruzione *&ndash;png* che consente di indirizzare l'output verso il formato PNG.

Ecco il nome del file generato dall'operazione precedente: "filename-from-2.1.4-to-3.1.4-clip.png".


# 3. Estrarre un frammento dall'inizio di una partitura

Altra particolarità, anche questa non illustrata nel manuale: per estrarre un frammento che parta non **dopo** una nota ma all'**inizio** di una partitura, occorre impostare il primo *make-rhythmic-location* allo "zero" musicale, ovvero: "battuta 1, tempo 0".

Segue un  esempio completo e funzionante per l'estrazione di un  frammento che inizia **prima** della prima semiminima nella prima misura (1 0 4) e termina **prima** della prima semiminima nella terza misura (3 0 4).

    \version "2.24.4"
    
    \layout {
      clip-regions = #(list
        (cons
          (make-rhythmic-location 1 0 4)
          (make-rhythmic-location 3 0 4))
      )
    }
    
    \relative c' {
      \time 4/4
      c4 d e f |    % Battuta 1 (inclusa)
      g4 a b c |    % Battuta 2 (inclusa)
      d4 c b a |    % Battuta 3 (ignorata)
      g4 f e d c1 | % Battuta 4 e 5 (ignorate)
    }

Anche questo si compila con `lilypond -dclip-systems filename.ly` in cui, ovviamente occorre personalizzare il *filename*.

![img](./prova-from-1.0.1-to-3.0.1-clip_16-3-2026.png)


# 4. Aumentare la risoluzione delle immagini

La risoluzione predefinita di LilyPond è molto bassa, solitamente 101 DPI.

Tale risoluzione non è affatto adatta alla stampa di  documenti di alta qualità in quanto visibilmente *sgranata*.

Per ottenere una maggiore risoluzione occorre  usare l'opzione *-dresolution* seguita dal valore desiderato (espresso in DPI).

Ad esempio, per una qualità tipografica professionale si può impostare un  valore di 300 o 600.

Consiglio 600 Dpi, rimanendo le dimensioni trascurabili.

Di seguito riporto il comando completo per la generazione : `lilypond -dclip-systems -dresolution=600 --png filename.ly`.


# 5. Esportazione rapida di un frammento

Se l'obiettivo è avere un'immagine pulita di poche battute senza impazzire con i "moments", esiste un metodo molto più immediato che non richiede il flag *-dclip-systems*.

Ecco uno snippet di codice:

Basta istruire  LilyPond a ritagliare la pagina attorno alle note.

    \paper {
      indent = 0\mm
      line-width = 120\mm  % Regola la larghezza del frammento
      oddFooterMarkup = ##f
      oddHeaderMarkup = ##f
      bookTitleMarkup = ##f
      scoreTitleMarkup = ##f
    }
    
    { \time 4/4 g'4 a' b' c'' }

In questo caso il frammento musicale è parte integrante del sorgente.

Si deve compilare con: `lilypond --png -dpreview filename.ly`.

![img](./prova.preview_16-3-2026.png)

Anche in questo caso è possibile, anzi consigliabile, impostare la risoluzione a 600 Dpi con l'opzione *-dresolution=600*, come da frammento seguente: `lilypond -dresolution=600 --png -dpreview filename.ly`.

Questo genererà un file chiamato `filename.preview.png` perfettamente ritagliato basato sul frammento indicato alla fine dello snippet.

Grazie per l'attenzione.