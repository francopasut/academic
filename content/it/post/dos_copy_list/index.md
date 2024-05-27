---
title: "Estrarre una lista di elementi da una cartella ed incollarla in un documento, in MS Windows, GNU/Linux e macOS."
date: 2024-05-26
slug:  dos_copy_list
categories:
  - Blog
tags:
  - Windows
  - Linux
  - macOS
image:
  placement: 3
  preview_only: false 
  caption: 'DOS e Linux'
---


<p align="center">
ABSTRACT
</p>

Articolo su come copiare una lista di elementi presenti in una cartella ed incollare la lista in un documento aperto. L'operazione viene effettuata soltanto con risorse interne ai sistemi operativi testati che sono MS Windows, GNU/Linux (Arch, Fedora e Ubuntu) e macOS, anche se in quest'ultimo caso solo nella modalità a linea di comando.

- [1. Argomento di questo articolo.](#1-argomento-di-questo-articolo)
- [2. Soluzione linea di comando in MS Windows.](#2-soluzione-linea-di-comando-in-ms-windows)
- [3. Soluzione a linea di comando in GNU/Linux e  macOS.](#3-soluzione-a-linea-di-comando-in-gnulinux-e--macos)
- [4. Soluzione grafica in Windows con Esplora File.](#4-soluzione-grafica-in-windows-con-esplora-file)
- [5. Soluzione grafica con Gestione File](#5-soluzione-grafica-con-gestione-file)


## 1. Argomento di questo articolo.

Vi è mai capitato  di avere  una cartella del  vostro computer piena di elementi e di dovere inserire l'elenco di tali elementi in una pagina che state scrivendo?

A me capita spesso per le liste documentali da inserire alla fine degli atti giudiziari.

In questo articolo descrivo un paio di soluzioni che ho personalmente provato,    in ambiente **MS Windows** che in vari sistemi operativi di derivazione **UNIX**, ovvero  alcune distribuzioni **GNU/Linux**, in particolare **Arch**, **Ubuntu** e **Fedora**, nonché **macOS**.

Il tutto utilizzando esclusivamente le  risorse native dei vari sistemi operativi. Quindi,  nessuna applicazione aggiuntiva.

Le soluzioni sono essenzialmente due: 
- Soluzione a linea di comando
- Soluzione con gestore grafico.

## 2. Soluzione linea di comando in MS Windows.

Un po'di storia informatica: prima di Windows esisteva, per i Personal Computer IBM compatibili, un sistema operativo a linea di comando  denominato DOS.

Il DOS è stato il sistema operativo *commerciale* più diffuso dagli inizi del 1979 sino alla metà del 1990.
A quei tempi il terminale era l'unico sistema per gestire i documenti.

Dopo l'avvento di Windows, il DOS è stata mantenuto come applicazione, nel   **prompt dei comandi**.

Da Windows 10, oltre al  classico *prompt*,  è stato aggiunto il **Windows PowerShell**, versione potenziata poi rinominata semplicemente **Terminale** in Windows 11.

Il **prompt dei comandi** ed il **Windows PowerShell** sono due applicazioni separate,  entrambe disponibili in Windows 10 e 11.

Per la finalità di questo articolo userò  il vecchio "*prompt*",   per dimostrare l'estrema semplicità dell'operazione ed anche perché più simile al *vecchio* DOS.

Per lanciare il *prompt  dei comandi* si preme il tasto con un logo alla sinistra  della barra spaziatrice, ovvero il tasto  *Windows*, anche denominato tasto *Start* o tasto *Logo*,  insieme alla lettera *r*: in  pratica  `Start + r`.

Nella finestra che appare si digita  `cmd` seguito dal  tasto *Invio*.

In pratica:

1. `Start + r`
2. `cmd`
3. *Invio*

Si può lanciare il *Prompt dei comandi* anche dal Menù delle applicazioni.

Per navigare tra le cartelle si utilizza il comando `cd` (*Change Directory*).  Ad esempio, per passare alla cartella degli utenti si usa:

```bash
cd C:\Users
```

Da notare e ricordare l'uso della barra obliqua *dall'alto in basso* per gli indirizzi,  `\`, ritorneremo dopo su tale particolare.

Per generare  l'elenco dei documenti contenuti in una cartella si usa il comando `dir` (*Directory*).

Con quel comando si ottengono, tuttavia,  anche informazioni aggiuntive sui documenti e  tali informazioni potrebbero essere fastidiose da eliminare.

Aggiungendo l'opzione "/b", quindi con il comando `dir /b`, si ottiene, invece,  la  lista  dei soli nomi dei documenti senza altri dati.

Per salvare il risultato  in un documento si  usa l'operatore `>` (maggiore). Tale operatore consente di salvare l'*output* di un comando in un file di testo anziché di visualizzarlo direttamente a schermo.

Pertanto,  per esportare la lista dei documenti in *output.txt* si usa il comando:

```bash
dir /b > output.txt
```

Quel comando genera un documento denominato, appunto,   "*output.txt*"  contenente la lista dei documenti della cartella.

Trattandosi di documento in "testo semplice", è modificabile con qualsiasi programma di elaborazione testi, anche con il semplice *Blocco Note*.

## 3. Soluzione a linea di comando in GNU/Linux e  macOS.

Nel mondo GNU/Linux il terminale a linea di comando è sempre stato, e lo è ancora oggi, uno dei metodi più usati per la gestione del documenti  nel sistema operativo.

Anche **macOS** ha un terminale che è molto simile a quello di Linux. 

Entrambi i sistemi operativi hanno la stessa origine da *UNIX* e, quindi, condividono molte caratteristiche comuni nel terminale.

In particolare, macOS utilizza **Bash** come *shell* di default, che è lo stesso ambiente di *shell* utilizzato da molte distribuzioni Linux.

La *shell* è il livello software che interpreta i comandi dell'utente e li trasforma in azioni da parte del sistema operativo.

Nel mondo UNIX vi sono anche altre  *shell* per la gestione del  terminale:
*Fish*,
*Zsh*,
*Dash*,
*Ksh*.

Tuttavia anche per Linux faremo riferimento alla soluzione "shell" più semplice, ovvero **Bash**,  "*Bourne Again SHell*", che è anche la  più comune.

Il terminale in Linux si lancia come qualsiasi altra applicazione a seconda del Desktop  Manager utilizzato (ex. Plasma, Gnome, Cinnamon, ecc.).

Per lanciare il terminale in macOS, si utilizza uno di questi metodi:

Tramite *Launchpad* (scrivendo "Terminale" nel campo di ricerca); 
tramite *Finder*,  aprendo 
la cartella `/Applicazioni/Utility`; 
Tramite *Spotlight*.

Anche nel terminale di  Linux/macOS per muoversi tra le cartelle si usa il comando `cd` ma la sintassi è un po' diversa rispetto al *prompt* di Windows.

Ad esempio: per muoversi alla cartella Documenti dell'utente si usa il comando

```bash
cd ~/Documenti
```

Da notare che in Linux/macOS le barre oblique nel terminale si usano *dal basso in alto* (`/`), ovvero al contrario rispetto al *prompt* di  Windows/DOS.

Per elencare il contenuto delle cartelle si usa il comando `ls` (*list*), corrispondente al `dir` del *prompt*.

Anche in Linux/macOS è presente un'opzione per filtrare l'elenco con i soli nomi dei documenti:  `-f` simile  `/b` di Windows/DOS, come sopra indicato.

L'operatore di reindirizzamento è, invece, simile:  `>`.

Quindi per salvare nel disco in *output.txt* la lista del contenuto della cartella Home/Documenti si usa il seguente comando (in cui la *tilde*,  `~`,  è la scorciatoia per partire dalla Home):

```bash
ls -f ~/Documenti > Documenti/output.txt
```
## 4. Soluzione grafica in Windows con Esplora File.

Lo stesso risultato si può ottenere in modalità grafica, utilizzando le rispettive applicazioni presenti in ogni sistema operativo, con qualche piccola differenza tra loro.

In MS Windows occorre aprire Esplora Fila selezionandolo  sulla barra delle applicazioni o nel menu Start oppure premendo la combinazione `WINDOWS + e` sulla tastiera; si selezionano i *file* da copiare; si tiene premuto il tasto MAIUSCOLO e si preme il pulsante destro del *mouse* selezionando la voce "*Copia come percorso*".

Tale voce è presente da Windows 7 in poi ma solo tenendo il tasto *Shift*\-Maiuscolo premuto.

Il risultato può essere, poi, incollato in un documento aperto e conterrà i vari *file* con i rispettivi percorsi racchiusi tra virgolette.

Piccolo "trucco": per avere la sequenza corretta della lista occorre porre il cursore sul *primo file* selezionato, altrimenti la copia potrebbe iniziare  da un documento successivo della lista.

Ad esempio: se avessimo una lista con i documenti DOC1, DOC2, DOC3 e si ponesse il cursore sul DOC2, la copia avverrebbe con la seguente sequenza: DOC2, DOC3, DOC1.

Per rispettare la corretta sequenza, dunque, occorre posizionare il cursore sul DOC1 prima di dare il comando di *Copia come percorso*.

## 5. Soluzione grafica con Gestione File

Con Linux, invece, basta semplicemente selezionare i documenti dal Gestore dei File, copiare l'elenco e incollarlo nel documento.

Il percorso viene presentato senza le virgolette.

Provato con Arch Linux, Fedora e Ubuntu.

Pertanto in GNU/Linux l'operazione  è leggermente più semplice rispetto a Windows  in quanto non occorre tenere premuto il tasto MAIUSCOLO per ottenere la copia dei percorsi.

In pratica Linux riconosce automaticamente la destinazione dell'operazione di copia/incolla e presenta il percorso nel caso in cui tale destinazione consista in un documento in corso di elaborazione.

Ed in macOS? purtroppo in macOS questo metodo non funziona. Se si copia un lista di documenti dal Finder e si prova ad incollare tale lista in un documento aperto, si otterranno i **contenuti** dei documenti e non i nomi degli stessi.

La soluzione, in questo caso, passa da applicazioni dedicate o da Automator, ma questa è un'altra storia.

Grazie per l'attenzione.

