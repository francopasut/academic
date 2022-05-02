---
title: "Documenti di testo: da PDF ad immagini vettoriali"
date: 2022-05-02
slug: from_pdf_to_svg
categories:
  - Documenti
tags:
  - PDF
image:
  placement: 3
  preview_only: true
  caption: 'Da  PDF a SVG'
---

{{% toc %}}

## Oggetto di questo articolo

Recentemente ho avuto necessità di convertire alcuni documenti in formato PDF,  contenti testo generato da LaTeX in sistemi operativi GNU/Linux, in immagini vettoriali.

Evitando la conversione da servizi online, ho trovato sostanzialmente tre soluzioni interessanti: due a linea di comando (_pdf2svg_ e _pdftocairo_) ed una, famosissima, di tipo grafico (_inkscape_).

In questo articolo riporto la mie valutazioni evidenziando alcune differenze derivante dalla  fonte dei documenti in PDF e dal comportamento di  tre distribuzioni Linux.

Alcuni riferimenti interessanti sull'argomento: 
- [Exporting .png or .jpg files directly from LaTeX code. Possible?](https://tex.stackexchange.com/questions/222870/exporting-png-or-jpg-files-directly-from-latex-code-possible)
-  [LaTeX/Export To Other Formats](https://en.wikibooks.org/wiki/LaTeX/Export_To_Other_Formats#Convert_to_image_formats).

## pdf2svg

È un software a linea di comando, semplicissimo da utilizzare, affidabile e veloce.

Questo è lo schema di utilizzo: 

```bash
pdf2svg <in file.pdf> <out file.svg> [<page no>]
```

Come risulta dallo schema di utilizzo, è possibile specificare il numero di pagina da esportare.

Ideale per  operazioni rapide e dirette da PDF a SVG.

Non esporta in altri formati ma se occorre semplicemente esportare un PDF in immagine vettoriale è la soluzione più veloce ed efficace.



Segnalo, in ogni caso, che l'autore del programma sembra non incoraggiare l'utilizzo di questo software.

Nella   [home page di pdf2svg](http://cityinthesky.co.uk/opensource/pdf2svg/) si legge il seguente frammento:

>Note: since this utility was written, the maintainers of Poppler have written a utility that works on the same principle: pdftocairo. I recommend that you use their utility since it is better maintained than mine.

Ovvero:

>Nota: da quando è stata scritta questa utility, i manutentori di Poppler hanno scritto una utility che funziona sullo stesso principio: pdftocairo. Vi raccomando di usare la loro utility poiché è meglio mantenuta della mia.

## pdftocairo

Altro software a linea di comando. Trattasi, in particolare, proprio di quello consigliato dall'autore di _pdf2svg_, come da frammento sopra menzionato.

Fa parte del pacchetto *poppler-utils* e potrebbe già essere stato installato di _default_  nella vostra distribuzione Linux.

Molto ricco di opzioni, con la possibilità di esportare in vari formati e non solo in _.svg_.

Lo schema di utilizzo è il seguente:

```bash
pdftocairo [options] PDF-file [output-file]
```

Ma non è esente da problemi.

In Fedora e Arch Linux l'esportazione di PDF generati (solo) da LaTeX e convertiti verso .svg ha prodotto  **pagine bianche**.

Il problema viene segnalato in rete  da altri utilizzatori,  [come in questo post](https://gitlab.freedesktop.org/poppler/poppler/-/issues/226).

L'esportazione in altri  formati immagine (.jpg e .png) non ha dato, invece, alcun problema.

Come anche nessun problema ho riscontrato esportando  verso .svg  documenti di testo generati da fonti diverse da LaTeX (ad esempio documenti generati da LibreOffice Writer).

In Fedora il problema è scomparso  dopo l'installazione  consigliata in [questa pagina](https://tug.org/pipermail/tex-live/2021-January/046403.html), ovvero:

`$ sudo dnf install perl-File-Copy`

In Arch Linux, invece,  l'installazione del componente non funziona e genera la risposta *"Could not find all required packages"*.

Per tale distribuzione non ho trovato, quindi, alcuna soluzione, anche se sono quasi certo che ne esista una (se qualche lettore avesse risolto questo problema in Arch chiedo di farmelo sapere).

In Linux Ubuntu il problema non si è mai verificato sin dal primo utilizzo.


## Inkscape

Per la gestione delle immagini vettoriali, in genere, _Inkscape_ è il riferimento assoluto.

Il software consente, tra le infinite funzioni, anche di aprire i PDF, scegliendo la  pagina specifica da visualizzare e, addirittura, il metodo di conversione  e di salvare il risultato in formato .svg.

Il vantaggio è  quello di avere immediamente l'immagine vettoriale disponibile per modifiche ed elaborazioni.



Il formato vettoriale (.svg), infatti, consente  di estrarre, spostare, mescolare i frammenti di testo nelle immagini, come se fossero  "post-it" digitali.

## In sintesi

- _pdf2svg_ per operazioni veloci esclusivamente verso il formato .svg.
- _pdftocairo_ per operazioni che coinvolgono anche altri formati immagine.
- _Inkscape_ per esportazione e modifiche contestuali delle immagini vettoriali.

Grazie per la vostra attenzione.
