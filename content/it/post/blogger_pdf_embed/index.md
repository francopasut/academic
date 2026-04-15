---
title: "Blogger e PDF incorporati, scorrevoli e scaricabili"
date: 2026-04-11
slug:  blogger_pdf_embed
categories:
  - Blog
tags:
  - PDF
  - Blogger
image:
  placement: 3
  preview_only: false 
  caption: 'Blogger e PDF incorporati'
canonicalUrl: https://francopasut.blogspot.com/2026/04/blogger-e-pdf-incorporati-scorrevoli-e.html
---

- [1. Blogger e PDF incorporati](#1-blogger-e-pdf-incorporati)
- [2. Sintesi dei passaggi](#2-sintesi-dei-passaggi)
  - [2.1. Passo 1: caricare il PDF su Google Drive](#21-passo-1-caricare-il-pdf-su-google-drive)
  - [2.2. Passo 2: modificare l’URL per l’anteprima](#22-passo-2-modificare-lurl-per-lanteprima)
  - [2.3. Passo 3: inserire il PDF in Blogger](#23-passo-3-inserire-il-pdf-in-blogger)


# 1. Blogger e PDF incorporati

È possibile incorporare documenti PDF in articoli pubblicati su Blogger, senza utilizzare applicazioni aggiuntive?

Magari con la possibilità di scorrere i documenti incorporati e di scaricarli in locale?

Certamente e la soluzione è molto semplice, come descritto in  [questa pagina.](https://www.bloggandoviaggiando.com/2020/05/come-inserire-pdf-post-blogger.html)

Riporto in sintesi i passaggi con alcune osservazioni aggiuntive:


# 2. Sintesi dei passaggi


## 2.1. Passo 1: caricare il PDF su Google Drive

1.  Vai su Google Drive e accedi con il tuo account Google.
2.  Carica il documento PDF e clicca con il tasto destro sul file → Condividi → imposta la visibilità come “Chiunque con il link può visualizzare”.
3.  Clicca su Copia link.


## 2.2. Passo 2: modificare l’URL per l’anteprima

Sostituisci nella parte finale del link *view?usp=sharing* con *preview*, così:

-   da: <https://drive.google.com/file/d/ID/file/view?usp=sharing>
-   a: <https://drive.google.com/file/d/ID/file/preview>

Questa modifica permette a Google di mostrare il PDF con barra di scorrimento.


## 2.3. Passo 3: inserire il PDF in Blogger

1.  Entra in Blogger e apri il post o la pagina dove occorre inserire il PDF.
2.  Passa alla visualizzazione HTML (tasto “HTML” / “Modifica HTML”) e incolla un codice del seguente tipo:

```HTML
    <div align="center">
      <iframe 
        src="https://drive.google.com/file/d/IL_TUO_ID/preview" 
        width="95%" 
        height="700" 
        frameborder="0">
      </iframe>
    </div>
``` 

-   Il numero ID da inserire è quello generato da Google Drive nell'URL di condivisione.
-   Regola *width* (es. 95%, 640, ecc.) e *height* (es. 700) in base al *layout* del sito.
    
    Occorre considerare che  più alto è il numero di  *iframe* e meno frequente sarà lo scorrimento all’interno del PDF.


Per chi avrà letto questo articolo ed avrà provato a visualizzare il documento incorporato, troverà un piccolo regalo: una vera analisi del Notturno Op. 9 n. 1 di Frederick Chopin, creata per l'occasione!

La partitura è stata scritta in LilyPond ed è tratta da [Mutopia Project](https://www.mutopiaproject.org/).

Il documento incorporato può  essere scaricato ed utilizzato per lo studio del brano.

{{<iframe "misto_musica_testo.pdf">}}

Link semplice: {{< pdf-link "misto_musica_testo.pdf" "Analisi Notturno n. 1  di Chopin" >}}

Grazie per l'attenzione.
