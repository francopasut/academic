---
title: "AWK: Cinquant'anni di semplicità ed efficienza nel terminale"
date: 2026-08-26
slug:  awk_linux
categories:
  - Blog
tags:
  - Linux
  - AWK
image:
  placement: 3
  preview_only: false 
  caption: 'AWK e linea di comando'
canonicalUrl: https://francopasut.blogspot.com/2026/08/awk-cinquantanni-di-semplicita-ed.html
---


- [1. AWK: Cinquant'anni di semplicità ed efficienza nel terminale](#1-awk-cinquantanni-di-semplicità-ed-efficienza-nel-terminale)
- [2. Cos'è AWK e la storia dietro le sue iniziali](#2-cosè-awk-e-la-storia-dietro-le-sue-iniziali)
- [3. Come funziona AWK: Concetti di base](#3-come-funziona-awk-concetti-di-base)
- [4. AWK alla prova: Alcuni esempi pratici](#4-awk-alla-prova-alcuni-esempi-pratici)
  - [4.1. Stampare solo i nomi (prima colonna)](#41-stampare-solo-i-nomi-prima-colonna)
  - [4.2. Filtrare i dati con una condizione (età superiore a 28 anni)](#42-filtrare-i-dati-con-una-condizione-età-superiore-a-28-anni)
  - [4.3. Calcolare la somma di una colonna](#43-calcolare-la-somma-di-una-colonna)
- [5. L'integrazione perfetta nella Filosofia Unix](#5-lintegrazione-perfetta-nella-filosofia-unix)
- [6. AWK vs Python: È ancora utile oggi?](#6-awk-vs-python-è-ancora-utile-oggi)
- [7. Conclusione](#7-conclusione)

## 1. AWK: Cinquant'anni di semplicità ed efficienza nel terminale

Vi è mai capitato di digitare per pura curiosità un comando nel terminale Linux e scoprire un intero mondo? 

È quello che mi è successo digitando semplicemente `awk` in una distribuzione Debian: invece di un messaggio di errore, il sistema ha risposto immediatamente mostrando un elenco di opzioni ed esempi pratici.

Da qui ho scoperto che AWK è una presenza fissa nei sistemi Unix-like, quasi sempre **preinstallata di serie** in una delle sue varianti modernizzate (come `gawk` per GNU AWK o `mawk`).


## 2. Cos'è AWK e la storia dietro le sue iniziali

AWK è sia un linguaggio di programmazione sia un interprete progettato specificamente per elaborare file di testo strutturati riga per riga. 

Nacque negli anni '70 presso i celebri **Bell Labs** dalla mente di tre pionieri dell'informatica: **A**lfred V. **A**ho, Peter J. **W**einberger e Brian W. **K**ernighan. 

Il nome "AWK" deriva proprio dall'acronimo dei loro tre cognomi.

Nel panorama del software libero e Unix, chiamare uno strumento prendendo spunto da nomi di persone reali è quasi una tradizione:

* **Linux**: Linus Torvalds voleva inizialmente chiamare il sistema *Freax* (dall'unione di *free*, *freak* e la *X* di Unix). Fu Ari Lemmke, l'amministratore del server FTP universitario su cui venne caricato il codice sorgente, a rinominare la cartella in *Linux* (da *Linus* + *Unix*), nome che Torvalds decise poi di mantenere.


* **Debian**: Nasce dalla fusione romantica dei nomi di Debra Lynn (all'epoca compagna e poi moglie del creatore) e Ian Murdock.


* **BASH** (*Bourne-Again SHell*): Un divertente gioco di parole basato sulla precedente *Bourne Shell* (`sh`), sviluppata da Stephen Bourne.

## 3. Come funziona AWK: Concetti di base

La vera forza di AWK sta nella straordinaria semplicità con cui permette di estrarre colonne, filtrare righe, eseguire calcoli veloci e generare report testuali senza dover scrivere script complessi.

Quando AWK legge un file, suddivide automaticamente ogni riga in campi separati da spazi o tabulazioni:

* `$1` rappresenta il primo campo (prima colonna).


* `$2` rappresenta il secondo campo.


* `$3` rappresenta il terzo campo.


* `$0` rappresenta l'intera riga.



La struttura di base di un'istruzione AWK si basa sulla formula:

**`condizione { azione }`**

## 4. AWK alla prova: Alcuni esempi pratici

Creiamo un semplice file di testo chiamato `test.txt` per testare la sintassi:

```text
John Smith 30
Alice Johnson 25
Bob Brown 42
```

### 4.1. Stampare solo i nomi (prima colonna)

Per estrarre esclusivamente il primo campo di ciascuna riga:

```bash
awk '{print $1}' test.txt
```

**Risultato:**

```text
John
Alice
Bob
```

### 4.2. Filtrare i dati con una condizione (età superiore a 28 anni)

Per selezionare nome e cognome soltanto per chi ha più di 28 anni:

```bash
awk '$3 > 28 {print $1, $2}' test.txt
```

In questo comando, `$3 > 28` è la **condizione**, mentre `{print $1, $2}` rappresenta l'**azione** eseguita unicamente sulle righe che soddisfano il criterio.

**Risultato:**

```text
John Smith
Bob Brown
```

### 4.3. Calcolare la somma di una colonna

Un'altra operazione utilissima consiste nel calcolare al volo dei totali numerici. Ad esempio, per sommare tutte le età presenti nella terza colonna:

```bash
awk '{somma += $3} END {print "Totale età:", somma}' test.txt
```

La variabile `somma` accumula il valore del terzo campo per ogni riga, mentre il blocco speciale `END` stampa il totale accumulato solo dopo aver terminato la lettura del file.


## 5. L'integrazione perfetta nella Filosofia Unix

AWK incarna appieno la **filosofia Unix**: *"scrivere programmi che facciano una sola cosa e la facciano bene, progettati per lavorare insieme"*.

Grazie al meccanismo dei **pipe** (`|`), AWK dà il meglio di sé quando viene concatenato ad altri comandi della riga di comando. Può elaborare in tempo reale il flusso di output proveniente da utilità come `grep`, `sort`, `ls`, `ps` o `df`:

**Esempio pratico:** Se desideri monitorare lo spazio su disco usando `df -h` ed estrarre unicamente la percentuale di utilizzo e il punto di mount, è sufficiente passare l'output ad AWK:
```bash
df -h | awk '{print $5, $6}'
```


## 6. AWK vs Python: È ancora utile oggi?

Nonostante abbia ormai superato il traguardo dei cinquant'anni, AWK si rivela tuttora uno strumento insostituibile per:

* Analizzare file CSV o TSV leggeri;


* Ispezionare file di log;


* Formattare l'output di comandi di sistema;


* Costruire pipeline Unix veloci.



Molte operazioni che in Python richiederebbero la scrittura di uno script dedicato con l'apertura del file e cicli di iterazione:

```python
with open("test.txt") as f:
    for line in f:
        print(line.split()[0])
```

Certo, si può compattare Python da terminale sfruttando il flag `-c`:

```bash
python3 -c "for l in open('test.txt'): print(l.split()[0])"
```

Oppure per effettuare la somma delle età:

```bash
python3 -c "print(sum(int(l.split()[2]) for l in open('test.txt')))"
```

Tuttavia, anche di fronte a un linguaggio moderno ed efficiente come Python, AWK vince a mani basse per **immediatezza, sintassi naturale da riga di comando e brevità** nelle operazioni al volo sul testo.


## 7. Conclusione

Cinquant'anni e non sentirli: AWK è la prova tangibile di come un software ben progettato, focalizzato su un compito ben preciso e leggero, possa rimanere rilevante attraverso le epoche tecnologiche.

La prossima volta che ti ritroverai a dover estrarre una colonna da un file di log o da una tabella nel terminale, prima di aprire uno script Python o l'editor di testo, prova  questo piccolo grande classico.

Grazie per l'attenzione.