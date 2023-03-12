---
title: "A proposito di LaTeX, standalone, PDF e PNG"
date: 2023-03-11
slug:  latex-standalone-pdf-png
categories:
  - Blog
tags:
  - LaTeX
image:
  placement: 3
  preview_only: false 
  caption: 'Immagine e documento'
---

{{% toc %}}

## LaTeX ed il formato dei documenti


Come, ovviamente, già tutti sapete (:smiley:), [LaTeX](https://www.latex-project.org/get/) è un linguaggio dedicato alla composizione tipografica dei documenti con qualità allo stato dell'arte. 

È, quindi, inutile osservare che le basi di LaTeX possono essere apprese in circa 30 minuti, come illustrato in [questa pagina](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes).

Per le finalità di questo articolo è sufficiente rammentare che i sorgenti in LaTeX sono composti da una parte preliminare, detta anche *preambolo*, e dal documento vero e proprio con i contenuti effettivi.

Il formato dei documenti generati da *LaTeX* è definito all'inizio del preambolo con il comando `\documentclass`.

Le classi (probabilmente) più utilizzate, come *article*, *report*  e *book*, producono documenti in formati con dimensioni prestabilite,  precisate mediante specifiche opzioni, come A4 (opzione *a4paper*),  A5 (opzione *a5paper*) o letter (opzione *letterpaper*).

Tuttavia *LaTeX* può anche generare immagini e le dimensioni delle immagini sono, di solito, diverse da quelle dei documenti.

*LaTeX* offre una classe del comando `\documentclass` che determina un  formato non prestabilito ma,  dipendente dalle dimensioni delle immagini.

Questo formato  di dimensione "variabile dipendente"  si ottiene con la classe [standalone](https://texdoc.org/serve/standalone.pdf/0).

[In questo paragrafo,](#esportazione-di-immagini-da-pdf-a-png) trovate un esempio completo di codice per la generazione di un'immagine in LaTeX.

Il formato generato è, in ogni caso, sempre un PDF.

Tuttavia per condividere l'immagine in un blog o in un social network, occorrerebbe convertire il PDF in un *formato immagine* vero e proprio,  come PNG o JPG.

Le indicazioni che seguono  si riferiscono all'esportazione nel formato PNG ma possono essere adattate    al formato JGP  modificando  il relativo formato di *output* nei vari passaggi.

## Esportazione  di documenti da PDF a  PNG

Le indicazioni di questo paragrafo si riferiscono ad ogni documento con PDF nativo, anche se non generato da *LaTeX*.

L'esportazione di un PDF a piena pagina  in un corrispondente formato di immagine potrebbe essere utile  se fosse necessario mostrare documenti completi, compresi gli spazi bianchi intorno al testo scritto, come in [questo mio articolo](https://francopasut.netlify.app/it/post/tex_to_docx/). 


Se, invece, volessimo limitare l'esportazione alla sola parte scritta del documento,  allora occorrerebbe *tagliare* gli spazi bianchi nel documento in  PDF prima di esportarlo in un'immagine.

Per avere un ritaglio effettivo, è anche necessario  verificare che non  vi siano  nel documento altri particolari "sparsi", come ad esempio la numerazione della pagine. 

Per  *ritagliare* il documento PDF alla sola parte scritta si usa il comando `pdfcrop document.pdf`.

Il comando genera un nuovo documento in PDF con il nome originario e l'aggiunta "*-crop.pdf*".

In entrambi i casi, ovvero sia nel caso di documento intero che di documento ritagliato, si può ottenere il risultato applicando il comando di [ImageMagick](https://imagemagick.org/) seguente: 

```bash
magick -density 300 file.pdf file.png
```

Nel caso in cui si vedano artefatti nell'immagine ottenuta dalla conversione,  si può provare ad aumentare  la densità  da 300 a 600.

In [questo paragrafo](#esempi) trovate esempi per ciascuna versione di esportazione.


## Esportazione di immagini da PDF a PNG

Le stesse indicazioni del precedente paragrafo si applicano nel caso di operazioni effettuate su immagini in PDF.

Ho, tuttavia, già anticipato [in questo paragrafo](#latex-ed-il-formato-dei-documenti) che in LaTeX è possibile ottenere immagini in PDF già ritagliate mediante la classe `standalone`.

A titolo di esempio, riporto il codice tratto da [questa pagina](https://tikz.net/owl/) corrispondente ad  un'immagine in *LaTeX*. 

```latex
\documentclass[tikz]{standalone}
\begin{document}
\begin{tikzpicture}
\fill [white] (-1,-0.) rectangle (4.7, 5.7);
\fill [fill=red!90!black] (0,0) to [out=120, in=250] (-0.2,4.2) -- (-0.5,5) -- (-0.3,5.2) -- (1.8,4.5)
  -- (3.7,5.2) to [out=-70, in=70] (3.9,0) -- (3.2,0.5) to [out=200, in=-20] (0.6,0.5) -- cycle;
\draw [cyan!80, fill=white, line width=8pt] (0.75,3.65) circle [radius=1.3];
\draw [cyan!80, fill=white, line width=8pt] (3.25,3.7) circle [radius=1];

\fill [black] (1.05,3.5) circle [radius=0.45];
\fill [black] (2.9,3.65) circle [radius=0.3];

\fill [white] (1.25,3.5) circle [radius=0.15];
\fill [white] (3.05,3.6) circle [radius=0.12];

\fill [yellow!80!orange] (1.85,3.2) -- (2.35,3.2) -- (2.1,2.6) -- cycle;
\end{tikzpicture}
\end{document}
```


L'efficacia del comando `pdfcrop`, descritto al paragrafo precedente,  è, tuttavia,  leggermente maggiore rispetto alla generazione del PDF ottenuta tramite la classe `standalone` di LaTeX.

Nel paragrafo seguente trovate, dopo gli esempi già menzionati nel paragrafo precedente,   anche quelli relativi all'esportazione di immagini, prima "ritagliate" con la classe `standalone` e, poi, con il comando `pdfcrop`.

## Esempi

L'immagine seguente è convertita da un PDF generato da LaTeX con la classe "article":

![document full](document_full_image.jpg)

Da notare gli evidenti spazi bianchi intorno al testo.

L'immagine seguente è, invece, convertita dallo stesso PDF con gli spazi ritagliati in automatico utilizzando il comando `pdfcrop document.pdf`:

![document crop](document_crop_image.jpg)

Il comando `pdfcrop` ha scontornato i margini bianchi,  lasciando soltanto la parte effettivamente scritta.

L'immagine che segue è, invece, riferita all'immagine sopra descritta, tratta dal PDF generato in LaTeX con la classe "standalone":

![owl.png](owl.png)

In questo caso,  la striscia bianca intorno all'immagine è molto ridotta ma non del tutto ritagliata.

L'ultima immagine è, invece, conseguente all'applicazione del comando `pdfcrop` al PDF precedente:

![owl-crop.png](owl-crop.png)

Ora,  l'immagine è aderente al bordo.

Grazie per l'attenzione.
