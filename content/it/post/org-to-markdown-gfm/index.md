---
title: "Conversione da  Org-Mode a Markdown GFM"
date: 2022-12-20
slug:  org-to-markdown-gfm
categories:
  - Blog
tags:
  - Org-Mode
  - Markdown
  - Emacs
image:
  placement: 3
  preview_only: false 
  caption: 'Org-Mode to Markdown'
---



## Che senso ha parlare di Org-Mode al posto di Markdown?

Per quale motivo dovrei usare Org-Mode per scrivere gli articoli da
pubblicare rete in formato Markdown?

Non sarebbe più comodo scrivere gli articoli direttamente in Markdown?

La domanda è più che giustificata e la risposta non è scontata.

Innanzitutto ricordo che Org-Mode è una modalità di GNU/Emacs. Pur
essendovi vari plugin per altri editor, Vim compreso, nessuno di essi
riesce ad eguagliare la straordinaria efficienza del sistema originale.

Quindi: per scrivere in Org-Mode è meglio utilizzare GNU/Emacs.

Org-Mode è un sistema di scrittura strutturato completo ed estremamente
potente, anche se la curva di apprendimento è decisamente in salita.

È una risorsa molto indicata per chiunque debba scrivere documenti
complessi, come ad esempio atti legali, pubblicazioni scientifiche,
romanzi.

Markdown è un linguaggio con una sintassi in formato testo molto più
semplice ed immediata da imparare.

Tuttavia, alcuni CMS attuali accettano direttamente il formato Markdown
senza bisogno di alcuna conversione. Non mi risulta, invece, che sia
possibile pubblicare direttamente in formato Org-Mode.

Org-Mode (ovviamente in Emacs) ha una dotazione molto ampia di comandi
di movimento, spostamento, cancellazione di capitoli, gestione delle
immagini ed è, quindi, estremamente utile nella fase creativa e
costruttiva degli scritti.

In sintesi: Org-Mode è un sistema di scrittura molto potente, veloce ed
efficace per tutti coloro che scrivono documenti complessi per
professione o per passione.

Ma prima o poi, sarà necessario convertire il materiale da Org-Mode ad
un altro formato per la stampa (LaTeX) o per la pubblicazione in rete
(Markdown o HTML) (o per entrambi).

## I problemi di esportazione

Org-Mode ha ottime e velocissime funzionalità di esportazione
incorporate con una miriade di opzioni e configurazioni verso vari
formati tra cui LaTeX, HTML, e lo stesso Markdown.

Il risultato dell'esportazione è eccellente per LaTeX, HTML e per il
Markdown di base.

