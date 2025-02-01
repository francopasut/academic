---
title: "Variabili in documenti LaTeX esportati da Emacs Org Mode"
date: 2022-01-15
slug: variables_orgmode_latex
categories:
  - Editors
tags:
  - Emacs
  - LaTeX
image:
  placement: 3
  preview_only: false 
  caption: 'Org Mode vs Emacs'
---




## La solita introduzione su Emacs, Org Mode e  LaTeX

Questa è la solita introduzione su Emacs, Org Mode e LaTeX: se sapete già tutto potete saltarla.

[Org Mode](https://orgmode.org/) sotto [GNU Emacs](https://www.gnu.org/software/emacs/) è un potente strumento per organizzare idee.

Una funzionalità eccellente di tale strumento è la possibilità di esportare i documenti direttamente da Org Mode verso [LaTeX](https://www.latex-project.org/about/), l'eccellenza assoluta per l'impaginazione,  così come verso altri linguaggi, come Markdown e HTML.

Nell'esportazione verso LaTeX, è possibile inserire comandi nella parte preliminare  del documento in Org Mode, per modificare il risultato dell'eportazione nel documento PDF finale.

Le _variabili_ sono utili comandi che consentono a LaTeX di sostituire automaticamente dei _campi segnaposto_ con nomi, stringhe numeriche od ogni altra combinazione di testo e numeri.

Potete trovare informazioni su questo argomento [nel mio precedente articolo](https://francopasut.netlify.app/it/post/latex_variables/).

Nell'attuale articolo propongo alcune soluzioni  per la generazione di variabili durante l'esportazione di documenti da Org Mode a LaTeX.

In aggiunta, esclusivamente nella versione in italiano, riporto anche alcune impostazioni che consentono di superare alla radice i difetti di traduzione del sommario e di altri elementi (difetti, in ogni caso, già segnalati agli sviluppatori di Org).

## Sezione preliminare essenziale in Org Mode per esportazione a LaTeX con generazione di variabili

Di seguito riporto un semplice preambolo in un documento Org Mode:

```
#+LANGUAGE: it
#+AUTHOR: Franco Pasut
#+TITLE: Titolo del documento
#+LATEX_HEADER: \usepackage[T1]{fontenc}
#+LATEX_HEADER: \usepackage[utf8]{inputenc}
#+LATEX_HEADER: \usepackage[italian]{babel}
#+LATEX_HEADER: \newcommand{\myname}{Franco}
#+LATEX_HEADER: \newcommand{\mysurname}{Pasut}
```

La prima riga imposta la lingua italiana,   la seconda il nome dell'autore e la terza il titolo del documento.

Per quanto concerne la lingua italiana, tuttavia,  ho riscontrato che l'esportazione generata solo dal comando ` #+LANGUAGE: it` non sia completa. 

Ad esempio: l'intestazione  dell'_Indice_ dei vari paragrafi viene indicata come "_Contents_" e le date restano impostate con il formato inglese.

Per avere una corretta esportazione di tutti gli elementi ho provato ad aggiungere anche i comandi di seguito indicati, che sono quelli tradizionalmente utilizzati in LaTeX per la corretta impostazione della lingua italiana.

```
#+LATEX_HEADER: \usepackage[T1]{fontenc}
#+LATEX_HEADER: \usepackage[utf8]{inputenc}
#+LATEX_HEADER: \usepackage[italian]{babel}
```

L'effetto è stato quello desiderato: le impostazioni di lingua nel documento esportato in LaTeX sono risultate complete e corrette!

Ovviamente è possibile aggiungere altre impostazioni preliminari, ma non è questo l'oggetto dell'articolo.

## Le linee dedicate all'esportazione delle variabili

 Sono, invece,  le ultime due linee che vorrei evidenziare.

La riga `#+LATEX_HEADER: \newcommand{\myname}{Franco}` crea una nuova variabile chiamata "myname" che sarà sostituita, nel documento esportato in LaTeX, con  il nome proprio "Franco".

La linea `#+LATEX_HEADER: \newcommand{\mysurname}{Pasut}` crea una nuova variabile chiamata "mysurname" che sarà sostituita, nel documento esportato in LaTeX, con  il nome proprio  "Pasut".

Ora potrete disseminare le variabili  `\myname{}` e `\mysurname{}`,  o qualsiasi altra variabile vorrete creare, nel documento Org Mode per, poi, ottenere la sostituzione automatica nel documento esportato in LaTeX con i nomi impostati, nel caso di specie `Franco` e `Pasut`.

Attenzione a non utilizzare nomi di variabili riservati al sistema Emacs: ve ne accorgereste subito perchè le variabili non sarebbero trasformate correttamente.

Come potete notare sopra, le variabili sono seguite dallo spazio vuoto `{}` che serve per distanziare i nomi generati dalle variabili dalle parole immediatamente successive. 

Se, invece, dopo la variabile fosse presente un segno di interpunzione non occorrerebbe tale aggiunta.

A questo punto, per esportare il documento da  Org Mode verso LaTeX premete  `C-c C-e ll` o, se volete l'apertura automatica del documento esportato nel lettore di PDF, `C-c C-e lo`.

## Perché le variabili?

Ma che senso ha creare variabili al posto dei nomi? Non sarebbe sufficiente scrivere i relativi contenuti direttamente nel documento?

Molto semplice: se nel documento esportato in LaTeX fosse necessario sostituire i nomi generati dalle variabili con altri, sarà sufficiente modificare l'assegnazione di variabile nel preambolo e non correrete il rischio di lasciare qualche "vecchio" nome sparso nel documento.

È una soluzione particolarmente utile se dovete riutilizzare il documento esportato in LaTeX. 

Vi ringrazio per l'attenzione.
