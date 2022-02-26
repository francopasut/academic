---
title: "Vim: copiare il testo direttamente al blocco appunti del sistema operativo"
date: 2022-02-26
slug: vim_direct_clipboard
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: true
  caption: 'Vim'
---

{{% toc %}}

## Tagliare e copiare in Vim: introduzione

Per l'introduzione all'argomento riguardante le funzioni di Taglia, Copia e Incolla in Vim potete leggere [un mio precedente articolo](https://francopasut.netlify.app/it/post/vim_cut_copy_paste_clipboard/). 

L'oggetto dell'attuale articolo è costituito, invece,  da una fuzionalità di Vim che ho scoperto leggendo [questa pagina](https://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard#11489440) e che è strettamente collegata all'argomento precedente.

Vim può indirizzare direttamente le operazioni di taglia e copia effettuate sui testi al registro della memoria di sistema (*clipboard*).

Non è, quindi, necessario selezionare prima il testo,  per copiarlo nella clipobard, come invece avviene in altri sistemi di scrittura su dispositivi digitali.

In breve:  occorre semplicemente *reindirizzare* l'operazione (la stessa normalmente utilizzata per il comando specifico) alla memoria del sistema operativo (*clipboard*)  (ovvero, per essere più precisi al registro `+`).

Questa funzionalità consente di risparmiare tempo nelle operazioni di scambio dei dati da Vim alle altre applicazioni presenti nel sistema operativo.

## Vim: esempi di invio diretto alla memoria di sistema (*clipboard*) 

Un po' di esempi possono chiarire il concetto.

- Primo esempio: per copiare nella memoria del sistema  operativo un paragrafo completo  basta utilizzare il comando `"+yy`. 
	- Spiegazione dell'esempio: registra (`"`) nella memoria di sistema (`+`) una copia dell'intero paragrafo (`yy`, *yank yank*) in cui si trova il cursore.
- Altro esempio: data  la seguente stringa (comprese le virgolette) *"Lorem ipsum dolor sit amet"* vorrei estrarre  e mandare alla memoria di sistema la parte di testo interna alle virgolette.
	- La soluzione è `"+yi"` con la seguente spiegazione: registra (`"`) nella memoria di sistema (`+`) una copia del testo (`y` *yank*) all'interno (`i`) delle virgolette (`"`).
	- La soluzione, invece,  per ricomprendere anche le virgolette nella copia è `"+ya"` che significa:  registra (`"`) nella memoria di sistema (`+`) una copia del testo (`y` *yank*) intorno (`a` *around*) alle virgolette (`"`), comprese le virgolette medesime.

Attenzione alla doppia presenza di virgolette sia all'inizio che alla fine della stringa: hanno una  funzione totalmente distinta tra loro.

Le prime virgolette sono il "grilletto" che attiva i registri di memoria; le seconde virgolette, invece, sono il delimitatore dell'area copiata nel registro (abbiamo chiesto, rammento, di copiare tutto il testo delimitato tra due virgolette).

- Esempio derivato: stessa stringa ma delimitata da due parentesi tonde *(Lorem ipsum dolor sit amet)*.
	- Soluzione `"+yi)` ovvero: registra (`"`) nella memoria di sistema (`+`) una copia del testo (`y` *yank*) all'interno (`i`) delle parentesi tonde (`)`).
	- Soluzione per copiare anche le parentesi `"+ya)` ovvero:  registra (`"`) nella memoria di sistema (`+`) una copia del testo (`y` *yank*) intorno (`a` *around*) alle parentesi tonde (`)`).

In base agli esempi precedenti è possibile continuare all'infinito:

- Per copiare due parole nella *clipboard* si usa `"+y2w` ovvero:  registra (`"`) nella memoria di sistema (`+`) una copia del testo (`y` *yank*) di due parole (`2w` *two words*). A proposito, per copiare le stesse due parole nel normale registro di Vim si userebbe: `y2w`.
- Per copiare un frammento testo dalla posizione del cursore fino al prossimo punto (se esistente nella frase,  ovviamente) `"+yt.` ovvero:  registra (`"`) nella memoria di sistema (`+`) una copia del testo (`y` *yank*) fino (`t`*till*) al punto (`.`).
- Per copiare una frase (*sentenza*,  nella terminologia tecnica di Vim) all'interno di un periodo si può collocare il cursore in qualunque punto all'interno della frase e digitare `"+yis`, ovvero:  registra (`"`) nella memoria di sistema (`+`) una copia del testo (`y` *yank*) all'interno (`i`) della frase (`s` come *sentenza*).

E così via...

## Epilogo

In definitiva: è tutte estremamente *logico ed efficiente*,  in tipico "*Vim style*".

Vim è impegnativo per la mente e la memoria ma il vantaggio in termini di velocità ed efficienza di scrittura ripaga ampiamente ogni sforzo di apprendimento, oltre che essere un ottimo allenamento per la memoria.

Grazie per la vostra attenzione.
