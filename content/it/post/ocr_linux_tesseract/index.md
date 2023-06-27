---
title: "Potente sistema di Riconoscimento Ottico di Caratteri  sotto GNU/Linux per documenti PDF gestito da riga di comando e con rifinitura in Vim."
date: 2023-06-26
slug:  ocr_linux_tesseract
categories:
  - Blog
tags:
  - PDF
  - OCR
  - Linux
  - Vim
image:
  placement: 3
  preview_only: true 
  caption: 'Riconoscimento ottico di caratteri'
---

{{% toc %}}


## Premessa

L'idea è nata dalla lettura di [questo articolo](https://www.howtogeek.com/682389/how-to-do-ocr-from-the-linux-command-line-using-tesseract/)   a proposito del  riconoscimento ottico dei caratteri (OCR) in ambiente GNU/Linux da immagini e PDF,  gestito da  linea di comando.

Ovviamente i documenti PDF sono quelli di tipo scansionato da originale cartaceo, ovvero non ottenuti da salvataggio diretto di documento in formato digitale. Per questi ultimi non occorre alcun OCR.

L'articolo è scritto molto bene ed il risultato finale è ottimo.

Mi sono chiesto se fosse possibile aggregare tutti i passaggi in un unico comando di testo.

In questo articolo riporto la mia soluzione.

A seguire, poi, ho aggiunto alcuni passaggi con  *RegEx* in Vim per riformattare il risultato grezzo del riconoscimento ottico.

Anche in questo caso ho provato a riunire in un unica espressione regolare varie formule distinte.

Quindi l'obiettivo è quello di utilizzare un solo comando di testo ed una sola espressione regolare con Vim per ottenere un riconoscimento ottico di buon livello in ambiente GNU/Linux.

## L'installazione dei componenti.

Il motore del sistema è *Tesseract* la cui installazione,   bene descritta nell'articolo di riferimento, avviene come da seguente schema:

- Su Debian e derivate, tra cui Ubuntu e Mint: `sudo apt-get install tesseract-ocr`.
- Su Fedora: `sudo dnf install tesseract`.
- Su Arch e derivate, tra cui Manjaro e EndeavourOS: `sudo pacman -Syu tesseract` o `yay -Syu tesseract`.

Attenzione: per la "famiglia" *Debian* il componente è denominato *tesseract-ocr* mentre per le altre distribuzioni, semplicemente *tesseract*.

Per l'installazione di lingue aggiuntive occorre utilizzare il sistema già indicato per ogni distribuzione indicando uno dei codici lingua [indicato in questa pagina](https://github.com/tesseract-ocr/tesseract/blob/main/doc/tesseract.1.asc#languages), tenendo conto di alcune differenze semantiche tra le varie distribuzioni, come di seguito indicato nel caso dei dati relativi alla lingua italiana:

- Su Debian e derivate, tra cui Ubuntu e Mint: `sudo apt-get install tesseract-ocr-ita`.
- Su Fedora: `sudo dnf install tesseract-langpack-ita`.
- Su Arch e derivate, tra cui Manjaro e EndeavourOS: `sudo pacman -Syu tesseract-data-ita` o `yay -Syu tesseract-data-ita`.

Occorre, inoltre, verificare che nel sistema sia presente il software *pdftoppm* che fa parte del pacchetto *poppler-utils*.

La prova è molto semplice: basta digitare `pdftoppm -help`. Se presente, risponderà con le varie opzioni disponibili.

Altrimenti occorrerà installare tutto il pacchetto:

- Su Debian e derivate, `sudo apt install poppler-utils`.
- Su Fedora: `sudo dnf popple-utils`.
- Su Arch e derivate: `sudo pacman -S poppler` o `yay -S poppler`.


## L'OCR di documenti in PDF con "tesseract": descrizione dei passaggi.

Questo è lo schema dei passaggi per raggiungere il risultato:

- **Obiettivo**: sottoporre a riconoscimento ottivo (OCR) documenti in formato PDF.
- **Problema**: *tesseract* opera solo su immagini e non, invece, su documenti in formato PDF.
- **Soluzione**: occorre effettuare alcune operazioni sui documenti in PDF prima e dopo il riconoscimento ottico, come di seguito indicato:
    - trasformare i PDF in immagini, separando le eventuali pagine multiple in  immagini singole, 
    - applicare il software di OCR ad ogni singola immagine ottenendo separati documenti di testo, 
    - riassemblare i singoli documenti di testo per ricostruire la sequenza originaria del documento partenza.

Sembra complicato ma, in realtà, non lo è affatto se si comprende la funzione specifica di ogni passaggio.

## I singoli passaggi.

