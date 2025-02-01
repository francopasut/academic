---
title: "Vim Is Magic or Nomagic?"
date: 2022-11-17
slug:  vim_magic_nomagic
categories:
  - Editors
tags:
  - Vim
  - RegEx
image:
  placement: 3
  preview_only: false 
  caption: 'Vim Is Magic?'
---



## Cos'è questo scherzo?

Il titolo è uno scherzo con il nome di "*V.I.M.*" (ho mantenuto il titolo in inglese per non perdere il *gioco di parole*)  ma, allo stesso tempo, è una modalità reale di Vim stesso: la *Modalità Magica* (*Magic Mode*).

Per capire cos'è il *Magic Mode*, la fonte primaria è la voce `:help magic` di Vim.

In poche parole:
- La *Modalità magica* si riferisce alle *espressioni regolari*.
- La modalità *magica* è abilitata per impostazione predefinita in Vim.
- È possibile invocare esplicitamente la *Modalità magica* con il comando `\m` nell'area di ricerca delle *Espressioni Regolari*.
- Per disattivarla è necessario impostare `\M` (*m* maiuscola) nell'area di ricerca.
- Quando si usa il comando `\M` si richiama la *Modalità Non magica*.
- La modalità *Non magica* trasforma "*quasi tutti i simboli regex speciali in simboli ordinari, a meno che non inizino con una barra rovesciata*".
- Esiste anche una modalità *Molto Non magica* che estende l'effetto ad altri caratteri, non rilevanti per questo articolo.

## Quando la modalità *magica* (predefinita) è migliore di quella *non magica*?

Per analizzare la differenza tra modalità *magica* e *non magica*, riprendo una formula da un mio precedente [articolo](https://francopasut.netlify.app/post/vim_regex_white_spaces/).

Si tratta della formula di Vim RegEx per eliminare tutti gli spazi bianchi prima della prima parola e dopo l'ultima parola di ogni riga con un unico comando composito.

Ecco la formula in modalità *magica* (è l'ultima formula dell'articolo) senza le parentesi tonde:


```vim
%s/^\s*\|\s\+$//g
```

La stessa stringa scritta in modalità *non magica* è la seguente:

```vim
%s/\M^\s\*\s\+$//g
```

La differenza consiste nella `\M`, che attiva la modalità *non magica*, e nell'asterisco che in questa modalità deve essere precedeto dal carattere "escape".

In questa situazione, la modalità *magica* (predefinita) è migliore della *non magica* perché non ci sono caratteri RegEx speciali da usare come caratteri ordinari.

## Quando la modalità "non magica" è meglio di quella magica?

La modalità *non magica*, invece, è molto utile quando il testo contiene molti caratteri speciali, come le parentesi quadre.

Analizziamo l'effetto delle due modalità sul seguente testo in cui cerco di eliminare solo il primo gruppo di caratteri tra parentesi: *[abc]*.

>[abc][abcdef][abcghi]

Ora provo a confrontare la stringa con il seguente comando in modalità magica: 

```vim
s/[abc]//g
```

Applicando le rigide regole di Vim RegEx in *modalità magica* l'effetto è molto diverso da quello che dovrebbe essere:

>[][def][ghi]

Perché questo risultato?

Le parentesi quadre `[]` in RegEx identificano una "*classe di caratteri*".

Una *classe di caratteri* o un insieme, è una sequenza di caratteri che può essere utilizzata per abbinare qualsiasi singolo carattere dell'insieme.

Quindi, RegEx registra i caratteri all'interno della parentesi quadra e li elimina in tutte le occorrenze dell'intero insieme.

Per ottenere il risultato corretto in modalità *magica*, è necessario utilizzare il carattere *escape* per ogni parentesi: 

```vim
s/\[abc\]//g
```

Utilizzando la modalità *non magica*, invece, si ottiene proprio l'effetto desiderato, perché le parentesi sono trattate come caratteri normali.

```vim
s/\M[abc]//g
```
La modalità *non magica* è più facilmente leggibile dall'occhio umano.

Immaginate di creare una stringa di ricerca con molti caratteri speciali che devono essere tutti preceduti dal carattere di  "escape": il rischio di dimenticare qualche "escape" sarebbe molto alto.


## Il *caso curioso* dei nomi delle estensioni

Come sapete, le estensioni dei file sono un gruppo di tre o quattro caratteri separati da un punto dal nome del file.

Proviamo a risolvere un piccolo problema di RegEx che riguarda le estensioni: supponiamo di avere un elenco di documenti con estensioni diverse, come *.pdf*, *.tiff* e *.png*. 

Ad esempio:

    - primo documento.pdf
    - secondo documento.tiff
    - terzo documento.png

Ora, devo mantenere i nomi dei documenti ed eliminare solo le estensioni, **con un unico comando**.

Applicando rigorosamente la sintassi delle espressioni regolari nella *modalità magica*, attivata di default in Vim, si otterrebbe la seguente formula:

```vim
:%s/\\.pdf\|\.tiff\|\.png\|\.jpg//g
```

L'operatore di alternanza è `\|` e deve essere con *escape*.

Applicando le regole delle espressioni regolari in modalità *non magica* si otterrebbe la seguente formula:

```vim
%s/\M.pdf\|.tiff\|.png//g

```

La differenza è la barra di *escape* prima di ogni punto.

Ma a questo punto abbiamo proprio il *curioso caso delle estensioni*: per le operazioni sulle estensioni la notazione *magica* e quella *non magica* coincidono perché nel primo caso il punto ha il significato di "qualsiasi carattere" prima dell'estensione, compreso... il punto stesso, e, invece, nel secondo caso il punto denota solo quel carattere e nessun altro.

Cioè, in modalità *magica* il punto diventa uno dei *qualsiasi caratteri* che il punto, inteso come carattere speciale, assume in modalità *magica*, e tra i *qualsiasi caratteri* c'è, ovviamente, il punto stesso.

Semplificando ancora la formula, possiamo scriverla ancora più facilmente come segue: 

```vim
%s/.pdf\|.tiff\|.png//g
```

Pertanto le sintassi `%s/\M.pdf\.tiff\.png//g` e `%s/.pdf\.tiff\.png//g` sono di fatto equivalenti e il risultato sarà lo stesso.

Grazie per l'attenzione.


