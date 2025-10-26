---
title: "Quattro comandi di testo in GNU/Linux, MS Windows e, con un po' di nostalgia, MS-DOS."
date: 2025-10-26
slug:  quattro_comandi_dos
categories:
  - Blog
tags:
  - Linux
  - MS-DOS
  - MS Windows
image:
  placement: 3
  preview_only: false 
  caption: 'Comandi di testo'
canonicalUrl: https://francopasut.blogspot.com/2025/10/quattro-comandi-di-testo-in-gnulinux-ms.html
---


- [1. Ha ancora un senso effettuare operazioni tramite la Linea di Comando?](#1-ha-ancora-un-senso-effettuare-operazioni-tramite-la-linea-di-comando)
- [2. Come si apre un terminale di comando?](#2-come-si-apre-un-terminale-di-comando)
- [3. Il comando "cd".](#3-il-comando-cd)
- [4. I comandi "ls" e "dir".](#4-i-comandi-ls-e-dir)
- [5. Il comando "cp".](#5-il-comando-cp)
- [6. Il comando "rm".](#6-il-comando-rm)
- [7. In conclusione.](#7-in-conclusione)


# 1. Ha ancora un senso effettuare operazioni tramite la Linea di Comando?

Parlare di Linea di Comando nei sistemi operativi attuali potrebbe sembrare un po' *vintage*,  come se  l'argomento fosse un *residuo storico* dei primi  computer personali degli anni '80.

In realtà, ancora oggi  la Linea di Comando è una risorsa straordinariamente efficiente, nonostante le più moderne interfacce grafiche.

MS-DOS è stato il mio privo sistema operativo ai tempi di cui le "finestre" non erano ancora state inventate.

Per scrivere questo articolo ho recuperato dalla mia libreria cartacea un vecchio libro del 1989 dedicato proprio a MS-DOS in cui ho ritrovato le mie sottolineature dell'epoca.

![Toffoli](toffoli_dos_img.jpg)

I sistemi grafici hanno reso tutto più facile ma **non più veloce**.

Il vantaggio dei comandi testuali rispetto alle corrispondenti risorse grafiche  è costituito, ancora oggi, dalla maggiore **velocità di esecuzione**.

Il "piccolo" svantaggio è, per contro, la necessità di imparare a memoria le funzioni e la sintassi dei comandi più utili.

Tuttavia questo non è un articolo dedicato specificamente alla  Linea di Comando.

Ho già affrontato il tema della Linea di Comando in [un precedente mio articolo su questa piattaforma](https://francopasut.blogspot.com/2025/05/ms-windows-xcopy-e-robocopy-con-cenni.html#org4ddd7d5) al quale rinvio per le premesse.

In questo articolo mi concentro solo su alcuni comandi con alcuni cenni funzionali e storici.

Ho utilizzato Emacs Org Mode con plugin Evil, per emulare Vim.

# 2. Come si apre un terminale di comando?

Per usare i comandi testuali occorre aprire un terminale e scrivere i comandi: tutto molto semplice!

Un terminale è, sostanzialmente, un'applicazione che si lancia come le altre utilizzando finestra di ricerca del sistema operativo.

In GNU/Linux potrebbero apparire varie versioni di terminali a seconda della distribuzione o dell'ambiente grafico utilizzati: Terminal, GNOME Console, Konsole, Xfce Terminale.

Anche in Windows 11 è presente un Terminale: se si inserisce la stringa  "terminal"  nella barra di ricerca delle applicazioni e si preme invio,  viene lanciato *Windows PowerShell*.

Parallelamente al "nuovo" comando Terminale, è  utilizzabile in ogni versione di MS Windows, anche in quelle molto remote,  lo storico *Prompt dei comandi*.

Fino a qualche anno fa il termine "prompt" era praticamente sconosciuto a chi non utilizzasse i comandi testuali in MS Windows.

In pratica il "prompt", nell'accezione classica, indicava l'emulatore di terminale presente in tutte le versioni di Windows contenente il set di comandi di "MS-DOS".

Oggi la parola "prompt" è, come sappiamo tutti,  associata ai sistemi di Intelligenza Artificiale&hellip; ma questa è un'altra storia.

In questo  articolo il termine "prompt" viene utilizzato nel significato storico.

A proposito: se volete provare il "vecchio" DOS potete anche utilizzare un [emulatore di terminale online](https://www.101computing.net/msdos/).

# 3. Il comando "cd".

Il primo comando di questa breve rassegna è `cd` ovvero  *change directory*, uno dei più semplici ed utili ed uno dei primi da imparare per chi inizia *da zero*.

Come suggerisce il nome, serve a cambiare la cartella di lavoro, ovvero a navigare tra le cartelle del sistema operativo.

Il comando era già presente nel sistema operativo MS-DOS dalla prima metà degli anni '80 e derivava da simile comando in Unix dal 1969.

Quindi è certamente uno dei comandi più "antichi" della storia dell'informatica. 

La struttura di base è semplicissima: *comando+nome<sub>cartella</sub>*.

L'utilizzo del comando "cd" presenza alcune differenze sia tra le due applicazioni di Windows 11 (Prompt e Power Shell) che con la versione bash Linux.

Nella seguente lista trovate due termini specifici: shell",  che indica l'interfaccia a linea di comando, ed "home", che indica la cartella principale personale del sistema operativo.

-   Digitando nella "shell" di Linux il comando `cd` e premendo invio da ovunque ci si trovi nell'albero delle cartelle, si viene indirizzati immediatamente alla  "home".
-   Digitando lo stesso comando `cd`  nella Windows PowerShell, invece,  NON si viene indirizzati alla "home" ma viene replicata la cartella corrente.
-   In tale contesto per saltare alla cartella "home" si deve digitare "`cd  ~`".
-   Se utilizziamo  il  vecchio "Prompt dei comandi" in Windows 11, come peraltro in ogni precedente versione di Windows e a nel DOS storico, non solo NON funziona il ritorno "automatico" alla "home" con il comando "cd" ma la digitazione del comando "`cd  ~`" restituisce il messaggio: "Impossibile trovare il percorso specificato".

In sintesi: il comando "cd" di Windows PowerShell si avvicina maggiormente all'analogo comando di Linux, rispetto a quanto accada con il Prompt storico, ma non lo emula totalmente. 

L'"avvicinamento" consiste nel riconoscimento del carattere tilde (ovvero "~") come surrogato della cartella principale personale.

In Linux, tuttavia, il comando "cd" ha anche un'ulteriore caratteristica che in Windows è totalmente assente: l'uso del carattere "-" per  passare direttamente alla cartella di lavoro visitata in precedenza.

In pratica: digitando "`cd -`" nella "shell" di Linux si salta direttamente alla cartella di lavoro precedente. In Windows, sia con PowerShell che con il Prompt, tale versione del comando provoca l'errore "Impossibile trovare il percorso specificato". 

Emerge da  questa prima disamina, una serie di piccole differenze tra le varie implementazioni dei terminali.

# 4. I comandi "ls" e "dir".

Altro comando di Linux  molto utile e diffuso è `ls`, abbreviazione per "lista".

Come suggerisce il nome, il comando fornisce un elenco degli elementi presenti in una cartella.

La particolarità storica di questo comando, rispetto a quello prima esaminato, è che **non esisteva con tale denominazione nel sistema operativo MS-DOS**.

Se provate a digitare il comando nel *prompt* di Windows oppure in un emulatore di DOS online si ottiene il risultato *Illegal command: ls*.

La ragione è molto semplice: in MS DOS si usava il comando `dir` (derivante dal nome *directory*) al posto di `ls`.

Oggi il comando `ls` è disponibile, oltre che in tutte le distribuzioni  GNU/Linux, anche in Windows da 10 in poi, essendo stato implementato nel *Power Sell* ovvero nel nuovo Terminale di Windows.

C'è differenza tra il "vecchio" `dir` e l'attuale `ls`?

Certamente: il "vecchio" comando ha una sintassi più limitata a "scomoda" rispetto al nuovo.

Le opzioni più comuni di `dir` sono le seguenti:

-   /P: Visualizza l'elenco di file e cartelle una schermata per volta, fermandosi finché non si preme un tasto.
-   /W: Visualizza l'elenco in formato ampio, mostrando fino a cinque file o directory per riga.
-   /S: Elenca i file all'interno della directory specificata e di tutte le sue sottodirectory.
-   /A: Permette di visualizzare file con attributi specifici (ad esempio nascosti, di sistema).
-   /O: Ordina l'output secondo criteri specifici come nome, dimensione, estensione, data.
-   /Q: Mostra il proprietario del file.

La opzioni di `dir` sono combinabili tra loro ma soltanto con la ripetizione  della barra obliqua: esempio `dir /O/W`.

Le opzioni di `ls`, invece, sono combinabili tra loro mediante semplice affiancamento.

In altri termini: non occorre replicare per ogni comando il prefisso che, nel caso di specie, è **-** al posto di **/**.

La lista delle opzioni del comando `ls` è facilmente reperibile in rete.

Ecco una sintesi delle opzioni che uso più frequentemente:

-   `-l` per  "long": serve a visualizzare la lista con informazioni dettagliate.
-   `-a` per  "all": serve a visualizzare anche gli elementi nascosti
-   `-t` per  "time": serve a visualizzare la lista ordinata per data di modifica.
-   `-R` (con lettera maiuscola per distinguerla dall'opzione "-r" per "reverse") come "recursively":  visualizza il anche contenuto delle cartelle a livelli inferiori rispetto a quella corrente.

Come sopra anticipato, per combinare le opzioni basta aggiungere le relative lettere uno dopo l'altra.

Ad esempio: questa è una delle combinazioni più utili: `ls -lat`, più sotto ne spiegherò il significato.

Per combinare gli effetti delle varie opzioni non è, dunque, necessario ripetere il prefisso "-".

Esempio: per combinare le prime tre opzioni non occorre digitare `ls -l -a -t`, anche se tale sintassi è corretta. È, invece, sufficiente digitare la  più semplice combinazione `ls -lat`.

Tuttavia, lavorando a questo articolo, mi sono accorto che il comando `ls` nel Terminale di Windows, ovvero in Windows PowerShell, non accetta i parametri opzionali sopra riportati.

Dopo una breve ricerca ho scoperto il motivo: il comando `ls` in Windows PowerShell è un *alias*, ovvero un comando breve che  lancia un  comando più lungo.

Il comando lungo vero e proprio, lanciato da `ls`, è   `Get-ChildItem`.

Il sistema  funziona, quindi, diversamente rispetto al comando `ls` originale di Linux.

I parametri opzionali sono, in questo caso, quelli del comando lungo, ovvero quelli di `Get-ChildItem` che sono differenti da quelli di `ls` di Linux.

In rete si trova facilmente l'elenco dei parametri di `Get-ChildItem`. 

# 5. Il comando "cp".

Il comando `cp`, abbreviazione di "copia", consente, con unica operazione, di copiare ed incollare i contenuti da una cartella ad altra cartella.

Rammento che con la modalità grafica (ex. Esplora Risorse di Windows) occorrono **due distinte operazioni: una per copiare ed una per incollare**. Inoltre occorre spostare il puntatore dalla cartella di origine a quella di destinazione.

Vi siete mai chiesti quanto tempo perdete per tali operazioni?

La sintassi di base del comando è molto semplice: `cp cartella/nomefile cartella/nomefile`.

Chiaramente se il *nomefile* fosse situato nella cartella corrente,  il primo riferimento alla  *cartella* potrebbe essere omesso.

La stessa regola vale per la cartella di destinazione: se il *nomefile* da incollare fosse situato nella cartella corrente, anche il secondo riferimento alla  *cartella* potrebbe essere omesso.

Se, invece, dovessimo copiare/incollare un documento in un'altra cartella ma senza modificare il  nome del documento, allora potremmo omettere il riferimento al secondo *nomefile*.

Insomma: con un po' di pratica, il comando consente di effettuare **molto più rapidamente** le analoghe operazioni svolte con le risorse grafiche di Esplora Risorse o simili.

Solo provando la velocità dei comandi di testo, in particolare proprio questo,  è possibile rendersi conto di quanto tempo si perda ad effettuare operazioni di copia ed incolla con le finestre!

Ad esempio, possono essere effettuate operazioni di copia/incolla da qualsiasi cartella e su qualsiasi cartella senza spostarsi dalla cartella corrente.

Un'opzione molto utile del comando `ls` è `-r` che serve per copiare intere cartelle con relative sotto cartelle.

Lo schema di base è il seguente: `cp -r origine/ destinazione/`

Senza l'opzione `-r` il comando copierebbe soltanto gli eventuali documenti presenti nella cartella di origine, ma non le sottocartelle. 

Una particolarità aggiuntiva dell'opzione `-r` è la seguente:

-   Se la cartella di destinazione non esiste, ne viene creata una con il nome indicato nel comando ed allo stesso livello.
-   Se la cartella di destinazione esiste,  viene creata una sotto-cartella con il nome della cartella di origine.

L'opzione `-r` esiste e funziona in modo analogo anche in Windows PowerShell.

Nel "vecchio" MS-DOS non esisteva il comando `cp` ma, al suo posto, esisteva il comando `copy`, ancora più esplicito nel nome, che aveva una sintassi simile ma non uguale.

La domanda che mi sono posto è la seguente: il comando `copy` del "vecchio" MS-DOS aveva  un'opzione  simile a `-r` del comando cp di Linux ovvero che consentisse di copiare anche le sottocartelle?

Stranamente NO! Il comando COPY nel vecchio MS-DOS non aveva un'opzione che gli consentisse di copiare in modo ricorsivo anche le sottocartelle, come fa l'opzione -r di cp in Linux. Il comando COPY era, dunque, limitato alla copia dei file all'interno di una singola directory.

Per copiare intere directory e sottodirectory in MS-DOS, si doveva utilizzare un comando separato chiamato XCOPY (eXtended COPY), che era specificamente progettato per questo scopo.

Il comando XCOPY è menzionato  nel  mio articolo "[MS Windows: xcopy e robocopy con cenni a procedure batch ed rsync](https://francopasut.blogspot.com/2025/05/ms-windows-xcopy-e-robocopy-con-cenni.html)".

# 6. Il comando "rm".

Il nome del comando `rm` è l'abbreviazione di *remove* ed il comando è l'equivalente del tasto CANC dei sistemi operativi grafici. 

La sintassi è molto semplice: `rm [opzioni] nome-file`, anche questo molto semplice!

Il comando in versione pura e semplice ha l'effetto di cancellare i documenti ma non le cartelle.

Per eliminare anche le cartelle occorre utilizzare l'opzione `-r` che può l'iniziale della parola *ricorsivo*.

Quindi il comando per cancellare documenti, cartelle e sotto-cartelle, è il seguente: `rm -r nomecartella`.

E se fosse presente una cartella protetta da scrittura?

Nessun problema, basterebbe aggiungere l'opzione `-f` ed  il comando completo diventerebbe il seguente `rm -rf nomecartella`. 

Ovviamente è possibile utilizzare i cd. caratteri jolly, ovvero gli asterischi (\*) per qualsiasi sequenza di caratteri di qualsiasi lunghezza e il punto di domanda per un singolo carattere qualsiasi.

Il comando era presente anche nel "vecchio MS-DOS"?

Nel vecchio MS-DOS erano presenti addirittura DUE comandi con analoga funzione:  ERASE o DEL.

Usavo DEL più frequentemente di ERASE in quanto era più veloce da digitare. Ma l'effetto era uguale.

Entrambi funzionavano con nomi file e caratteri jolly ma con una particolarità notevole per l'epoca: l'utilizzo del caratteri jolly puro e semplice imponeva la conferma dell'operazione.

In altri termini: il comando `DEL *.txt*` per cancellare, ad esempio, tutti i documenti in formato testo presenti in una cartella veniva eseguito immediatamente mentre il comando `DEL *` imponeva la conferma prima dell'esecuzione.

Trattandosi di comandi ad effetto irreversibile, in questo modo veniva creata una *barriera* protettiva a fronte di operazioni astrattamente pericolose.

I comandi sono eseguibili ancora in MS Windows sia in Prompt che in Power Shell ma con una piccola differenza: in Prompt viene mantenuta la barriera protettiva originaria e, quindi, l'utilizzo del carattere `*` come unico contenuto del comando impone la conferma sopra descritta, invece la stessa operazione in Power Shell viene eseguita senza alcuna conferma.

In quest'ultimo caso, quindi, la "protezione" non è stata mantenuta.

# 7. In conclusione.

Questo articolo è ben lontano dall'essere una disamina completa dei comandi di testo nei vari sistemi operativi.

Neppure ha pretese di completezza sui quattro comandi di testo analizzati. 

È, invece, un invito ad utilizzare i comandi di testo per rendersi conto della straordinaria velocità di esecuzione che abbiamo perso con le soluzioni grafiche. 

Se anche solo un lettore si sentisse invogliato a provare i "vecchi" comandi di testo e,  magari, a farmi sapere come si sia trovato, ne sarei veramente felice!

Grazie per l'attenzione. 

