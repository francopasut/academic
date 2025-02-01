---
title: "Vim: Taglia, Copia e Incolla da e verso la memoria del Sistema Operativo"
date: 2021-09-01
slug: vim_cut_copy_paste_clipboard
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: true 
  caption: 'Vim logo'
---



## Taglia, Copia e Incolla usando la tastiera del computer

Tutti sanno come usare le combinazioni da tastiera `Ctrl-c`, `Ctrl-x`
e `Ctrl-v` in Windows e Linux oppure `Cmd-c`, `Cmd-x` e  `Cmd-v` in
macOS per copiare, tagliare e incollare testo tra le varie applicazioni.

Molti pensano che quelle combinazioni siano universali e funzionino con qualsiasi applicazione. Ma non è così.

In particolare, Vim usa un altro sistema per scambiare le informazioni con il "*resto del mondo*" su computer.

Ad esempio, in Vim sotto GNU/Linux la combinazione `Ctrl-v` corrisponde alla funzione  *blocco visuale* e non a quella di "incolla".

Ho scritto questo articolo per ricordare a me stesso, in qualità di *non programmatore*, le combinazioni di tasti da utilizzare nel mondo Vim per scambiare testo con le altre applicazioni.

## Vim ed il  *registro di memoria del sistema operativo* 

Vim utilizza  una risorsa originale per scambiare testo con altre applicazioni.

Se premete in Vim (o in gVim, l'equivalente grafico) il comando `:reg`  potrete visualizzare un elenco di elementi che iniziano con le virgolette doppie e sono seguiti da un simbolo, una lettera o un numero: questi sono i registri.

Vim utilizza un registro specifico per interagire con la *memoria del sistema operativo* e, conseguentemente, con le altre applicazioni.

Questo specifico registro è identificato con il simbolo matematico *più* (`+`).

Esiste anche un altro simbolo per la memoria di sistema: l'asterisco (`*`) che produce praticamente gli stessi risultati del simbolo precedente ma in GNU/Linux salva le informazioni dalla rotellina centrale del *mouse*.

##  Da Vim alla memoria di sistema

Il trasferimento di informazioni da Vim ad altre applicazioni  avviene con l'utilizzo della combinazione di caratteri `"+y` per **copiare** il testo e  `"+x` per **tagliarlo** dal documento di origine.

Questo è lo schema mostrato nel menù di gVim:

![cutocopyconverted.png](cutocopyconverted.png "Tagliare o Copiare")



I simboli sono spiegati nella seguente tabella:

| Tasto  | Di cosa si tratta?                        |
| ---- | ----------                     |
| `"`  | Identifica i *registri* in genere            |
| `+`  | Identifica il registro del sistema operativo |
| `x`  | È la lettera per **tagliare** il testo  |
| `y`  | È La lettera per **copiare** il testo |

Quindi per completare l'operazione occorre premere tre tasti in sequenza:

1.  `"`
2.  `+`
3.  `x` *oppure* `y`

In entrambi i casi, il testo *tagliato* o *copiato* è inviato anche alla memoria del sistema operativo e può essere incollato all'esterno di Vim utilizzando il consueto comando `Ctrl-v` , in Windows e Linux, oppure `Cmd-v` in macOS.

##  Dalla memoria di sistema a Vim

Anche l'operazione inversa è molto semplice.

Per trasferire il testo copiato dalla memoria di sistema occorre utilizzare la stringa `"+gP`.

![pastevimconverted](pastevimconverted.png "La stringa per incollare testo")


Analizziamo ogni singolo componente della stringa:

- Il tasto "`P`" corrisponde all'operazione *incolla (paste) **prima** della posizione corrente*.
- Il tasto "`g`" colloca il cursore dopo il testo incollato.

Quindi il comando "`gP`" produce il seguente risultato: *Incolla prima della posizione corrente ponendo il cursore dopo il testo incollato.*

Se non venisse utilizzato il tasto `g` il cursore sarebbe collocato sull'ultima lettera del testo incollato e si "perderebbe" tempo per avanzare il cursore di un carattere.

Nella *filosofia di Vim* tutto deve essere ottimizzato, anche il singolo movimento del cursore!

##  Alcune scorciatoie da tastiera in gVim 

In alcune circostanze, è anche possibile utilizzare scorciatoie da tastiera in gVim.

Funzionano principalmente in MS Windows ma alcune anche in distribuzioni Linux. 

Posso direttamente confermare il funzionamento nelle distribuzioni Linux  Mint, Fedora, Ubuntu e Antergos per la scorciatoia *incolla* (vedete l'elenco qui di seguito) ma non posso dire lo stesso per le altre scorciatoie.

Ecco l'elenco delle scorciatoie

| Scorciatoia         | Che effetto ha?                                        |
| ---------------- | -----------------------------------------------      |
| `Maiuscolo+Canc`   | Taglia il testo e lo inserisce nella memoria di sistema |
| `Ctrl+Inserimento`    | Copia il testo nella memoria di sistema |
| `Maiuscolo+Inserimento`   | Incolla il testo dalla memoria di sistema |

Grazie per la vostra attenzione.

