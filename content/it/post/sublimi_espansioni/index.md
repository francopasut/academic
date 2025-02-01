---
title: "LaTeX con Sublime Text e LaTeXools."
date: 2024-09-13
slug:  latex-sublime-text
categories:
  - Blog
tags:
  - Sublime Text
  - LaTeX
image:
  placement: 3
  preview_only: false 
  caption: 'Atti giudiziari in LaTeX'
---

<p align="center">
ABSTRACT
</p>

Articolo sull'utilizzo di Sublime Text per scrivere documenti complessi, in particolare atti giudiziari, in LaTeX.

<p align="center">
INDICE
</p>

- [1. Questo articolo tratta di LaTeX e Sublime Text.](#1-questo-articolo-tratta-di-latex-e-sublime-text)
- [2. La brutta notizia: LaTeXTools non è aggiornato.](#2-la-brutta-notizia-latextools-non-è-aggiornato)
- [3. Segnaposti e Variabili.](#3-segnaposti-e-variabili)
- [4. I cursori multipli.](#4-i-cursori-multipli)
- [5. Incollare liste di documenti copiate dalle cartelle.](#5-incollare-liste-di-documenti-copiate-dalle-cartelle)
- [6. Creare ed usare i segnalibri.](#6-creare-ed-usare-i-segnalibri)
- [7. La persistenza dei documenti aperti.](#7-la-persistenza-dei-documenti-aperti)
- [8. Snippet per la creazione delle Sezioni.](#8-snippet-per-la-creazione-delle-sezioni)
- [9. Un piccolo script utile.](#9-un-piccolo-script-utile)
- [10. La compilazione, visualizzatori e altri comandi.](#10-la-compilazione-visualizzatori-e-altri-comandi)
- [11. Conclusione.](#11-conclusione)

## 1. Questo articolo tratta di LaTeX e Sublime Text.

In questo articolo riprendo il tema della redazione di documenti strutturati, in particolare atti giudiziari, con il linguaggio LaTeX, già trattato in miei precedenti articoli, tra cui i seguenti:

- [LaTeX per atti giudiziari, configurazione di base](https://francopasut.blogspot.com/2018/12/latex-per-atti-giudiziari.html),
- [LaTeX e Atti Giudiziari, gestione degli elenchi documentali mediante elaborazione automatica dei dati alla rinfusa](https://francopasut.blogspot.com/2019/01/latex-e-atti-giudiziari-gestione-degli.html),
- [LaTeX e Atti Giudiziari: utilizzo del tag quote per citare giurisprudenza, norme e dottrina](https://francopasut.blogspot.com/2019/04/latex-e-atti-giudiziari-utilizzo-del.html),
- [LaTeX e Atti Giudiziari: creazione e utilizzo dei riferimenti incrociati](https://francopasut.blogspot.com/2019/03/latex-e-atti-giudiziari-creazione-e.html),
- [Atti giudiziari: utilizzare le variabili al posto dei nomi propri in Word, Writer e LaTeX](https://francopasut.blogspot.com/2018/10/atti-giudiziari-utilizzare-le-variabili.html),
- [LaTeX e PCT: atti giudiziari strutturati e ipertestuali](https://francopasut.blogspot.com/2017/03/uso-di-latex-per-la-strutturazione.html).

Pur essendo necessariamente strettamente connesso alla  mia attività quotidiana di redazione di atti giudiziari in LaTeX le stesse operazioni  possono essere  utili per qualsiasi genere di documento "strutturato".

La straordinaria qualità tipografica di LaTeX è fuori discussione.

Per gestire documenti complessi in LaTeX occorre, tuttavia, utilizzare *editor*  che consentano di effettuare velocemente una serie di operazioni tra cui:

- Saltare velocemente tra i titoli dei vari livelli di sezioni. 
- Compilare velocemente le variabili ed altri dati relati  saltando tra segnalibri preimpostati,
- Compilare velocemente il  codice sorgente ottenendo il PDF.
- Saltare  direttamente dal codice sorgente al PDF compilato e viceversa.
- Avere i documenti in fase di redazione sempre pronti senza perdere tempo a ricaricarli ogni volta.
- La persistenza dei documenti aperti quando si chiude l'editor.

Per editare gli atti giudiziari in LaTeX ho, da circa dieci anni,  quasi sempre usato  *Vim* (per circa il 75% dei miei scritti) o *Emacs* (per circa al 25% dei miei scritti), dopo un breve periodo iniziale con *TeXstudio*.

Di recente ho effettuato alcuni test  con [*Sublime Text*](https://www.sublimetext.com/), versione **3 e 4**.

All'inizio non mi ha entusiasmato ma,  dopo qualche mese, l'ho promosso ad editor principale per la scrittura di qualsiasi documento  strutturato in LaTeX, pur con un problema di fondo di cui farò cenno nel prossimo paragrafo.

In questo articolo non descrivo le fasi di installazione e configurazione, per le quali si trova ampia documentazione in rete, ma tratto delle soluzioni utili  per utilizzare *Sublime Text* per scrivere documenti in LaTeX, con il *plugin* *LaTeXTools*.

## 2. La brutta notizia: LaTeXTools non è aggiornato.

Il più noto *plugin* di *Sublime Text* per LaTeX  è *LaTeXTools*.

La brutta notizia è che *LaTeXTools* non è aggiornato da circa **sei anni**!

La pagina di [SublimeText/LaTeXTools su GitHub](https://github.com/SublimeText/LaTeXTools/) reca il seguente avviso: *Latest revision: v3.15.1 (2018-04-23)*.

Nella stessa pagina viene, altresì, dichiarato, che l'ultima versione disponibile è  compatibile con *Sublime Text **2 e 3** e non, quindi, con la **versione 4**.

Tuttavia,  per quanto mi risulti,   il *plugin* funziona ancora bene,  anche nella **versione 4** di *Sublime Text*.

## 3. Segnaposti e Variabili.

La prima operazione da effettuare nella preparazione di un atto giudiziario è quella della compilazione dei dati dei soggetti e del procedimento.

In  versione "zero" è, ovviamente, possibile inserire tutto semplicemente  a mano senza alcun "sistema".

In una versione più evoluta è possibile, tuttavia, un approccio che salti automaticamente nei vari punti chiave del documento e che consenta, altresì,  di replicare i dati in qualsiasi altro punto del documento **senza ripetere i nomi propri**.

In questo modo si riduce drasticamente il tempo e si evita il rischio di errori.

Una buona soluzione è costituita dall'utilizzo delle variabili e dei segnaposto da inserire   nei punti "strategici" di  modelli di base da preparare per i vari atti,  ad esempio  per le citazioni, le comparse di costituzione, gli appelli o, più in generale, per qualsiasi altro documento.

Per quanto concerne le variabili in LaTeX richiamo [questo mio precedente articolo](https://francopasut.netlify.app/it/post/latex_variables/).

Quindi: le variabili sono *comandi* che consentono di utilizzare stringhe di testo che vengono sostituite, in fase di compilazione, dai dati reali.

Le variabili devono essere create nel "preambolo" dei documenti.

I segnaposto, invece, sono frammenti di testo sparsi per i documenti che consentono di saltare velocemente tra i vari punti da riempire con i dati reali.

Per utilizzare i segnaposto in LaTeX tramite *Sublime Text* occorre, in primo luogo, pensare ad   una stringa di testo che non possa essere utilizzata come contenuto effettivo del documento.

Un'ottima  stringa da utilizzare come "segnaposto" è `<++>`.

Se i segnaposto fossero associati a variabili dovrebbero, ovviamente, essere anch'essi collocati nel preambolo, come nell'esempio seguente:

```tex
\newcommand{\name}{<++>}
\newcommand{\reg}{<++>}
\newcommand{\trib}{<++>}
\newcommand{\where}{<++>}
```

La creazione di variabili consente di replicare i dati reali all'interno del documento, come già illustrato nel mio articolo sopra indicato.

Se, invece, i segnaposto non fossero associati a variabili dovrebbero essere "sparsi"  nel documento, ovvero tra i tag `\begin{document}` ed `\end{document}` nei punti dove si desidera "saltare" con il cursore per inserire altri i dati reali.

Il riempimento avviene "saltando" tra i vari segnaposto  inserendo, solo la prima volta,  la  stringa `<++>`  nel campo *Cerca* attivabile  con `Ctrl-f`, valorizzando il primo segnaposto con i dati reali, anche con "copia e incolla",  reiterando l'operazione  con `F3` (`Shift-F3`, in caso sia necessario andare all'indietro), saltando, mano a mano, in  tutti i segnaposto "pre-collocati" nel  documento.

In questo modo la compilazione iniziale è velocissima e  la replica nomi propri avviene utilizzando NON i dati reali ma le variabili **evitando il rischio di errore di digitazione**.

## 4. I cursori multipli.

La funzionalità dei *cursori multipli* è stata introdotta da Sublime Text 2  nel 2011 e consente di posizionare più cursori nel testo per modificare contemporaneamente più punti dei documenti.

L'esempio tipico è quello delle liste testimoniali o  documentali che in LaTeX vengono inserite negli ambienti `\begin{enumerate} ... \end{enumerate}` oppure `\begin{itemize} ... \end{itemize}` e che, quindi, devono essere completate con l'inserimento del tag `\item` all'inizio di ogni elemento della lista.

Pensate a dovere inserire la stringa di testo "*\\item*" in una lista contenente di decine o centinaia di elementi: il tempo "perso" potrebbe essere molto elevato, così come il rischio di compiere errori di battitura con conseguenti errori segnalati durante la fase di compilazione ed ulteriori perdite di tempo per la ricerca degli errori bloccanti!

I cursori multipli consentono di annullare ogni "perdita di tempo" a prescindere dal numero di elementi presenti nelle liste  e di eliminare i rischi di errori.

Per questo specifico argomento ho scritto un articolo dedicato che trovate a questo indirizzo: [Vim, Sublime Text, Visual Studio Code ed i cursori multipli](https://francopasut.netlify.app/it/post/vim_sublime_vsc_multicursors/).

In sintesi, per quanto concerne *Sublime Text*:

- `Ctrl+Mouse_Click` per la creazione di cursori multipli nei punti in cui si trova il puntatore.
- `Ctrl+shift+l` per aggiungere un cursore multiplo in ciascuna riga di un'area evidenziata.
- `Ctrl+Shift+Space` per espandere una regione all'interno di una coppia di parentesi
- `Ctrl+d` per replicare l'espansione, utile per  modificare velocemente i tag di ambiente (ad esempio per passare da `enumerate` a `itemize`).
- `Home` **premuto due volte** per riportare tutti i cursori all'inizio delle righe con ritorni a capo.
- `End`  **premuto due volte** per riportare tutti i cursori alla fine delle righe con ritorni a capo.
- `Esc`  **premuto una o due volte** oppure  *click* con il *mouse* in qualsiasi punto del documento  senza  `Ctrl` per uscire dalla modalità multipla.

In Vim esiste un sistema integrato analogo, `Ctrl+v`, `I`, scrittura, `Esc`, ed è possibile installare un *plugin* che fornisce una soluzione molto simile a quella sopra descritta.

## 5. Incollare liste di documenti copiate dalle cartelle.

Un'operazione molto frequente  degli atti giudiciari è quella di importare liste di documenti memorizzati all'interno di una cartella per creare l'elenco dei documenti prodotti in calce all'atto.

Per esempio: abbiamo una serie di documenti (doc 01, doc 02, doc ..) in una cartella e doppiamo riportare l'elenco dei documenti all'interno dell'atto.

In Vim esiste una funzione integrata: ipotizzando che la lista da importare si trovi in *Document*, il comando di Vim è il seguente `:r! ls Document`.

In *Sublime Text* non esiste un comando simile ma si può ottenere lo stesso risultato utilizzando due semplici soluzioni.

Una prima soluzione è quella del terminale di Linux, (Prompt o Power Shell di Windows).

Si procede come segue: si apre un terminale, si naviga fino alla cartella desiderata e si utilizza il comando `ls -1 > list.txt` in Linux oppure `dir / > list.txt` in Windows per generare l'elenco dei file.

È anche possibile trascinare la cartella di destinazione da Esplora File per avere il percorso completo nel *prompt* senza doverlo digitare manualmente.

Le opzioni `-1` e `/b` eliminano, in Linux e Windows, i percorsi e consentono, quindi,  di risparmiare tempo dopo l'importazione delle liste.

L'opzione `>` reindirizza l'output si genera il *file* con l'elenco.

A questo punto basta aprire il *file* con *Sublime Text*, copiare ed incollare il contenuto nel documento in elaborazione.

Funziona, ma non è la soluzione più veloce.

La soluzione, a mio avviso, migliore è quella di sfruttare una caratteristica un po' "nascosta" dei sistemi operative Windows e Linux (non ho effettuato prove su macOS).

Da Windows 7 in poi è possibile copiare le liste *file* in una cartella  al posto dei *file* stessi.

Per salvare **non** i *file* ma il **percorso**  dei *file*, compreso il proprio nome,  occorre semplicemente selezionarli tenendo il tasto *Shift*-Maiuscolo premuto e, nel menù contestuale con il tasto destro del *mouse* scegliere "*Copia come percorso*".

Il percorso può, ovviamente,  essere incollato in qualsiasi documento in fase di elaborazione, anche con sistemi  di *editing* diversi da *Sublime Text* o da *Vim*.

In GNU/Linux, invece, basta semplicemente selezionare i documenti dal *Gestore dei File*, copiare l'elenco dal menù contestuale del tasto destro del *mouse* ed incollarlo nel documento.

In pratica in Linux non occorre tenere premuto il tasto *Shift-Maiuscolo*.

Dopo avere incollato il percorso in un documento aperto è sufficiente eliminare i frammenti eccedenti, magari utilizzando la funzione dei "cursori multipli" sopra descritta,  e **la lista è pronta**!

## 6. Creare ed usare i segnalibri.

A volte è necessario fissare un  punto specifico di un  documento aperto per ritornare velocemente in quel punto dopo avere effettuato operazioni altrove.

Questo è il ruolo dei *segnalibri*, da non confondere con i *segnaposti* sopra menzionati.

Anche in questo caso *Sublime Text* e molto efficiente: basta fissare il  *segnalibro* premendo la combinazione   `Ctrl+f2` per poi tornare a quel punto con `f2` o `Shift+f2` (se segnalibro fosse all'indietro del punto corrente).

Per cancellare il segnalibro si preme  ancora `Ctrl+f2` quando il cursore è piazzato esattamente sopra il segnalibro (ovvero dopo avere raggiunto il segnalibro con  `f2`.

Se nel documento fosse presente un solo segnalibro, allora la pressione del tasto funzione `f2` porterebbe esattamente in tale punto.

Se, invece, fossero presenti più segnalibri, il comando `f2` (in avanti) o `Ctrl+f2` (all'indietro) salterebbero ciclicamente da segnalibro in segnalibro fino ad arrivare a quello voluto.

## 7. La persistenza dei documenti aperti.

Un caratteristica a suo tempo innovativa, poi divenuta *standard* su altri editor, come Visual Studio Code, è la persistenza delle pagine aperte **anche senza necessità di salvare** quando si chiude l'editor.

In altri termini basta lasciare aperti i documenti quando si chiude *Sublime Text* per ritrovarli già pronti per digitazione al riavvio dell'editor.

Ciò permette di aprire varie bozze di documenti, di lavorare progressivamente a documenti aperti, navigando tra di essi con il comando *go to everywhere*, ovvero `Ctrl+p` di *Sublime Text* e di ritrovare tutto al punto in cui l'avete lasciato **senza necessità di salvare in uscita**.

Per chi conosca Vim, una funzione analoga è quella del salvataggio con `:mksession` ed il ripristino con `:source`.

Nel caso di *Sublime Text*, tuttavia, non occorre effettuare alcuna operazioni aggiuntiva se non la semplice chiusura e riapertura dell'editor.

## 8. Snippet per la creazione delle Sezioni.

Con il plugin *LateXTools* è disponibile anche la creazione assistita delle Sezioni e degli altri livelli subordinati.

Per l'attivazione dei relativi *snippet* basta inserire le prime tre o quattro lettere dei *tag* senza la barra iniziale.

Quindi si inserisce la stringa di testo  `sec` (senza barra iniziale)  e si preme  il tasto *Tab* per avere il completamento con il titolo della sanzioni ed anche l'etichetta (opzionale).

Per le sottosezioni si usa la stringa `sub` e per le sotto-sotto-sezioni `subs`.

## 9. Un piccolo script utile.

Ho trovato in rete uno *script* che consente di potenziare lo spostamento del cursore  tra paragrafi separati da righe vuote.

In pratica estende i movimenti emulando  il funzionamento dei comandi `{` e `}` di *Vim* e `Alt+a` e `Alt+e` di *Emacs*.

Funziona anche per selezionare le relative regioni di testo.

Lo *script* si trova descritto in  [questa pagina](https://superuser.com/questions/1407180/in-sublime-text-how-can-i-jump-and-select-to-the-next-empty-line-between-paragr).

Riduce di molto i tempi di spostamenti tra i paragrafi separati da righe bianche, che sono lo standard di LaTeX per andare a capo.

## 10. La compilazione, visualizzatori e altri comandi.

Siamo arrivati alla fase finale, ovvero la compilazione del documento in LaTeX e la visualizzazione in anteprima su un lettore PDF collegato all'editor.

Prima di lancare la compilazione occorre controllare che il *Build System*, nel menu *Tools*,  sia su "Automatic" o su "LaTeX", come da immagine seguente:

![build_system](sublime-text-build-system.png)

La compilazione è molto semplice: basta premere la combinazione di tasti `Ctrl+b`.

Subito dopo la compilazione, salvo errori,  viene lanciato il visualizzatore PDF collegato all'editor.

Per la configurazione e l'utilizzo dei vari visualizzatori PDF supportati da *Sublime Text* rimando alla [pagina dedicata di LaTeXTool](https://github.com/SublimeText/LaTeXTools/blob/master/docs/available-viewers.md).

Sotto Windows il visualizzatore ideale è Sumatra. Sotto Linux, escludendo Zathura che vive in "simbiosi" con Vim, consiglio Okular.

Per cancellare i file accessori: `Ctrl+l backspace`.

Infine: per ulteriori comandi di LaTeXTools rimando a [questa pagina](https://latextools.readthedocs.io/en/latest/keybindings/).

## 11. Conclusione.

Questo sono alcuni piccoli consigli che possono aiutare a scrivere documenti in LaTeX con Sublime Text.

Ne esistono molti altri ma questi sono i fondamentali.

Quindi:  *Sublime Text* al posto di *Vim* per la redazione dei document in LaTeX?

*Vim* è come la Ferrari: semplicemente imbattibile.

*Sublime Text* è, in ogni caso, un'ottima soluzione per scrivere documenti in LaTeX, con un piccolo problema connesso all'aggiornamento di alcuni *plug-in*, tra cui proprio quello necessario per scrivere in LaTeX, come descritto in questo articolo.

Occorre anche considerare  che *Sublime Text*, contrariamente a *Vim*, *Visual Studio Code* ed *Emacs*,  non è gratuito e che, quindi, in caso di uso frequente richiede il pagamento della licenza.

Questo articolo è stato scritto con Vim e Visual Studio Code che sono ancora i miei preferiti per il linguaggio Markdown.

Grazie per l'attenzione.
