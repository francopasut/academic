---
title: "Due strumenti open source per modificare documenti PDF: interfaccia grafica contro linea di comando."
date: 2026-01-08
slug:  arranger_pdftk
categories:
  - Blog
tags:
  - PDF
image:
  placement: 3
  preview_only: false 
  caption: 'Monitor'
canonicalUrl: https://francopasut.blogspot.com/2026/01/due-strumenti-open-source-per.html
---

- [1. Premessa](#1-premessa)
- [2. Gestione delle operazioni con PDF Arranger](#2-gestione-delle-operazioni-con-pdf-arranger)
- [3. Gestione delle stesse operazioni con PDFtk.](#3-gestione-delle-stesse-operazioni-con-pdftk)
- [4. In sintesi](#4-in-sintesi)


# 1. Premessa

Il "PDF" è il formato documentale sostanzialmente statico per antonomasia.

Tuttavia anche i documenti in PDF possono essere modificati, soprattutto con operazioni di eliminazione, aggiunta, inversione di pagine, inserimenti testuali ed altro.

Esistono varie applicazioni, anche gratuite, per effettuare tali operazioni.

In questo articolo riporto alcune osservazioni parallele tra due sistemi per le manipolazioni delle pagine: uno di tipo grafico, PDF Arranger, ed uno a linea di comando, PDFtk.

[PDF Arranger](https://github.com/pdfarranger/pdfarranger) è un'applicazione gratuita e open source (un fork di PDF-Shuffler) ideale per unire, dividere, ruotare e ritagliare file PDF in modo intuitivo.

[PDFtk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/) è uno degli strumenti più  potenti per la manipolazione dei PDF in modalità a riga di comando.

Preciso che questo articolo non ha alcuna pretesa di completezza sui due sistemi citati ma costituisce solo un principio di comparazione.

Le operazioni di "vita reale" prese in considerazione nell'articolo sono: la concatenazione (ovvero l'unione) di PDF singoli in un PDF multipagina, la separazione delle pagine di un documento multipagina in singole pagine, la rotazione di una pagina pagina interna di un documento multipagina.


# 2. Gestione delle operazioni con PDF Arranger

La prima operazione è l'**unione di vari documenti in formato PDF in un unico documento anch'esso in formato PDF.**

Per procedere agli esempi ho creato tre documenti di prova composti ciascuno da una sola pagina in cui è presente esclusivamente un numero in grande formato.

PDF Arranger rende tale operazione estremamente intuitiva: basta premere l'icona "Apri" in alto a sinistra e selezionare i documenti separati tenendo contemporaneamente  premuto il tasto Maiuscolo e, poi, premere Apri nella finestra di selezione.

Quindi occorre selezionare  i documenti da unire e premere il tasto destro del *mouse* (oppure, usando un portatile con *touchpad*, fare *tap*  con due dita) e scegliere la voce *Esporta - Esporta selezione su un singolo file*, come dall'immagine seguente.

![img](./arranger-unione-it-20251216.png)

A questo punto si sceglie un nome per il documento unificato e si salva.

Tutto molto semplice ed intuitivo.

L'operazione uguale e contraria è, ovviamente, la **separazione di un documento PDF  multipagina in singoli documenti PDF monopagina**.

Anche questa operazione è molto semplice con PDF Arranger.

È sufficiente aprire il documento dall'applicazione, selezionare tutte le pagine da dividere e selezionare con il tasto destro del *mouse* la voce *Esporta - Esporta selezione in singoli file*, come dall'immagine seguente:

![img](./arranger-separazione-it-20251226.png)

Faccio notare che nell'immagine qui sopra il documento è, in origine, unico ed è costituito da 3 pagine.

Trattasi, in pratica, del documento ottenuto in precedenza con l'operazione di unione di tre distinti documenti costituita ciascuno da una pagina.

Un'ultima semplice operazione è la **rotazione di una  pagina che si trova all'interno di un documento PDF multipagina**.

Occorre selezionare la pagina (o le pagine) da ruotare, premere il pulsante destro del *mouse* e scegliere *Ruota a sinistra* o *a destra*.

![img](./arranger-ruota-sinistra-it-20251226.png)

È possibile anche utilizzare la scorciatoia indicata a margine della voce di menù, come da immagine precedente.

A questo punto, si salva e si esce dall'applicazione.

Con un pizzico di intuizione si possono effettuare tutte le operazioni di montaggio, smontaggio e rimontaggio dei documenti con estrema semplicità.


# 3. Gestione delle stesse operazioni con PDFtk.

PDFtk rende tali operazioni leggermente più articolate ma, in compenso, regala una velocità di esecuzione superiore a qualsiasi gestore grafico, compreso PDF Arranger.

Per effettuare la prima operazione sopra descritta, ovvero l'unione di  tre documenti PDF in uno solo, basta inserire la sequenza dei  documenti, nel caso specifico denominati 1.pdf, 2.pdf e 3.pdf, come da seguente schema:

    pdftk 1.pdf 2.pdf 3.pdf cat output 123.pdf

Descrizione passo passo:

-   Si inizia lanciando il comando dell'applicazione, ovvero `pdftk`
-   Si inserisce la sequenza dei singoli documenti da unire: nell'esempio `1.pdf 2.pdf 3.pdf`
-   Si invia il comando del tipo di operazione, in questo caso `cat`, che "concatena" i documenti precedenti.
-   Si aggiunge il comando `output` che indica l'operazione di attribuzione del nome: nell'esempio `123.pdf`.

Con un unico comando si effettua  l'operazione che prima era stata eseguita con almeno 4 passaggi (apertura dei documenti, selezione, comando a menù, attribuzione del nome)!

Il tempo risparmiato è direttamente proporzionale al numero di operazioni da eseguire.

Ancora più semplice è l'operazione di separazione di un documento multipagina nella singole pagine che lo compongono:

    pdftk 123.pdf burst

Il sistema stesso si occupa di attibuire un nome progressivo ai singoli documenti ottenuti dall'operazione.

I nomi sono del tipo: pg<sub>0001.pdf</sub>, pg<sub>0002.pdf</sub> ecc.

Leggermente più articolata è l'operazione di rotazione di una pagina tra le altre.

Riporto subito l'esempio corrispondente alla terza operazione svolta nel precedente capitolo:

    pdftk 123.pdf cat 1 2east 3-end output file_name.pdf

Analisi:

-   `pdftk`: lancio del comando.
-   `123.pdf`: nome del documento multipagina da elaborare.
-   `cat`: operazione di concatenazione. Comprendere questo passaggio è essenziale: l'operazione si effettua, infatti, creando una nuova concatenazione in cui alcuni documenti interni sono ruotati.
-   seguono, quindi, le pagine del documento: sia quelle non modificate che quelle da modificare. In questo caso:
    -   La prima pagina non viene modificata
    -   La seconda pagina ruotata di 90 grati verso est, in pratica un quarto di giro in senso orario.
    -   La terza pagina non viene modificata.
    -   In questo esempio ho inserito anche l'operatore `-end` che andrebbe a concatenare tutte le eventuali ulteriori pagine dopo la terza e fino al termine del documento. Ovviamente l'aggiunta ha, in questo caso, solo uno scopo dimostrativo.
-   `output`: comando di attribuzione del nome che viene, poi, specificato nel successivo: `file-name.pdf`.

Nonostante l'apparente maggiore complessità del comando, l'operazione è abbastanza intuitiva e,  con un minimo di pratica,  la sequenza del comando viene compilata all'istante.

Quindi anche in questo caso l'operazione è molto più veloce dell'equivalente grafico.


# 4. In sintesi

Anche per la gestione del PDF si ripropone lo storico dualismo tra interfaccia grafica ed a linea di comando.

La prima è più intuitiva ma la seconda è più veloce.

È questione di conoscenza e scelta personale.

Grazie per l'attenzione.

