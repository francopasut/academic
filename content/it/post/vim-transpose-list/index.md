---
title: "Vim: studio sulla trasposizione di elenchi di nomi da orizzontali a verticali"
date: 2022-09-24
slug: vim_transpose_list
categories:
  - Editors
tags:
  - Vim
  - RegEx
image:
  placement: 3
  preview_only: false 
  caption: 'Vim Is Magic'
---

{{% toc %}}

## Obiettivo primario dello  studio

- **Stato iniziale**: serie di nomi in linea, separati da un punto e virgola seguito da uno spazio.
- **Obiettivo**: trasporre tutti i nomi in una colonna eliminando sia punti e virgola che gli spazi.
- **Finalità**: Creazione di elenco per *mail-merging* con client  di posta elettronica (*Thunderbird*).
- **Strumenti**: Vim e funzione RegEx incorporata.
- **Esempio**: 

<p style="text-align: center; font-weight: bold;">
Da:
</p>

<pre>
One@mail; Two@mail; Three@mail; ...
</pre>

<p style="text-align: center; font-weight: bold;">
A:
</p>

<pre>
One@mail
Two@mail
Three@mail
...
</pre>
## Obiettivo secondario

Provare l'integrazione tra Markdown e tag css.

Questo obiettivo è stato realizzato nell'Esempio sopra riportato mediante inserimento del seguente codice:

```html

<p style="text-align: center; font-weight: bold;">
Da:
</p>

<pre>
One@mail; Two@mail; Three@mail; ...
</pre>

<p style="text-align: center; font-weight: bold;">
A:
</p>

<pre>
One@mail
Two@mail
Three@mail
...
</pre>
```


## Vim: espressione regolare per l'obiettivo primario

Per ottenere la trasposizione da orizzontale a verticale, oggetto dell'obiettivo primario, si usa la seguente formula:

```bash
:%s/; /\r/g
```


Analisi della formula:

- `:%s`: attivazione della modalità di sostituzione in tutto il documento
- `/; /`: ricerca della stringa da sostituire, notare lo spazio dopo il punto e virgola che corrisponde alla struttura originaria dell'elenco.
- `\r/`: sostituzione della stringa trovata con il comando precedente con un ritorno a capo.
- `g`: opzione *global*, ovvero applicazione del risultato a tutte le istanze trovate.

## Ed ora: il procedimento inverso

A questo punto provo anche il procedimento inverso: dall'elenco verticale a quello orizzontale delimitato da punto e virgola seguito da uno spazio vuoto.

In pratica da

<pre>
One@mail
Two@mail
Three@mail
...
</pre>
 
 a

<pre>
One@mail; Two@mail; Three@mail; ...
</pre>

La stessa formula sopra indicata può essere utilizzata con fattori invertiti:

```bash
%s/\n/; /g
```

dove con `\n` seleziono i ritorni a capo e con `/; /g` li sostituisco con un punto e virgola ed uno spazio.

Grazie per l'attenzione.


