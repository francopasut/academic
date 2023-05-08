---
title: "Appunti sulla risoluzione delle differenze tra due documenti con le risorse integrate di Vim ed Emacs"
date: 2023-05-07
slug:  vimdiff-ediff
categories:
  - Blog
tags:
  - Emacs
  - Vim
image:
  placement: 3
  preview_only: true 
  caption: 'Vim and Emacs'
---

{{% toc %}}



## Di cosa parliamo?

In questo articolo, riporto la mia esperienza pratica su come utilizzare le risorse integrate di Vim ed Emacs per risolvere ed annullare le differenze tra due documenti.

Mi è, infatti, capitato di aggiornare due documenti in modo "disordinato" tanto  da non ricordare più quali siano gli aggiornamenti da mantenere sull'uno e sull'altro.

Sia Vim che Emacs offrono strumenti integrati molto semplici ed efficaci per verificare e risolvere tali differenze.

Tutte le operazioni sono state effettuate in ambiente GNU/Linux, in particolare Ubuntu ed Arch.

Nell'articolo non menziono eventuali plugin aggiuntivi che, pure, esistono e non affronto il tema del controllo di versione mediante `git`.

Non vi è alcun giudizio "di merito" sui  due sistemi di scrittura ma soltanto un'esposizione sintetica dei rispettivi metodi.

## I documenti di test. ##

Per le operazioni, ho utilizzato due semplicissimi documenti con un contenuto parzialmente differente tra loro.

- *test1.txt*

> Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
>  <br>
> Aenean massa.
>  <br>
> Cum sociis natoque penatibus et

- *test2.txt*

> Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
>  <br>
> Aenean commodo ligula eget dolor.
>  <br>
> Aenean massa.

## Vim e la funzione "vimdiff".

Il comando `vimdiff` è un'utility che viene installata con  text editor *Vim*.

Il modo più semplice per lanciare l'utility è dalla linea di comando.

Utilizzando i nomi dei due documenti sopra indicati, il comando è il seguente: `$ vimdiff test1.txt test2.txt`.

La funzione, tuttavia, può  essere attivata anche partendo da un documento già aperto (supponiamo *test1.txt*)  con uno dei seguenti comandi:

- `:diffsplit test2.txt` per avere la  divisione orizzonale.
- `:vert diffsplit test2.txt` pe avere la divisione in verticale.

Le differenze tra i documenti in comparazione sono evidenziate con colori diversi, in modo che sia facile individuare gli elementi che non corrispondono, come nell'immagine seguente:

![vim vimdiff](vim_vimdiff-frame.png)

Si possono quindi utilizzare i comandi di Vim per spostarsi tra le diverse sezioni del file, unire le diverse versioni o decidere quale versione mantenere.

I comandi essenziali sono i seguenti:

- `dp`              ovvero `diffput` per riportare la versione in cui si trova il cursore nell'altro documento in comparazione.
- `do`             ovvero `diffget`: ("o" è il mnemonico per  "*obtain*") per riportare la versione dell'altro documento in comparazione in quello in cui si trova il cursore.
- `]c`             per saltare al punto di  differenza successivo.
- `[c`             per saltare al punto di  differenza precedente.

## L'interfaccia di "vimdiff".

La versione di *Vim* a linea di comando non offre alcun aiuto visivo, tipo "menù", sui comandi da utilizzare.

Quindi occorre conoscere i comandi a memoria oppure usare le funzioni di aiuto integrate in Vim con `:help vimdiff`.

Invece *GVim*, ovvero la versione di Vim in modalità grafica, offre un supporto sintetico a menù consistente in:

1. Voce di menù "*File*" - sottovoce "*Split Diff With...*" per attivare il confronto tra un documento già caricato ed uno da caricare.
2. Voce di menù "*Tools*", sottovoce "*Diff*", opzioni "*Update*" / "*Get Block*" (equivalente a `do`) / "*Put Block*", (equivalente a `dp`).

Di seguito le due schermate sopra descritte:

![gvim file diff](gvim_file_diff-frame.png)

![gvim tools diff](gvim_tools_diff-frame.png)

## Emacs e la funzione "ediff".

Emacs, per  confrontare e unire due o più documenti,  ha una funzione integrata denominata *ediff*.

Come per *vimdiff*, le differenze tra i file sono evidenziate con colori diversi per facilitare l'individuazione degli elementi che non corrispondono.

Anche *ediff* offre una serie di strumenti per la gestione dei conflitti, come la possibilità di unire le diverse versioni, decidere quale versione mantenere o anche modificare direttamente il contenuto del file.

## Come si usa *ediff*? 

In pratica:

- Apro Emacs
- lancio `ediff` con `M-x ediff`
- Seguo le indicazioni caricando *test1.txt* come documento *A* e *test2.txt* come documento *B*
- Appare la seguente schermata:

![emacs ediff test](emacs_ediff_test-frame.png)

A questo punto nel "Pannello di Ediff" (vedasi prossimo paragrafo per ulteriori chiarimenti sul Pannello) premo:
- `n` o `p` per saltare alla prossima ("next") o alla precedente ("previous")  differenza
- `a` per applicare la riga del documento A al documento B rendendoli, quindi, uguali oppure
- `b` per applicare la riga del documento B al documento A rendendoli, quindi, uguali.

E così via fino al termine della comparazione.

Arrivati a questo punto basta salvare i documenti e chiudere.


## L'Interfaccia di "ediff".

*Ediff* si basa sulla funzione `diff` presente nei sistemi operativi Unix e derivati.

Nelle varie distribuzioni GNU/Linux ed in macOS la funzione è normalmente preinstallata e, quindi, non pone alcun problema di utilizzo.

In MS Windows, invece, tale funzione non è  presente ed è, quindi, necessario provvedere con separata installazione (non oggetto del presente articolo).

La funzione di *help* di *ediff*, che appare subito dopo il caricamento dei due documenti da comparare,  funge anche da  vero e proprio *pannello di controllo* ("Ediff Control Panel") dal quale vengono svolte le operazioni sui documenti in comparazione.

Si rende necessario utilizzare una finestra esterna ai documenti comparati in quanto Emacs non è modale, come Vim, e, quindi, ogni pressione di tasti direttamente nei documenti comporta la modifica degli stessi.

L'*help* può essere aperto o minimizzato con il tasto `?`.

Ecco le  videate del "Control Panel" e del "Menù" in Emacs:

![ediff help](ediff-help-frame.png)

![ediff menu](ediff-menu-frame.png)

## Tabella di sintesi.

Ecco una semplice tabella di sintesi dei comandi essenziali per i due sistemi di scrittura:

<style>
table {
    border-collapse: collapse;
}
table, th, td {
   border: 1px solid black;
}
blockquote {
    border-left: solid blue;
    padding-left: 10px;
}
</style>

|  Operazione      |    Vim       |  Emacs   	|
| ------------- | :-------------:  | :-------: |
|    Salta al successivo    |    `]c`          | `n`       |
|    Salta al precedente    |    `]c`          | `p`       |
| Esporta modifiche da questo documento all'altro | `dp` | `a`|
| Importa modifiche dall'altro documento a questo | `dg` | `b` | 


Grazie per l'attenzione
