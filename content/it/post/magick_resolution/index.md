---
title: "Riflessioni su ImageMagick e riduzione delle immagini jpg e png mantenendo la definizione"
date: 2026-09-20
slug:  magick-resolution
categories:
  - Blog
tags:
  - ImageMagick
image:
  placement: 3
  preview_only: false 
  caption: 'Risoluzione di Magick'
canonicalUrl: https://francopasut.blogspot.com/2026/09/riflessioni-su-imagemagick-e-riduzione.html 
---

- [1. Premessa sull'utilizzo di magick e convert in GNU/Linux](#1-premessa-sullutilizzo-di-magick-e-convert-in-gnulinux)
- [2. Verifica della versione e test di funzionamento](#2-verifica-della-versione-e-test-di-funzionamento)
- [3. Il comando di base per la riduzione di un'immagine](#3-il-comando-di-base-per-la-riduzione-di-unimmagine)
- [4. Il problema delle immagini in formato JPG](#4-il-problema-delle-immagini-in-formato-jpg)
- [5. Elaborazione delle immagini in formato .png](#5-elaborazione-delle-immagini-in-formato-png)


# 1. Premessa sull'utilizzo di magick e convert in GNU/Linux

**ImageMagick** è un ottimo software *open source* per creare e modificare immagini *bitmap*.

Nelle versioni più recenti di **ImageMagick** la sintassi dei comandi ha subito un'importante variazione tra la versione 6 e la versione 7:

-   **ImageMagick 6 (legacy):** Il comando principale per le operazioni sulle immagini è `convert`.
-   **ImageMagick 7 (attuale):** Il comando principale è diventato `magick`.

Al 3/9/2026 l'ultima versione è la n. 7.1.2-31.

Sui sistemi con ImageMagick 7, l'uso del vecchio comando `convert` avvia un alias (o wrapper) di retrocompatibilità verso `magick convert`.

<div class="WARNING" id="orgb591110">
<p>
<b>Attenzione alla compatibilità delle distribuzioni Linux:</b>
Non tutte le distribuzioni aggiornano ImageMagick alla versione 7. Ad esempio, nei repository ufficiali delle LTS di Ubuntu (comprese 22.04 LTS e 24.04 LTS), Canonical mantiene il ramo 6.x per garantire la stabilità con vari pacchetti di sistema.
</p>

</div>

Per sapere in anteprima quale versione debba essere utilizzata nel vostro PC è possibile effettuare molto facilmente la verifica della versione.


# 2. Verifica della versione e test di funzionamento

1.  **Verifica della versione installata**

Eseguire il comando nel terminale per verificare quale ramo è presente:

    magick -version

*Nota: se la shell restituisce "command not found", si può provare con `convert -version`.*

1.  **Verifica dell'esito**

Controllare la prima riga dell'output nel terminale:

-   Se compare **Version: ImageMagick 7.x.x**, il sistema supporta il comando `magick`.
-   Se compare **Version: ImageMagick 6.x.x**, occorre utilizzare la sintassi legacy `convert`.

Quindi,  per eseguire i comandi nelle distribuzioni che utilizzando ancora la versione 6 occorre utilizzare il comando `convert` al posto di `magick`.

In questo articolo utilizzerò la sintassi di **ImageMagick 7** (`magick`).


# 3. Il comando di base per la riduzione di un'immagine

La struttura del comando base di ImageMagick per ridurre un'immagine è molto semplice:

-   Si digita nel terminale di Linux il comando `magick`.
-   Si digita il nome dell'immagine in input.
-   Si inserisce l'opzione `-resize`.
-   Si inserisce la quantificazione della riduzione.
-   Si inserisce il nome dell'immagine in output.

Ad esempio: nel seguente comando un'immagine denominata "image.png" viene ridimensionata del 50% e salvata con il nome "image<sub>converted.png</sub>".

`magick image.png -resize 50% image_converted.png`

La conversione viene effettivamente realizzata ma con evidente perdita di dettagli.

Quello che segue è un *collage* di un particolare ingrandito della stessa immagine ridimensionata con il comando sopra riportato, prima con le dimensioni di 1408\*768 pixel e, poi, 704\*384 pixel, metà del precedente:

![img](./collage-5-9-26.png)

Si vede chiaramente che l'immagine con risoluzione dimezzata è più sfumata dall'originale, tanto da rendere impossibile la lettura dei caratteri di testo.


# 4. Il problema delle immagini in formato JPG

Ho provato a ridurre  le dimensioni di un’immagine JPG e mi sono ritrovato con un file di output più grande dell'originale.

Come è possibile?

Tale risultato è legato alla natura del formato JPEG e al modo in cui i software di elaborazione immagini gestiscono i file compressi.

Il formato JPEG/JPG nasce come algoritmo di compressione di tipo *lossy* (ovvero con perdita di informazione).

Per ridurre lo spazio occupato su disco, l'algoritmo sfrutta i limiti della percezione visiva umana: scarta i dettagli e le sfumature di colore che il nostro occhio fatica a distinguere.

Questo significa che un file JPG è già il risultato di un compromesso: ha già perso una parte della sua informazione cromatica originale per rimanere leggero.

Quando  ImageMagick elabora una JPG, non agisce direttamente sul file compresso.

Il flusso di lavoro segue tre passaggi obbligati:

-   Decompressione: il programma apre la JPG e la "scongela" in memoria RAM in un formato non compresso.
-   Elaborazione: applica i parametri specificati (ridimensionamento, cambio di qualità, filtri).
-   Ricompressione da zero: il software codifica di nuovo l'immagine per salvarla sul disco.

Durante il terzo passaggio, se i parametri di qualità specificati nell'algoritmo di ricompressione sono più elevati rispetto a quelli usati dal file originale, ImageMagick tenterà di codificare l'immagine salvando più dettagli di quanti il file di partenza ne contenga realmente.

Il risultato finale può, dunque,  essere più pesante, senza alcun guadagno in termini di qualità visiva.

Pertanto: non consiglio operazioni di rielaborazione delle dimensioni senza perdita di risoluzione con immagini in formato jpeg.


# 5. Elaborazione delle immagini in formato .png

Il formato PNG è *lossless* (senza perdita di dati): non utilizza un semplice cursore di qualità percentuale come il JPG.

Per ridurre il peso di un file PNG mantenendo inalterata la risoluzione (pixel) e la nitidezza, ho provato due soluzioni.

Innanzitutto sono intervenuto sui seguenti parametri:

-   `strip`, rimuove metadati EXIF, profili colore ICC sovrabbondanti e informazioni di creazione.
-   `quality 95` nei PNG di ImageMagick la prima cifra (9) imposta il livello di compressione zlib da 0 a 9 (dove 9 è il massimo);

la seconda cifra (5) imposta il tipo di filtro di compressione adattivo (5 = filtro Paeth).

Ecco lo schema completo del comando:

`magick input.png -strip -quality 95 output.png`

Questa combinazione ottiene il minimo peso possibile senza toccare i dati grafici.

In questo caso si mantiene la qualità *lossless* ma la riduzione della dimensione è molto contenuta: nel mio caso del 19,23%.

Poi ho provato una soluzione più drastica: ridurre la tavolozza dei colori.

Convertendo l'immagine al formato PNG8 (con una tavolozza di massimo 256 colori), il file passa da 24/32 bit a 8 bit per pixel.

Se il PNG contiene illustrazioni, screenshot di software, testi o icone (e non fotografie complesse con sfumature infinite), questa strategia può ridurre il peso  fino all'80%.

Su grafiche e interfacce web la differenza sarà impercettibile, e la dimensione del file crollerà drasticamente.

La formula è la seguente:

`magick input.png -strip -colors 256 png8:output.png`

Con quest'ultima soluzione ho ottenuto una riduzione del 77,66% dall'originale, senza una significativa perdita di dettagli:

![img](./comparazione_immagini_13-9-2026.jpg)

Grazie per l'attenzione.

