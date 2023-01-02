---
title: "Conversione documenti dal formato .tex di LaTeX al formato .docx di MS Word"
date: 2023-01-02
slug:  tex_to_docx
categories:
  - Blog
tags:
  - LaTeX
  - Pandoc
image:
  placement: 3
  preview_only: false 
  caption: 'LaTeX e MS Word'
---

{{% toc %}}

## Premessa su LaTeX e MS Word

Da circa trent'anni uso LaTeX per scrivere documenti di ogni tipo: atti
giudiziari, relazioni, ricerche, progetti ed altro.

Dopo avere superato la impegnativa curva di apprendimento iniziale,
quindi, è molto improbabile che si torni ai sistemi di videoscrittura
"tradizionali": la straordinaria qualità tipografica ed il notevole
risparmio di tempo sono diventati irrinunciabili.

A volte, tuttavia, occorre scambiare materiale scritto in LaTeX ad amici
e colleghi che non hanno ancora avuto l'opportunità di apprezzarlo.

In questi casi è necessario, quindi, convertire il testo in formato
leggibile software di videoscrittura. Principalmente mi riferisco al
formato *.docx*, tipico di MS Word ma leggibile anche da altri sistemi
analoghi, come ad esempio *LibreOffice Write* che ho utilizzato per
questo articolo.

La procedura di conversione non è univoca e neppure immediata: a volte è
necessario completare il risultato con qualche piccolo intervento.

In questo articolo vi spiego, senza pretesa di completezza, come ho
analizzato e risolto questa esigenza.

## Conversione attraverso *htlatex*

Nella distribuzione *TeXLive* è presente il comando *htlatex*.

La funzione di *htlatex* è quella di convertire il formato *.tex* in
formato *.html*.

L'esportazione è molto semplice, basta digitare sulla linea di comando:
`htlatex file_name.tex`.

Nessuna opzione e nessun nome di file esportato: tutto generato da
*htlatex*.

All'esito della procedura si ottiene una sequenza di documenti: uno di
essi è in formato *.HTML* che può essere direttamente in MS Word e
salvato, poi, in formato *.docx*.

La versione in *.docx* potrebbe andare bene a patto che non vi siano
elenchi numerati (tipici dei capitoli di prova negli atti giudiziari)
che sono affetti da ritorni a capo aggiunti tra il numero progressivo ed
il contenuto.

Occorre, pertanto, modificare ogni capitolo eliminando il ritorno a capo
e ciò potrebbe essere dispendioso in termini di tempo nel caso di atti
complessi magari con numerazioni di primo e secondo livello.

## Conversione attraverso *Pandoc*

Un'alternativa è costituita da *[Pandoc](https://pandoc.org/)*, un
convertitore universale multipiattaforma.

Per la conversione in oggetto si digita la seguente linea di comando:
`pandoc inputfile.tex -o outputfile.docx`.

*Pandoc* è molto efficiente ma a volte occorre aggiungere qualche
piccolo ritocco per completare il lavoro.

In particolare nei documenti strutturati con sezioni, sottosezioni,
elenchi numerati e indici (tipici degli atti giudiziari), ho dovuto
effettuare le seguenti modifiche:

- Inserire la formattazione "giustificata" nel testo base: è sufficiente
  modificare un paragrafo con quel foglio stile ed applicare la modifica
  a tutti gli analoghi paragrafi.

- Modificare la formattazione delle intestazioni di Primo e (se
  presente) Secondo Livello cambiando il colore da blu a nero. Anche in
  questo la modifica di una sola intestazione di primo (e secondo)
  livello può essere estesa a tutte le intestazioni dello stesso
  livello.

- Eliminare alcune aggiunte all'inizio del Documento non necessarie.

- Reinserire (nel caso di documenti complessi), l'indice dei contenuti
  (Table of Contents).

- Sistemare la numerazione dei capitoli di prova e dei documenti
  prodotti. Nel caso di sottonumerazioni occorre applicare la
  numerazione a "struttura" per ottenere la sequenza 1.1, 1.2, 2.1, 2.2,
  ecc.

  Alla fine si ottiene un PDF, esportato in formato compatibile con
  Microsoft Word o LibreOffice Write, con le stesse caratteristiche
  strutturali dell'originale in LaTeX.

## Esempi di esportazioni di documenti

Per rendere più chiara la descrizione riporto quattro esempi.

Nel primo esempio riporto il PDF ottenuto da un documento direttamente
da LaTeX:

![](esempio_latex_it.png)

Nel secondo esempio riporto l'esito della conversione applicando il
comando *htlatex* ed aprendo, poi, il l'HTML con LibreOffice Write:

![](esempio_htlatex_it.png)

Nel terzo esempio riporto l'esito grezzo della conversione da *.tex* a
*.docx* con il comando *Pandoc*:

![](esempio_docx_origin_it.png)

Nel quarto esempio riporto l'esito rielaborato della precedente
conversione:

![](esempio_docx_elaborato_it.png)

Grazie per l'attenzione.
