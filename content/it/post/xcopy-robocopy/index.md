---
title: "MS Windows: xcopy e robocopy con cenni a procedure batch ed rsync."
date: 2025-05-23
canonicalUrl: https://francopasut.blogspot.com/2025/05/ms-windows-xcopy-e-robocopy-con-cenni.html
slug:  xcopy_robocopy_windowsv
categories:
  - Blog
tags:
  - Windows
  - Robocopy
image:
  placement: 3
  preview_only: false 
  caption: Windows and Robocopy
---


<p align="center">
INDICE
</p>

- [Copia e Incolla: il metodo universale.](#copia-e-incolla-il-metodo-universale)
- [Breve premessa sulla Linea di Comando in  MS Windows.](#breve-premessa-sulla-linea-di-comando-in--ms-windows)
- [Due soluzioni integrate a linea di comando: xcopy e robocopy.](#due-soluzioni-integrate-a-linea-di-comando-xcopy-e-robocopy)
- [Schema base ed alcune  opzioni, tra le tante, del  comando robocopy.](#schema-base-ed-alcune--opzioni-tra-le-tante-del--comando-robocopy)
- [Robocopy e procedure batch.](#robocopy-e-procedure-batch)
- [Robocopy e Rsync.](#robocopy-e-rsync)
- [FreeFileSync](#freefilesync)


<a id="org2e03875"></a>

# Copia e Incolla: il metodo universale.

Per  trasferire *file* da una cartella ad un'altra cartella di solito si usa il "copia e incolla".

Il "metodo universale" è il  "copia  e incolla": tutti sappiamo come funziona ed  è sicuramente  semplice ed immediato.

Ma è  anche il  metodo più efficiente?

Se vi fossero alcuni  documenti  già precedentemente trasferiti  ed altri da trasferire, occorrerebbe  selezionare manualmente quelli da trasferire prima di effettuare il "copia e incolla" e tale operazione potrebbe essere particolarmente lunga.

In casi come questi occorre cercare soluzioni più efficienti.

Queste soluzioni esistono ma sono un po' nascoste in quanto funzionano nella "Linea di Comando" del sistema operativo.


<a id="orgcde6e34"></a>

# Breve premessa sulla Linea di Comando in  MS Windows.

Cos'è la "linea di comando" di MS Windows?

I primi computer personali  utilizzavano un sistema operativo esclusivamente a linea di comando:  era denominato "MS-DOS".

Tutti i comandi dovevano essere digitati per esteso  sulla tastiera.

Naturalmente era necessario conoscere a memoria la corretta sintassi di ogni comando, almeno di quelli fondamentali come::

-   `DIR` Per visualizzare l'elenco dei file e delle sottodirectory in una directory.
-   `CD` Per cambiare la cartella corrente.
-   `MD` o `MKDIR` Per creare una nuova cartella.
-   `RD` o `RMDIR` Per rimuovere una cartella  vuota.
-   `COPY` Per copiare uno o più file da una posizione all'altra.
-   `DEL` Per cancellare documenti..

I comandi potevano essere digitati sia in maiuscolo che in minuscolo.

Dal 1990, con  Windows 3.0,  venne introdotta l'interfaccia grafica e si passò gradualmente dalla linea a comando alle finestre.

La linea di comando, tuttavia, non venne mai abbandonata.

Fino alla versione 8.1 di MS Windows rimase utilizzabile un emulatore di DOS denominato **Prompt dei Comandi**.

Da Windows 10 la linea di comando è stata potenziata con l'aggiunta di **Windows Power Shell**,  poi rinominata più semplicemente  **Terminale** in Windows 11, molto simile, per  funzionalità e versatilità,   al  terminale  di GNU/Linux.

Attenzione: occorre considerare che  i documenti cancellati nel terminale di MS Windows,  **non vengono spostati nel cestino** e,  di conseguenza, non possono essere  ripristinati contrariamente a quanto, invece, avviene con i sistemi operativi grafici.

In altri termini: le operazioni effettuate con l'interfaccia a linea di comando sono irreversibili.

Più avanti in questo articolo vi spiegherò come gestire questo problema.


<a id="orgc507ab1"></a>

# Due soluzioni integrate a linea di comando: xcopy e robocopy.

Dopo la breve premessa sulla "linea di comando" torniamo alla questione della copia dei documenti: MS Windows offre due soluzioni native a linea di comando:

-   `xcopy`
-   `robocopy`

La prima soluzione, `xcopy`,  è stata introdotta dai tempi remoti di  MS-DOS ed è, quindi, presente  sin dall'origine del  sistema operativo MS Windows.

La descrizione analitica in italiano del comando `xcopy` si trova in [questa pagina](https://learn.microsoft.com/it-it/windows-server/administration/windows-commands/xcopy) del produttore.

La seconda applicazione,  `robocopy`, è  più recente in quanto è stata introdotta nei sistemi operativi basati su  Windows NT 5.0, ovvero Windows 2000 e Windows XP.

Con `robocopy` è possibile effettuare operazioni molto più complesse ed articolate, tra cui il trasferimento dei dati filtrando soltanto quelli modificati rispetto ad analoghe precedenti operazioni di cui si è fatto cenno sopra.

Inoltre consente di effettuare copie  "a specchio"  ovvero che cancellano automaticamente dalle cartella di destinazione i dati non più presenti nella cartella di origine creando, appunto, *copie speculari*.

La descrizione analitica in italiano di `robocopy` si trova in [questa pagina](https://learn.microsoft.com/it-it/windows-server/administration/windows-commands/robocopy) del produttore .


<a id="orgaabc52e"></a>

# Schema base ed alcune  opzioni, tra le tante, del  comando robocopy.

Il comando `robocopy` ha molte opzioni, come analiticamente descritto nella [pagina del produttore.](https://learn.microsoft.com/it-it/windows-server/administration/windows-commands/robocopy)

Mi limito, quindi,  a menzionarne alcune per iniziare ad utilizzaare il comando.

Lo schema di  base è il seguente:

    robocopy sorgente destinazione documenti opzioni

Una notevole comodità è costituita dal fatto che i  percorsi possono essere inseriti anche tramite trascinamento del puntatore del mouse.

Il significato dello schema base  è autodescrittivo ma non tutte le parti sono necessario: le parti denominate *documenti* e *opzioni* sono  facoltative.

Se manca la parte denominata *documenti* viene applicato il parametro di *default* `*.*`.

Se, invece, fosse necessario effettuare operazioni su documenti specifici occorrerebbe indicarli in questo punto del comando.

Le opzioni sono&#x2026; *opzionali* e servono per operazioni mirate, come quelle di seguito descritte.

L'opzione `/E` copia tutto il contenuto della cartella in cui si trova il cursore e di tutte le sottocartelle, incluse quelle vuote.

Come mnemonico per tale opzione uso la parola *Extend*.

Per copiare tutte le cartelle e le sottocartelle con i relativi contenuti da  una sorgente ad una destinazione, occorre, pertanto, utilizzare il segunete schema di comando:

    robocopy sorgente destinazione /E

Ad esempio: per copiare tutto il contenuto della cartella Documenti dal disco C: ad una cartella di *backup* del disco D: si scriverebbe una formula simile a quella seguente:

    robocopy "C:\Users\UserName\Documents" "D:\Backup\Documents" /E

Il comando `robocopy` gestisce automaticamente la creazione delle sottocartelle  di destinazione.

I documenti vengono copiati in ordine alfabetico ma mantengono la data di creazione/modifica della cartella sorgente.

Il comando `robocopy`  non trasferisce i documenti identici (stessi attributi, dimensioni, timestamp) di default.

`Robocopy` stesso provvede,   senza alcuna specifica opzione, a neutralizzare i documenti uguali tra le due cartelle trasferendo solo quelli non esistono nella destinazione o che sono stati modificati più di recente nella cartella di origine.

Rimangono, tuttavia, i documenti già trasferiti in operazioni precedenti nella cartella di destinazione e che non sono più presenti nella cartella di origine.

Per effettuare il "clone a specchio" tra le due cartelle esiste, tuttavia,  l'opzione `/MIR`, come nel seguente schema di esempio:

    robocopy "C:\sorgente" "D:\destinazione" /MIR

L'opzione `/MIR`, che chiaramente trae origine dal termine inglese "MIRROR",  crea una copia speculare della struttura della directory di origine, eliminando documenti nella destinazione se sono stati eliminati nella sorgente.

Tale opzione gestisce anche le sotto-cartelle per cui non occorre aggiungere anche l'opzione /E. 

Tenendo conto di quanto sopra anticipato sulla irreversibilità dei comandi di testo, è opportuno avere la possibilità di simulare le operazioni prima di renderle effettive.

Per effettuare una simulazione  in Robocopy è sufficiente utilizzare l'opzione `/L`. 

Ad esempio: `robocopy C:\sorgente D:\destinazione /L` mostra l'effetto del comando senza effettuare alcun movimento effettivo.

Per procedere realmente basta inviare nuovamente lo stesso comando ma senza  l'opzione `/L`.


<a id="org8c757fd"></a>

# Robocopy e procedure batch.

Robocopy è perfettamente utilizzabile  all'interno di procedure *batch* in MS Windows, ad esempio per copiare il contenuto di varie cartelle di provenienza e destinazione, eseguire operazioni parallele oppure automatizzare i processi con parametri avanzati.

Ecco un piccolo esempio di utilizzo in *batch* di Robocopy per effettuare operazioni multiple:

    @echo off
    robocopy "C:\SourcePath-1" "D:\DestinationPath-1" /E /MT:8
    robocopy "C:\SourcePath-2" "D:\DestinationPath-2" /E /MT:8
    robocopy "C:\SourcePath-3" "D:\DestinationPath-3" /E /MT:8
    echo All Done!
    pause

-   `SourcePath-1/2/3`  indicano le cartelle del disco C di in cui si trovano i dati prima del comando.
-   `DestinationPath-1/2/3` indicano  le cartelle del disco D in cui occorre trasferire i dati con il comando.
-   L'opzione `/E`  (Extend) copia le sottocartelle. Deve, ovviamente, essere omesso se non ci sono dati in sottocartelle da copiare.
-   L'opzione `/MT:8` crea copie *multithread* con "n" *thread*.  Il valore predefinito è 8. Sostanzialmente serve ad incrementare le prestazioni.
-   Il comando `echo All Done!` avvisa che la procedura è terminata. Il testo può essere ovviamente personalizzato a piacere.
-   Il comando `pause` chiede di premere un tasto per uscire dalla procedura.

I comandi "batch" devono avere l'estensione `.bat` per essere eseguibili in Windows e possono essere lanciati sia nel (nuovo) Terminale (Windows Power Shell) che nel (vecchio) Prompt di Windows.

Tuttavia il Terminale,  per impostazione predefinita di sicurezza, non lancia i comandi dal percorso corrente.

Per superare tale impostazione è sufficiente, come peraltro avviene nel *bash* di Linux, utilizzare la sintassi `./comando.bat`, ovvero fare precedente il comando vero e proprio da un punto ed una barra obliqua, oppure lanciare espressamente il comando da un altra cartella riportando il percorso completo.

Il Prompt non ha, invece, questa impostazione di sicurezza, per cui è sufficiente lanciare il comando .bat senza alcun prefisso se ci si trova nella stessa cartella in cui è presente il comando.

Inoltre il comando può essere lanciato anche da Esplora File, ovvero dal gestore grafico di MS Windows: basta premere  il tasto destro del *mouse*  e selezionare *Apri* nel menù contestuale.

Per modificare il contenuto del comando .bat basta, invece, premere *Modifica* nel menù contestuale di Esplora File.


<a id="org5b6085c"></a>

# Robocopy e Rsync.

Si può affermare che `robocopy` in MS Windows funzioni in modo molto simile a `rsync` di GNU/Linux.

Entrambi sono strumenti potenti per la copia e la sincronizzazione di file e cartelle, con numerose opzioni per personalizzare il comportamento della copia.

Ecco alcune somiglianze:

-   Copia incrementale: Copiano solo i file che sono stati modificati o aggiunti, migliorando l'efficienza.
-   Opzioni di esclusione: Permettono di escludere specifici file o directory dalla copia.
-   Riconoscimento delle differenze: Riconoscono i file che non sono stati modificati e li lasciano intatti nella destinazione.
-   Robustezza: Entrambi possono gestire grandi quantità di dati e file di grandi dimensioni senza problemi.
-   Copia a  specchio: l'opzione `/MIR` di Robocopy, descritta in questo articolo, è perfettamente *speculare* all'opzione `--delete` di Rsync.


<a id="org86ba6fd"></a>

# FreeFileSync

Se non sono riuscito a convincervi ad utilizzare i programmi a linea di comando e voleste, quindi, utilizzare un sistema grafico *open source* vi consiglio [FreeFileSync](https://freefilesync.org/) che può essere facilmente installato in MS Windows, GNU/Linux e macOS.

Ma questa è un'altra storia&#x2026;

Grazie per l'attenzione.