Ecco i passaggi, ipotizzando che il documento da trattare sia denominato *document.pdf*:

1. `pdftoppm -png document.pdf document` per trasformare i PDF in immagini in formato PNG (notare l'opzione `-png`) separando ogni pagina in un *file* singolo con numerazione progressiva.
2. `for i in document-*png; do tesseract "$i" "text-$i" -l ita; done;` crea un *loop* che applica *tesseract* su ogni singola immagine e genera un documento di testo denominato *text-document-* seguito da numerazione progressiva a doppia cifra.
3. `cat text-document* > document.txt`, per ricomporre tutti i singoli documenti di testo generati dal riconoscimento ottico in un unico documento.

Nel passaggio n. 2 utilizzo il comando `for i in document-* ...` per consentire il funzionamento del sistema a prescindere dal numero dei documenti da elaborare.


## Tutto in un unico comando!

Ed ecco la parte che realizza il primo obiettivo di questo articolo: concentrare tutti passaggi in un **unico comando**!

Creo un *file* che nomino *ocr.sh* (ma, ovviamente, che potrebbe avere qualsiasi altro nome).

Inserisco nel file il seguente *script*:

```bash
pdftoppm -png document.pdf document 
for i in document-*png; do tesseract "$i" "text-$i" -l ita; done; 
cat text-document* > document.txt
rm document-*
rm text-document-*
```
Le ultime due righe, ovvero: 

```bash
rm document-*
rm text-document-*
```

cancellano automaticamente *file* sparsi generati durante il processo di riconocimento ottico e non più necessari dopo l'accorpamento del testo  in *document.txt*.


Rendo eseguibile il file con `chmod u+x ocr sh`.

Lancio  il comando avendo un documento in PDF denominato "document.pdf" presente nella stessa cartella dell'eseguibile.

**Tutto il procedimento avviene in totale automatismo**: alla fine mi trovo il risultato del riconoscimento ottico nel file *document.txt*.

In altri termini: tutto il procedimento avverrà in sequenza automatica, dalla prima all'ultima formula,  ed, alla fine, troveremo un documento denominato *document.txt* con il riconoscimento ottico estratto dalla sequenza sopra indicata.
 
Se durante il procedimento si verificasse qualche errore, lo *script* verrebbe interrotto con un messaggio identificativo del problema (ad esempio: la mancanza di modulo della lingua), per consentire la correzione del problema.

## E ora: Vim con RegEx

Ed ora possiamo utilizzare le potenzialità di Vim con RegEx per rendere più leggibile e gestibile il risultato grezzo del riconoscimento ottico.

In particolare:

1. Eliminare tutti i ritorni a capo di ogni riga, mantenendo intatte solo le righe bianche.
2. Ridurre tutte le righe bianche ridondanti tra i paragrafi ad una sola.
3. Eliminare i caratteri bianchi ridondanti all'interno del testo.

Le formule in RegEx per ciascuna delle attività sopra indicate sono le seguenti:

1. `:%s/.\+\zs\n\ze./ /`
1. `:g/^\s*$\n^\s*$/d`
1. `:%s/\s\+/ /g`

La prima stringa di ricerca trova sempre una corrispondenza positiva nel documento generato in quanto alla fine di  ogni riga viene sempre aggiunto un ritorno a capo forzato.

Le altre due stringhe di ricerca potrebbero non trovare alcuna corrispondenza positiva nel documento generato ed in questo caso darebbero l'esito "*pattern not found*".

Quanto sopra, si può lanciare in unico comando (il secondo obiettivo!)  comprensivo di tutti quelli precedenti, ([utilizzando lo schema descritto in questa pagina](https://stackoverflow.com/questions/59551215/multiple-vim-regex-command-in-one-line)):

```bash
:%s/.\+\zs\n\ze./ / | :g/^\s*$\n^\s*$/d | :%s/\s\+/ /g
```

Attenzione: in questo caso lo *script* verrebbe interrotto se la seconda o la terza (come sopra anticipato) stringa di  ricerca  non trovasse corripondenza, ovvero, rispettivamente,  se nel documento non vi fossero righe o spazi ridondanti.

A questo punto, se l'interruzione avvenisse alla seconda stringa, si potrebbe valutare, all'occorrenza,  di lanciare a parte il terzo *script* per ripulire gli spazi interni del documento.

## In conclusione

A questo punto abbiamo raggiunto gli obiettivi dichiarati, ovvero ottenere un sistema di riconoscimento ottico in GNU/Linux ad alta qualità, gestito a linea di comando con un unico comando per la fase di riconoscimento ottico ed un unica funzione *RegEx* in Vim per la formattazione del risultato.

Grazie per l'attenzione.
