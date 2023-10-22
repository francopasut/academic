---
title: "Linux: rename, rename.ul, prename, perl-rename: che confusione!"
date: 2023-10-22
slug:  linux-rename-confusion
categories:
  - Blog
tags:
  - Linux
image:
  placement: 3
  preview_only: true 
  caption: 'Linux names confusion'
---

{{% toc %}}


## Sintesi di questo articolo.

In questo articolo riporto alcune osservazioni su come rinominare i documenti in GNU/Linux utilizzando comandi testuali, chiarendo alcune differenze tra varie distribuzioni.

Il comando `rename` non ha, infatti,  un comportamento univoco nelle distribuzioni derivate da  Debian rispetto a quelle derivate da  Fedora e Arch.

Cercherò di chiarire il contenuto dei diversi comandi ed il diverso comportamento di comandi che hanno lo stesso nome.

Tutti i passaggi sono stati personalmente provati durante la stesura dell'articolo.

Se trovate  imprecisioni o errori, fatemi sapere.

## Uno per tutti:  *mv*.

Per rinominare un documento utilizzando la linea di comando in GNU/Linux si usa, in genere, il comando `mv`, ovvero *move* e tale comando ha un comportamento univoco in tutte le distribuzioni.

In pratica il comando `mv` *muove* il documento dal vecchio nome al nuovo nome e tale operazione viene eseguita in modo omogeneo nelle varie distribuzioni.

La sintassi è semplicissima: `mv old-name new-name`.

Ma non è l'unico comando per questa operazione.

Ci sono altri comandi ad iniziare da `rename`.


## Il comando *rename*: qui iniziano i problemi!

In molte  distribuzioni è disponibile   il comando `rename` che estende la funzionalità di rinomina dei documenti mediante l'utilizzo di modelli.

Il comportamento di tale comando, tuttavia, non è univoco.

Nelle versioni di Ubuntu precedenti alla  n. 22 era presente un comando denominato `rename-ul` installato con il pacchetto  `util-linux`. Tale comando non era compatibile con le *espressioni regolari*.

L'attuale  versione del comando `rename` in Ubuntu e Debian è, invece, compatibile con le *espressioni regolari* e si installa con `sudo apt install rename`.

Quindi: **nelle distribuzioni Debian, Ubuntu e derivate, il comando `rename` consente l'utilizzo delle "espressioni regolari"**.

Un comando con lo stesso nome è presente anche negli archivi di installazione di Fedora e Arch ma ha un **comportamento differente in quanto non è compatibile con le "espressioni regolari"**.

In pratica il comando `rename` presente in Fedora ed Arch ha un comportamento analogo al *vecchio* `rename-ul` un tempo presente in Debian e Ubuntu.

Per avere un comando compatibile con le espressioni regolari occorre installare il comando `prename` in Fedora e `perl-rename` in Arch Linux.

Quindi, riassumendo:
- In Debian ed Ubuntu, installate qualche anno fa e aggiornate di volta in volta,  potreste trovare ancora installato il comando `rename-ul` non compatibile con le espressioni regolari
- L'attuale comando  `rename` in Debian e Ubuntu è, invece, compatibile con le *espressioni regolari*.  
- Il comando `rename` in Fedora e Arch **non** è  compatibile con le *espressioni regolari*.
- Il comando equivalente compatibile con le espressioni regolari è `prename` per Fedora e `perl-rename` per Arch.

## Come si comporta il comando "rename" NON compatibile con le espressioni regolari?

Il comando `rename` presente in Fedora e Arch che, poi, è lo stesso a suo tempo denominato `rename-ul` presente in Debian e Ubuntu, consente di effettuare operazioni su basi documentali multiple mediante l'utilizzo di "modelli" ma senza l'utilizzo delle *espressioni regolari*.

Lo schema sintattico di base  è il  seguente:

```bash
rename [options] <pattern> <replacement> <file(s)>
```

Ad esempio: per sostituire l'estensione .txt con l'estensione .bak su tutti i documenti di testo si usa la seguente formulazione:

```bash
rename  .txt .bak *.txt
```

Pertanto `rename` è, già,  molto versatile ma, nella versione di Fedora e Arch, non supporta la potenza delle *espressioni regolari*, ovvero del *meta-linguaggio* di eccellenza per operare su stringhe di testo.

## I comandi compatibili con le  "espressioni regolari"

In varie distribuzioni esistono comandi compatibili con le espressioni regolari di *Perl* variamente denominati: in *Debian* e *Ubuntu* il comando è `rename`; in *Arch* Linux è `perl-rename`; in *Fedora* è `prename`.

L'installazione è molto semplice per ciascuna distribuzionie:
- Per Debian e Ubuntu: `sudo apt install rename`.
- Per Fedora: `sudo dnf install prename`.
- Per Arch: `sudo pacman -S perl-rename` o, per chi lo usa, `yay -S perl-rename`.


La compatibilità con le *espressioni regolari* avviene con riferimento al comando  `sed` di Linux.

## Il comando "*sed*" in GNU/Linux

Il comando *sed* (*stream editor*) di  GNU/Linux viene utilizzato   per la sostituzione di stringhe di testo all'interno dei documenti.

Il comando opera  non sul  nome dei documenti ma  all'interno di essi.

Una tipica formula di *sed* è la seguente:

```bash
$sed 's/old_name/new_name/' file_object
```

Il risultato viene presentato nella linea di comando e può, ovviamente, essere reindirizzato in un separato documento con l'operatore `>` della linea di comando Linux.

Lo stesso procedimento può essere utilizzato per i nomi dei documenti ma l'operatore non può essere il comando ` sed` bensì un  comando espressamente dedicato allla modifica a livello di nome e non di contenuto.

I comandi `rename` di Debian e Ubuntu, `prename` in Fedora e `perl-rename` in Arch utilizzano, appunto, una struttura *sed-like*.

## Utilizzo dei comandi compatibili con le espressioni regolari.



Lo schema  fondamentale di `rename`,  in versione Debian e Ubuntu, `prename` in Fedora e `perl-rename` in Arch è il seguente:

Ad esempio: per sostituire l'estensione .txt con l'estensione .bak su tutti i documenti di testo si usa la seguente *espressione regolare* (a seconda delle varie distribuzioni):

```bash
- rename 's/\.txt$/.bak/' *.txt
- prename 's/\.txt$/.bak/' *.txt
- perl-rename 's/\.txt$/.bak/' *.txt
```

Quindi lo schema di base è il seguente:

```bash
nome-comando 's/old_name/new_name/' file(s)
```

Spero di avere chiarito questa potenziale confusioni tra comandi per rinominare i documenti in  diverse distribuzioni di GNU/Linux.

Grazie per l'attenzione.
