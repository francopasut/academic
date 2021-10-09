---
title: "Vim: alcune  modalità per aprire documenti singoli o multipli"
date: 2021-10-09
slug: vim_several_modalities
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: true 
  caption: 'Vim b/w logo'
---

{{% toc %}}

## Tabella di sintesi

Alcuni comandi di Vim di cui parlerò in questo articolo:

| I write                       | To get                                                                                                  |
| -------------                 | -------------                                                                                           |
| `vim document_name`           | Per avviare Vim e aprire un documento                                                                   |
| `gvim document_name`          | Per avviare Vim in modalità grafica ed aprire un documento                                              |
| `vim file-1 file-2 file-n`    | Per avviare Vim ed aprire multipli documenti                                                            |
| `vim -p file-1 file-2 file-n` | Per avviare Vim ed aprire multipli documenti in schede separate                                         |
| `vim -o file-1 file-2 file-n` | Per avviare Vim ed aprire multipli documenti in finestre sovrapposte in orizzontale                     |
| `vim -O file-1 file-2 file-n` | Per avviare Vim ed aprire multipli documenti in finestre sovrapposte in verticale                       |
| `sp doc_name`                 | Per aggiungere  un documento in finestra con separatore orizzontale quando Vim è già in esecuzione |
| `vs doc_name`                 | Per aggiungere  un documento in finestra  con separatore verticale quando Vim è già in esecuzione |
| `tabe doc_name`               | Per aggiungere un documento in una scheda quanto Vim è in esecuzione                                    |

Vim offre molte opzioni per aprire o creare file singoli o multipli dalla riga di comando o mentre l'applicazione è in esecuzione.

Ecco una breve rassegna, con alcuni brevi animazioni,  dei comandi che uso più di frequente, senza alcuna pretesa di completezza.


## Se Vim non è in esecuzione: come  lanciare i documenti dalla linea di comando

Quando occorre lanciare Vim e aprire un documento allo stesso tempo si digita il comando composito `vim nome_documento` in un terminale di testo. 

Per lanciare la versione grafica di Vim (ovviamente, sempre che sia già stata installata) occorre digitare `gvim nome_documento`.

Per lanciare molti file con un singolo comando di testo, si possono aggiungere più nomi nella stringa: `vim file-1 file-2 file-n`.

Con questo comando  i documenti vengono effettivamente aperti   ma soltanto il primo della lista viene visualizzato nella finestra di editing.

Per aggiungere nuovi documenti una volta che Vim è aperto si digita  `:n nome_file`.

È possibile vedere l'elenco dei documenti aperti, sebbene non visualizzati, digitando `:list` oppure `:ls`.

Per dividere tutti i documenti in schede separate occorre aggiungere l'opzione `-p` ovvero  `vim -p file-1 file-2 file-n`. Per sfogliare le schede si usa il comando `gt` in modalità normale (puoi osservare il seguente video).


![Open with p option](vim-open-multiple-p.gif)


Per dividere i documenti in finestre separate occorre usare l'opzione `-o` (lettera "o" minuscola) ovvero `vim -o file-1 file-2 file-n` e, poi, per passare da una finestra all'altra si usa il comando `Ctrl-w`.

![Open with o option](vim-open-multiple-o.gif)

Per avere la separazione verticale si usa l'opzione `-O` (lettera "O" maiuscola) ovvero `vim -O file-1 file-2 file-n`.

![Open with O option](vim_open_multiple_O.gif)

In ciascuna delle combinazioni precedenti, se i file indicati nei comani non fossero esistenti, Vim creerebbe un documento separato per ciascun nome.

In ogni comando di cui sopra si otterrà un altro risultato: la generazione di una *lista di argomenti* con i nomi di tutti i documenti aperti o creati quando li avete lanciati con il comando *vim*.

Per vedere la lista degli argomenti si digita `:args`.

La *lista degli argomenti* può essere utilizzata per varie operazioni.

## Se Vim è già in esecuzione: i comandi "*e, sp, vs, tabe*"

In ogni tutorial per principianti leggerete che il comando per aprire un documento è `:e` seguito dal nome di un file o dal percorso di un file.

È il comando più semplice per aprire documenti quando Vim è già in esecuzione.

Ma non è l'unico comando disponibile  mentre Vim è il esecuzione.

È possibile aggiungere un documento in una finestra separata utilizzando il comando `:sp doc_name` (dall'inglese *SPlit*).

I seguenti video sono registrati separando la fase di apertura di un primo documento denominato *file-1* con il comando `:e`, dall'aggiunta di documento, denominato *file-2*,   con i vari comandi `sp`, `vs` e `tabe`.

![Split another document](vim-split.gif)

È anche possibile avviare il nuovo documento con separazione verticale con il comando `:vs doc_name` (dall'inglese *Vertical Split*).

![Vertical split](vim-vsplit.gif)

Per aggiungere, invece, un nuovo documento in una scheda (*tab*) occorre digitare `:tabe doc_name`.

![Tab another doc](vim-tabe.gif)


## Esplorare prima di aprire

A volte mi capita di non ricordare il nome del documento da aprire.

Vim ha una funzione integrata per elencare il contenuto delle cartelle. 

Digitando il comando `:Ex`  (con la E maiuscola, derivante dal termine inglese *Explore*) è possibile navigare e premere il tasto Invio per aprire il documento desiderato.

## Da continuare

Questo articolo potrebbe continuare con altre fantastiche opzioni di Vim sullo stesso argomento che ancora non ho scoperto.

Ma per ora queste sono sufficienti.

Grazie per la vostra attenzione e se trovate qualche errore nell'articolo mandatemi un messaggio.
