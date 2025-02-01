---
title: "LilyPond: anacrusi, gruppi irregolari, voci multiple"
date: 2021-10-23
slug: lilypond_anacrusis_tuplet
categories:
  - Music
tags:
  - LilyPond
image:
  placement: 3
  preview_only: false 
  caption: 'Scriabin, Sonata op. 19'
---




## Brevissima introduzione

[LilyPond](http://lilypond.org/) è un incredibile e potente linguaggio per scrivere partiture musicali.

Ogni musicista dovrebbe impararlo. Ma la scrittura di codice è più adatta ai programmatori che ai musicisti e occorre effettuare molti tentativi per scrivere partiture complete.

In questo articolo vi mostro   alcuni piccoli frammenti di codice riguardanti *anacrusi,  gruppi irregolari e voci multiple* (Se state leggendo questo articolo sapete di cosa si tratta).

Ecco gli schemi di base per ciascuno di essi in linguaggio LilyPond:

| Musical item  | LilyPond pattern                                                                              |
| ------------- | -------                                                                                       |
| Anacrusi     | `\partial x` seguito da una nota di valore  `x` |
| Gruppi irregolari       | `\tuplet x/y {n1 n2 n3}`: n(1, 2, 3) sono le note con durata totale "x"  al posto di "y"     |
| Voci multiple        | `<< {musical expression 1} \\ {musical expession 2}`, che corrisponde al costrutto con la *doppia barra retroversa* |


## Elementi colorati nella partitura reale

Nell'immagine mostrata all'inizio della pagina potete vedere un frammento di partitura realte, limitato alle prime due battute della  *Sonata per Pianoforte No. 2 op. 19*, Sonate-Fantaisie,  di Alexander Scriabin (Aleksandr Nikolaevič Skrjabin).


I colori identificano gli elementi musicali come da tabella seguente:

| Musical item  | Color            |
| ------------- | -------          |
| Anacrusi     | Rosso              |
| Gruppi irregolari       | Blu             |
| Voci Multiple        | Blu e Magenta |

Ho usato il colore blu per evidenziare sia i gruppi irregolari che la voce esterna (magenta per la voce interna).

## Analisi degli elementi

L'element ***anacrusi***, in questo esempio, è realizzato da due note simultanee cone la stessa durata.

Lo schema per le note contestuali aventi la stessa durata, come ottave o accordi, è il seguente `< ... >`.

Quindi il frammento (privo di indicazioni dinamiche) per la mano destra e sinistra, comprensivo delle note simultanee, è il seguente:


```
right = \relative c'' { \partial 16 < dis,, gis dis' >16 }

left = \relative c' { \partial 16  < gis,,  gis' >16 }
```


I ***gruppi irregolari*** (*terzine*) sono, in questa partitura, un po' più complicate: doppie note (colorata di  blu) e voce interna separata (colorata di magenta).

Ecco il codice per il solo gruppo irregolare, senza la voce interna, tratto dalla prima misura:


```
\tuplet 3/2 {  < gis, gis'>8 < gis gis' > < gis gis' >  }  
```


Adesso il codice per il gruppo irregolare, senza la voce interna, tratto dalla seconda misura:

```
\tuplet 3/2 {  < fisis, fisis'>8 < fisis fisis' > < fisis fisis' >  }  

```
Ora le ***voci multiple***.

Ecco il codice per il gruppo irregolare e la voce interna tratto dalla prima misura:

```
{
<< 
\tuplet 3/2 {  < gis, gis'>8 < gis gis' > < gis gis' >  }  
\\ 
< dis' eis >4 
>>
}
```


Ed infine il codice per il gruppo irregolare e la voce interna tratto dalla seconda misura:

```
{
<< 
\tuplet 3/2 {  < fisis, fisis'>8 < fisis fisis' > < fisis fisis' >  }  
\\ 
dis'4 
>>

}

}
```

Grazie per la vostra attenzione.