Tuttavia il Markdown di base è privo di alcune caratteristiche
sintattiche rispetto al dialetto GFM (ovvero "GitHub Flavored
Markdown").

Ad esempio, come ho potuto direttamente constatare nel corso della
preparazione di un mio articolo, l'esportazione interna di Org-Mode
produce tabelle in formato HTML (ovvero con i tipici *tag* \<table\>,
\<tr\> e \<td\>) al posto del codice di marcatura dedicato alle tabelle
di Markdown GFM.

Utilizzando Pandoc con la configurazione standard (tipo
"`Pandoc input_file -o output_file`") il risultato è migliore ma ancora
insufficiente, come vedremo negli esempi qui di seguito.

## Alcuni esempi per chiarire meglio

Riporto alcuni esempi di esportazione tratti dalla versione in Org-Mode
di [questo mio
articolo](https://francopasut.netlify.app/it/post/vim_vimtex_surround/).

La tabella che segue è la versione testuale "sorgente" in Org-Mode:

``` shell
| Funzione                      | Tastiera |
|-------------------------------+----------|
|                               |   <c>    |
| Elimina comando circostante   |  =dsc=   |
| Elimina ambiente circostante  |  =dse=   |
| Modifica comando circostante  |  =csc=   |
| Modifica ambiente circostante |  =cse=   |
```

Questo è il risultato dell'esportazione tramite funzione integrata di
Org-Mode:

``` html
<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-center" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Funzione</th>
<th scope="col" class="org-center">Tastiera</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">Elimina comando circostante</td>
<td class="org-center"><code>dsc</code></td>
</tr>


<tr>
<td class="org-left">Elimina ambiente circostante</td>
<td class="org-center"><code>dse</code></td>
</tr>


<tr>
<td class="org-left">Modifica comando circostante</td>
<td class="org-center"><code>csc</code></td>
</tr>


<tr>
<td class="org-left">Modifica ambiente circostante</td>
<td class="org-center"><code>cse</code></td>
</tr>
</tbody>
</table>
```

Il codice è HTML puro e non Markdown.

Questo è, invece, il risultato dell'esportazione con Pandoc con la
seguente formula:

``` shell
pandoc -s nomefile.org -o nomefile.md
```

``` markdown
Funzione                             Tastiera
------------------------------- ------------------
Elimina comando circostante      `dsc`{.verbatim}
Elimina ambiente circostante     `dse`{.verbatim}
Modifica comando circostante     `csc`{.verbatim}
Modifica ambiente circostante    `cse`{.verbatim}
```

Il codice sembra essere corretto ma il risultato su browser è molto
diverso da quello desiderato:

``` shell
  Funzione Tastiera

Elimina comando circostante dsc{.verbatim} Elimina ambiente circostante dse{.verbatim} Modifica comando circostante csc{.verbatim} Modifica ambiente circostante cse{.verbatim}
```

## La soluzione: esportazione da Org-Mode a Markdown tramite Pandoc con opzione GFM

La soluzione è quella di convertire da Org-Mode in Markdown utilizzando
Pandoc ma aggiungendo l'opzione GFM per avere il codice "arrichito"
rispetto alla versione di base.

Questo è il modello, [trovato, dopo lunghe ricerche, su questa
pagina](https://eengstrom.github.io/musings/convert-org-mode-to-markdown):

``` shell
pandoc --from=org --to=gfm org-mode-file.org > markdown.md
```

dove, naturalmente, i nomi di documenti *org-mode-file.org* e
*markdown.md* devono essere sostituiti con quelli reali.

Da notare l'opzione "`--to=gfm`" che determina l'output nel formato di
Markdown GitHub.

Applicando tale modello al codice indicato nel paragrafo precedente si
ottiene il seguente codice convertito:

``` markdown
| Funzione                      | Tastiera |
|-------------------------------|:--------:|
| Elimina comando circostante   |  `dsc`   |
| Elimina ambiente circostante  |  `dse`   |
| Modifica comando circostante  |  `csc`   |
| Modifica ambiente circostante |  `cse`   |
```

In questo modo, si ottiene un codice Markdown perfettamente formattato
anche per le parti non previste nella versione base.

Da notare, oltre alla tabella completa di ogni carattere, anche la
"centratura" della seconda colonna.

Quindi, è possibile creare gli scritti sfruttando le infinite
potenzialità di Org-Mode e, poi, esportando in HTML o Markdown (o LaTeX)
perfettamente formattati per la fase di pubblicazione.

## Il caso particolare dell'esportazione dei blocchi di codice

Durante le prove su questo argomento ho trovato una particolarità
nell'esportazione del codice sorgente (tag `src`).

Il semplice utilizzo della combinazione "`begin_src ... end_src`"
fornisce un risultato in Markdown come se fosse il formato "quote",
ovvero con quattro spaziature di rientro (che equivale al prefisso "`>`"
prima di ogni riga).

Nella esportazione tramite Pandoc si ottiene lo stesso risultato SOLO se
non viene precisato il linguaggio del frammento.

Se, invece, viene precisato il linguaggio (ad esempio:
"`#+begin_src markdown`") l'esportazione viene correttamente formattata
come blocco di codice con lo stesso linguaggio specificato in Markdown.

I nomi dei linguaggi consentiti da Org e da Markdown non sono, tuttavia,
coincidenti.

Questo, però, non preclude la corretta formattazione del codice in fase
di esportazione ma solo la visualizzazione colorata del contenuto: se il
linguaggio indicato in Org-Mode non fosse previsto in Markdown si
otterrebbe semplicemente un frammento non colorato ma, in ogni caso,
correttamente esportato come "blocco di codice" e non come "blocco di
citazione".

Grazie per la vostra attenzione.
