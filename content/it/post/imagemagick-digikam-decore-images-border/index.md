---
title: "Due soluzioni open-source per incorniciare le immagini"
date: 2023-09-21
slug:  imagemagick-digikam-decore-images-border
categories:
  - Blog
tags:
  - Linux
  - Open-Source
  - Images
image:
  placement: 3
  preview_only: true 
  caption: 'Ciao Ace!'
---




## Qual è l'argomento di  questo articolo?

In questo articolo descrivo  due semplici metodi per decorare sia singole che multiple immagini con una cornice di contorno,  utilizzando due risorse *open-source* in ambiente operativo GNU/Linux.

La prima soluzione utilizza un'applicazione grafica. La seconda, invece, è  a linea di comando.

L'aggiunta di una cornice alle immagini è molto utile negli estratti di documenti pubblicati nei siti e blog.

In questi casi, infatti, l'aggiunta di un bordo serve a "staccare" i documenti pubblicati come immagini dal documento base in cui sono pubblicati.

Di seguito riporto alcuni miei articoli con  documenti pubblicati in formato immagine  e decorati con bordi:

- [Appunti sulla risoluzione delle differenze tra due documenti con le risorse integrate di Vim ed Emacs](https://francopasut.netlify.app/it/post/vimdiff-ediff/)
- [A proposito di LaTeX, standalone, PDF e PNG](https://francopasut.netlify.app/it/post/latex-standalone-pdf-png/)
- [Uno studio sull'esportazione e importazione di partiture musicali tra LilyPond e MuseScore via MusicXML](https://francopasut.netlify.app/it/post/lilypond_musescore_musicxml/)


## L'applicazione "digiKam": dalla decorazione singola a quella seriale.

*DigiKam* è un'applicazione multipiattaforma, disponibile, per quanto abbia potuto provare direttamente,  su ogni distribuzione *GNU/Linux* nonché  per *Windows* e *macOS*.

Pur essendo un software *open source*, ha funzionalità di gestione delle immagini digitali, di livello professionale,  anche in formato RAW.

Per la scrittura di questo articolo ho utilizzato la versione 8.1.0. in Fedora Linux.

L'applicazione ha una vasta dotazione di strumenti di modifica per  immagini singole o multiple.

La pagina iniziale di *digiKam* presenta una riga di menu sulla parte superiore ed una serie di pulsanti subito sotto.

Le immagini che seguono in questo paragrafo, sono state decorate proprio con *digiKam*.

![Pagina iniziale digiKam](digikam-screen-menu-it.png)

Per l'aggiunta singola occorre selezionare un'immagine ed aprirla con il pulsante *Editor delle immagini*, ovvero il primo sulla sinistra, come visibile sull'immagine di sopra.

Sulla destra della finestra dell'*editor* si trova una serie di menu verticali: *Proprietà, Metadati, Colori, Didascalie, Versioni, Strumenti*.

Per l'aggiunta di un bordo occorre premere l'ultimo pulsante: *Strumenti* e scegliere la scheda *Decora* seguita da *Aggiungi bordo*:

![digiKam Decora Aggiungi Bordo](digikam-decora-bordo-it.png)

Il resto è molto intuitivo. Occorre scegliere un **tipo** di bordo tra le varie opzioni nel menu *Tipo* nonché scegliere i colori e l'opzione per il mantenimento delle proporzioni:

![digiKam Aggiungi Bordo](digikam-aggiungi-bordo-it.png)

La  descrizione dell'immagine "singola" è utile per l'impostazione della modifica "seriale" che viene attivata premendo il pulsante *Gestione elaborazione in serie* del menu principale riportato nella prima immagine di questo post.



Arrivati a questo punto, è molto semplice passare dall'elaborazione singola a quella seriale: basta usare la funzione *Gestore elaborazione in serie* presente nel menù iniziale,  sulla destra rispetto alla voce *Editor delle immagini*.

In questo modo le specifiche funzioni già presenti nella modifica singola vengono rese disponibili per una serie di immagini.

Ecco l'immagine corrispondente alla funzione di  *decorazione* mediante aggiunta del bordo già sopra descritto ma ora ottenuto in modalità seriale:

![Aggiungi bordo seriale](digikam-batch-aggiungi-bordo-it.png)

In questa modalità sono disponibili tutte le opzioni della precedente modalità singola.

Una volta scelte le modifiche, basta premere il tasto *Avvia* in alto a sinistra nella finestra della gestione seriale di DigiKam.

## La decorazione da linea di comando con ImageMagick.

La linea di domando di GNU/Linux permette di effettuare  varie operazioni **molto più velocemente** rispetto alla modalità grafica.

Per la gestione delle immagini il software a linea di comando più completo,  tra quelli personalmente provati, è [ImageMagick](https://imagemagick.org/index.php).

*ImageMagick* ha una miriade di funzionalità ma per le limitate esigenze di questo articolo si usa l'operatore `-frame` come descritto in  [questo paragrafo](https://imagemagick.org/Usage/crop/#frame).


L'utilizzo di questo software è, strutturalmente, molto semplice: basta iniziare la linea di comando scrivendo `magick` (dalla versione 7) o `convert` (fino alla versione 6), seguito dalle specifiche istruzioni operative.

In questo articolo utilizzo i comandi della versione 7.1.1-15 su Arch Linux.

La struttura per l'aggiunta di una cornice con ImageMagick è la seguente:

- Attivazione del programma con `magick`.
- Nome del documento originale.
- Opzione per la scelta del colore `-mattecolor` seguito dal colore, come illustrato in [questa lista](https://imagemagick.org/script/color.php#color_names).
- Opzione `-frame` per la creazione della cornice.
- Dimensioni della cornice, ad es.  `20x20+5+5`.

Ovviamente si può modificare l'impostazione del `-frame` aumentando o diminuendo i relativi valori.

Questo è un esempio di formula completa: 

```bash
magick original_image.png   -mattecolor peru  -frame 20x20+5+5  frame_image.png
```


Ecco, di seguito, un'immagine senza cornice seguita dalla stessa immagine con la cornice generata dalla formula sopra indicata:

![Original image](ace1_800x600.png)

![Framed image](ace1_framed_800x600.png)

Altre formule che ho positivamente provato sono quelle di seguito schematizzate (questa volta usando `convert` al posto di `magick`):

```bash
convert -border 2x2 -bordercolor "#FF0000" old.jpg new.jpg
```
```bash
convert old.jpg -border 5x10% new.jpg
```
Tenendo in considerazione la struttura base sopra menzionata,  lo schema è molto intuitivo.

## "Batch framing" con ImageMagick.


Una volta compreso lo schema di funzionamento di ImageMagick è abbastanza semplice estendere l'effetto ad una **serie di immagini** piuttosto che ad un'**immagine singola**.

A questo scopo si usa il comando `mogrify`, come nello schema seguente:

```bash
magick mogrify  -mattecolor peru  -frame 20x20+5+5  *.jpg
```

Il comando composito sopra indicato modifica **tutte** le immagini in formato *jpg* presenti nella cartella.

Per evitare di perdere gli originali occorre  creare una sottocartella rispetto a quella in cui si trovano le immagini ed utilizzare l'opzione `-path` con l'aggiunta del nome della *sottocartella*

Ad esempio: in questa formula ipotizzo che il nome della sottocartella sia *pippo*:

```bash
magick mogrify  -path pippo   -mattecolor peru  -frame 20x20+5+5  *.jpg
```
In questo modo le immagini presenti nella cartella di origine rimarranno intatte e quelle modificate saranno collocate direttamente nella sottocartella indicata.

Grazie per l'attenzione.




