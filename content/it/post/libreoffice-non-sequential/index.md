---
title: "LibreOffice Writer e numerazione non sequenziale delle pagine"
date: 2025-08-02
slug:  libreoffice_non_sequential
categories:
  - Blog
tags:
  - LibreOffice
  - Writer
image:
  placement: 3
  preview_only: false 
  caption: 'Pagine non sequenziali'
canonicalUrl: https://francopasut.blogspot.com/2025/08/libreoffice-writer-e-numerazione-non.html
---


- [1. Oggetto dell'articolo.](#1-oggetto-dellarticolo)
- [2. Come inserire un numero di pagina iniziale diverso da 1.](#2-come-inserire-un-numero-di-pagina-iniziale-diverso-da-1)
- [3. Modificare il numero di pagina contestualmente ad un'interruzione di pagina.](#3-modificare-il-numero-di-pagina-contestualmente-ad-uninterruzione-di-pagina)
- [4. Il denominatore comune.](#4-il-denominatore-comune)


# 1. Oggetto dell'articolo.

LibreOffice è una suite  *open source* multi-piattaforma per l'elaborazione documentale.

Ottima per  scrivere, calcolare, disegnare e molto altro. 

La pagina di riferimento in italiano si trova presso  [questa pagina](https://it.libreoffice.org/).

Writer è il modulo della Suite dedicato alla videoscrittura.

Questo articolo non è un *tutorial* sull'utilizzo del modulo LibreOffice  Writer,  per il quale vi sono numerosissime pagine in rete, ma è focalizzato su una funzionalità specifica che, pur essendo perfettamente  efficiente, a me ha creato qualche difficoltà iniziale: **la numerazione non sequenziale delle pagine**.

Condivido, pertanto, alcune considerazioni che potrebbero essere utili.


# 2. Come inserire un numero di pagina iniziale diverso da 1.

La prima difficoltà si è presentata quando  ho dovuto modificare la numerazione della prima pagina di un documento inserendo  un numero diverso da 1.

Di seguito riporto una parafrasi delle istruzioni originali con l'aggiunta di  una precisazione.

1.  ****Cliccate all'inizio del  documento****,
2.  Andate nel menu in alto, scegliete ****"Formato"**** e poi ****"Paragrafo&#x2026;"****.
3.  Nella finestra che si aprirà cercate  la scheda intitolata ****"Flusso di testo"**** e cliccateci sopra.
4.  La sezione chiamata ****"Interruzioni"**** si presenta disattivata. Per arrivare a modificare il numero della pagina occorre attivare alcune opzioni.
5.  Innanzitutto occorre mettere la  spunta sulla voce  ****"Inserisci"****.
6.  Occorre, poi, mettere un'altra spunta sulla casella denominata  ****"Con stile di pagina"**** e scegliere uno stile (ad esempio "Stile di pagina predefinito").
7.  A questo punto si potrà attivare la casella  ****"Numero di pagina"****  ed inserire un numero  diverso da 1.
8.  Cliccate su ****"OK"****.

Per visualizzare il numero di pagina occorre, ovviamente, utilizzare la voce del menù principale "*Inserisci / Numero di pagina&#x2026;*".

Fatto! Ora il documento inizierà con la numerazione diversa da 1 che avrete  inserito e manterrà la nuova sequenza con le successive pagine.


# 3. Modificare il numero di pagina contestualmente ad un'interruzione di pagina.

Un'altra  difficoltà si è presentata quando ho dovuto creare un'interruzione manuale di pagina con numero non sequenziale.

Per modificare il numero di pagina dopo un'interruzione di pagina non basta utilizzare la voce Inserisci - Interruzione pagina (*Ctrl+Invio*)  del menù in alto.

Tale comando, infatti, aggiunge effettivamente una nuova pagina ma **continua la numerazione dalla pagina precedente**.

In altri termini: se la pagina visualizzata avesse il numero 1, la creazione di una nuova pagina con "Interruzione pagina" (*Ctrl+Invio*) avrebbe come risultato una pagina numerata con il 2.

Per ottenere il risultato di creare una nuova pagina con una numerazione indipendente dalla precedente pagina occorre seguire il diverso procedimento di seguito descritto:

1.  Premere "Inserisci".
2.  Premere, subito dopo, "Altre Interruzioni" seguito da "Interruzione manuale&#x2026;".
3.  Nella finestra che si apre selezionare o lasciare selezionato il *radio button* "Interruzione di pagina".
4.  In grigio, quindi non selezionabile, noterete la scritta "Cambia numero di pagina" associata ad una casella di spunta.
5.  Per attivare la casella di spunta occorre  selezionare la casella  Stile di pagina e scegliere uno stile, ad esempio "Stile di pagina predefinito".
6.  A questo punto è possibile attivare il "check box" per  modificare il numero  della  nuova pagina.

![img](./insert_break_writer_it.png)

Anche in questo caso le successive pagine manterranno la nuova sequenza di numerazione.

La numerazione delle pagine precedenti l'interruzione non verrà modificata.

Per modificare la numerazione della sezione esistente occorre utilizzare la stessa procedura descritta al precedente paragrafo [2](#2-come-inserire-un-numero-di-pagina-iniziale-diverso-da-1).


# 4. Il denominatore comune.

Tra le due operazioni, ovvero quella descritta nel paragrafo [2](#2-come-inserire-un-numero-di-pagina-iniziale-diverso-da-1) e quella descritta nel paragrafo [3](#3-modificare-il-numero-di-pagina-contestualmente-ad-uninterruzione-di-pagina),   esiste un **denominatore comune**:   la necessità di scegliere uno "stile di pagina" prima di attivare le numerazioni desiderate.

LibreOffice Writer ha bisogno di conoscere espressamente lo stile di pagina prima di consentire la modifica del numero della pagina medesima.

Tenendo presente questo denominatore comune è più semplice eseguire a memoria le due diverse operazioni sopra descritte per la modifica dei numeri di pagina.

Grazie per l'attenzione.


