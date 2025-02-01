---
title: "LaTeX: creare ed usare variabili per risparmiare tempo e ridurre errori di battitura"
date: 2021-09-15
slug: latex_variables
categories:
  - Documenti
tags:
  - LaTeX
image:
  placement: 3
  preview_only: true 
  caption: 'Logo di LaTeX stilizzato'
---




## Variabili e documenti legali

Il mio lavoro consiste nello scrivere documenti legali.

I documenti legali sono pieni di dati e molti di essi devono essere inseriti ripetutamente.

Pensate, ad esempio, ai nomi di persone o di luoghi, date di eventi, ecc.

Occorre un metodo per evitare di ripetere di inserire a mani i dati ricorrenti quando  scrivete i documenti, sia per evitare di perdere tempo che gli errori di battitura. 

Un buon sistema è quello di utilizzare delle "variabili", cioè dei segnaposti che assumono valori diversi a seconda dei documenti in cui sono inseriti.

Quasi ogni sistema digitale di scrittura ha un proprio sistema d igestione delle "variabili".


## LaTeX e le variabili

Io uso [LaTeX](https://www.latex-project.org/) per scrivere i miei documenti legali.

A mio modesto parere, è il miglior sistema per la produzione di documenti tecnici, scientifici e anche legali!

La gestione delle variabili in LaTeX è strettamente correlata alla gestione dei comandi.

Come è possibile creare "nuovi comandi" per espandere il sistea, così è possibile usare lo stesso metodo per creare variabili di testi the potete inserire ovunque nei vostri documenti.

Quindi, la soluzione è utilizzare il comando `newcommand` per creare qualsiasi variabile necessaria.

## Utilizzo di  "newcommand" per creare le vostre variabili

È veramente semplice creare una variabile con `newcommand`, basta rispettare la seguente sintassi:

```latex
\newcommand{\variablename}{content_of_variable}
```

Nella stringa di cui sopra si possono vedere tre parti:

1.  nella prima parte si nota la barra retroversa ed il comando per creare altri comandi: `\newcommand`
2.  nella seconda parte si nota la creazione della  la variabile che, come tutti i comandi di LaTeX, necessita di una barra retroversa prima di essa: `\variablename` 
3.  nella terza parte si assegna il contenuto alla variabile. In questo punto potete inserire testo o numeri che saranno stampati al posto della variabile.

La stringa deve essere inserita nel _preambolo_ del documento in LaTeX.

A questo punto potete scrivere `\variablename` come segnaposto ovunque all'interno dei tag `begin/end{document}` e LaTeX rimpiazzerà automaticamente durante la compilazione il nome della variabile con il contenuto effettivo.

Se avete occorre uno spazio bianco dopo la parola nel documento compilato dovete aggiungere un'altra barra retroversa alla fine del *segnaposto*:  quindi la stringa `\variablename` diventa `\variablename\`.

Ma se il segnaposto termina con un punto o altro segno di interpunzione non bisogna aggiungere la barra retroversa finale.


Grazie per la vostra attenzione.
