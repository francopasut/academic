---
title: "Affiancare o sovrapporre immagini in GIMP con aggiustamento automatico del Contenitore"
date: 2023-01-26
slug:  gimp_images_collage
categories:
  - Blog
tags:
  - GIMP
image:
  placement: 3
  preview_only: false 
  caption: 'Collage di immagini in GIMP'
---

{{% toc %}}

## Cos'è GIMP?

[GIMP](https://www.gimp.org/) è un ottimo editor di immagini multipiattaforma: Windows, macOS e qualsiasi distribuzione GNU/Linux.

È un software completo, rigorosamente open-source e gratuito.

Perfetto per provare a creare un "collage" di immagini sovrapposte o affiancate, anche con diverse dimensioni, e ad esportare il risultato in unica immagine in formato .jpg o .png.

## Affiancamento e sovrapposizione di immagini

Ho avuto più volte necessità di "mescolare" diverse immagini affiancate o sovrapposte.

I consigli che vengono solitamente riportati in rete per tale operazione in GIMP comportano l'aggiunta a mano dello spazio nel "Contenitore" necessario per l'inserimento delle immagini successive alla prima.

Ad esempio: dopo l'apertura in GIMP di un'immagine di 100x100 px, per affiancarne un'altra di uguale dimensione viene consigliato, di solito, di creare uno spazio aggiuntivo nel Contenitore di altri 100 px a fianco della prima, di aprire l'ulteriore immagine con il comando "*Apri come livelli…*" (comando breve: `ctrl-alt-o`) e di trascinare con il mouse la nuova immagine nello spazio dedicato.

Effettivamente funziona ma, ovviamente, occorre calcolare **manualmente** le dimensioni dell spazio da aggiungere nel *Contenitore*.

Mi sono, dunque, chiesto se GIMP possa fornire una sistema per modificare **automaticamente** le dimensioni del contenitore quando si aggiungono nuove immagini.

La risposta è positiva e in questo articolo spiego come funziona.

È importante tenere presente che le immagini successive alla prima vanno sempre aperte come "*livelli*" (comando breve: `ctrl-alt-o`) in modo da poterle modificare autonomamente rispetto alle altre immagini aperte come livelli, ad esempio scalandole o rendendole trasparenti.

Dopo avere aggiunto la seconda, terza, ... ennesima immagine, le ipotesi possibili sono sostanzialmente due:

* Il Contenitore risulta essere più grande dell'immagine complessiva.
* L'immagine complessiva risulta essere più grande del Contenitore.

Di seguito: come risolvere entrambe le ipotesi.

## Ipotesi di Contenitore più grande dell'immagine complessiva

Nell'immagine seguente trovate un esempio di Contenitore più grande dell'immagine, nella fattispecie costituita dal logo Emacs:

![emacs_on_canvas](canvas_on_emacs.png)

Quindi occorre ridurre il contenitone alle dimensioni dell'immagine.

Per questa operazione si usa la voce di menù `Immagine` e la sottovoce `Ritaglia al contenuto`.

## Ipotesi di immagine complessiva più grande del Contenitore

Nell'immagine seguente trovate un esempio di logo Vim debordante, quindi più grande rispetto al Contenitore in GIMP:

![vim_over_canvas](vim_over_canvas.png)

Questo è, naturalmente, il caso contrario rispetto al precedente.

In questo caso occorre utilizzare la voce di menù `Immagine` e la sottovoce `Imposta la superficie ai livelli` e, se necessario, a seguire subito dopo con `Ritaglia al contenuto` per eliminare la parte eccedente di Contenitore aggiunta dal precedente comando.

In questo caso potrebbe accadere che la **visualizzazione** dell'immagine ecceda il monitor del computer.

Per ridurre la visualizzazione alle dimensioni del monitor si usa la voce `Visualizza`, la sottovoce `Zoom` e l'ulteriore sottovoce `Adatta Immagine alla Finestra` (combinazione veloce: `Maiusc-Ctrl-J`).

## Esportazione del risultato

Alla fine di tutte le aggiunte, elaborazioni e modifiche, si salva il risultato con `File` seguito da `Esporta come...` (combinazione veloce `Maiusc-Ctrl-E`) scegliendo il formato desierato (.png o .jpg).

Sopra il titolo di questo articolo  trovate un dimostrazione di immagine ottenuta   con le seguenti immagini libere:

* Logo Emacs
* Logo Vim
* Logo Freeplane
* Mappa Mentale in Freeplane
* Logo Firefox


Grazie per la vostra attenzione
