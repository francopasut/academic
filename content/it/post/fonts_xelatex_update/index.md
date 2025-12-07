---
title: "Atti giudiziari, Font, XeLaTeX. Parte seconda."
date: 2025-12-06
slug:  fonts-xelatex-update
categories:
  - Blog
tags:
  - XeLaTeX
  - Atti giudiziari
  - Font
image:
  placement: 3
  preview_only: false 
  caption: 'Caratteri tipografici'
canonicalUrl: https://francopasut.blogspot.com/2025/12/atti-giudiziari-font-xelatex-parte.html   
---


- [1. LaTeX,  XeLaTeX e font per gli atti giudiziari.](#1-latex--xelatex-e-font-per-gli-atti-giudiziari)
- [2. LaTeX e XeLaTeX: non solo *font*.](#2-latex-e-xelatex-non-solo-font)
- [3. Nuovi font in cartella NON di sistema.](#3-nuovi-font-in-cartella-non-di-sistema)
- [4. La questione  Aptos.](#4-la-questione--aptos)
- [5. New Century Schoolbook, ottimo grande e leggibile.](#5-new-century-schoolbook-ottimo-grande-e-leggibile)
- [6. Garamond, il ritorno.](#6-garamond-il-ritorno)
- [7. Quindi qual è il font consigliato?](#7-quindi-qual-è-il-font-consigliato)


# 1. LaTeX,  XeLaTeX e font per gli atti giudiziari.

LaTeX è un sistema di impaginazione  incredibilmente veloce, efficiente e gratuito. Utile a chiunque debba scrivere documenti allo stato dell'arte  tipografica.

Esiste un sistema di scrittura ancora più efficiente e rapido di LaTeX per la scrittura di documenti complessi? La risposta è sì:  LaTeX con font esterni, ovvero XeLaTeX.

Ho già dedicato un [mio articolo](https://francopasut.netlify.app/it/post/atti_giudiziari_font_xelatex./)  all'utilizzo di XeLaTeX per la redazione di atti giudiziari con *focus* sulla scelta del *font* che ritenevo più adatto al Processo Civile Telematico.

Tuttavia, anche dopo la pubblicazione di quell'articolo ho continuato ad effettuare prove e comparazioni sulle caratteristiche di leggibilità ed eleganza dei testi processuali.

In questo articolo riporto  una sintesi dei nuovi  test con la nuova soluzione.

L'immagine di copertina è di [Brett Jordan](https://www.pexels.com/it-it/foto/tipografia-documento-carta-testo-5045981/) ed è stata tratta da Pexels, *Le foto gratuite, immagini e video esenti da royalty migliori condivisi dai creator*. 

# 2. LaTeX e XeLaTeX: non solo *font*.

C'è un particolare che nel mio precedente articolo non ho menzionato.

Oltre alla caratteristica dell'utilizzabilità dei tipi di carattere, che costituisce la differenza fondamentale tra LeTeX e XeLaTeX, c'è un'altra piccola differenza tra i due sistemi di cui non ho trovato traccia in rete: la compilazione del simbolo dei  numeri ordinali maschili (non di quelli femminili, come sarà chiarito tra poco).

La digitazione diretta nel testo sorgente del simbolo dei numeri ordinali maschili, ovvero  il carattere "°", in LaTeX non è ammessa e provoca errore in fase di compilazione.

Stranamente, invece, la digitazione da tastiera del  simbolo dei numeri ordinali femminili, ovvero il carattere "ª", viene compilata senza alcun errore.

Al posto dell'ordinale maschile  occorre usare il  comando specifico del linguaggio, cioè "`\textordmasculine`".

Anche l'ordinale femminile può essere ottenuto, oltre che da tastiera, con il relativo comando che è  "`\textordfeminine`".

Invece in XeLaTeX non ci sono problemi per la digitazione da tastiera del simbolo del numero ordinale sia maschile che femminile.

Nei documenti con molti numeri ordinali maschili questo particolare di XeLaTeX  può fare una "certa differenza" in termini di velocità di scrittura.

Naturalmente in XeLaTeX funzionano anche i rispettivi comandi del linguaggio sopra indicati, ovvero 
"`\textordmasculine`" e "`\textordfeminine`".


# 3. Nuovi font in cartella NON di sistema.

Ogni sistema operativo ha un suo *set* di font preinstallato e disponibile per ogni applicazione, tra cui XeLaTeX.

Però potrebbe essere utile rendere disponibile a XeLaTeX altri font rispetto a quelli preinstallati.

Perché il *path*?

Se anche  i nuovi *font* fossero inseriti nella cartella dedicata di ogni sistema operativo, non sarebbe necessaria alcuna operazione particolare.

Tuttavia a volte, soprattutto nei computer aziendali,  non è possibile modificare il contenuto delle cartelle di sistema, tra cui vi è anche quella dedicata ai *font*.

Quindi occorre configurare XeLaTeX in modo che abbia un proprio percorso di ricerca dei *font* indipendente da quello del sistema operativo.

In termini più tecnici: è necessario inserire un "*path*" personalizzato ed esclusivo per XeLaTeX ovvero un percorso contenente i tipi di caratteri aggiuntivi.

Questa personalizzazione deve essere inserita nel preambolo del documento che andrà compilato con XeLaTeX.

In questi casi l'installazione su cartella personale consente di utilizzare *font* aggiuntivi rispetto a quelli di sistema senza violare i blocchi imposti.

Ho dovuto utilizzare questa soluzione per la prova sul carattere *aptos*, come sarà descritto al paragrafo [4](#4-la-questione--aptos) di questo articolo.


# 4. La questione  Aptos.

Il font Aptos è un carattere sans-serif moderno, chiaro e leggibile,  adottato da Microsoft nel 2023 come nuovo font predefinito di Office (attenzione: di Office, non di Windows), sostituendo Calibri.

È ispirato alla tipografia svizzera degli anni '50 e progettato per essere universale, piacevole da leggere e adatto sia al digitale che alla stampa.

![img](./MEMORIA-PROVA-APTOS-BASE-crop.png "Bozza di atto giudiziario in XeLaTeX con font Aptos")

Vogliamo provare Aptos in XeLaTeX?

Essendo il *font di default* ci si aspetterebbe che sia utilizzabile anche con applicazioni diverse rispetto a quelle sviluppate dalla stessa Microsoft.

Tuttavia è possibile, come ho potuto direttamente constatare, che non sia presente nella cartella di sistema *c:/Microsoft/font*.

A questo punto occorrerebbe installare il *font* ma per fare questo occorre avere i  diritti di amministratore.

In mancanza, occorre richiamare il paragrafo [3](#3-nuovi-font-in-cartella-non-di-sistema) di questo articolo, collocando i font della famiglia in una cartella accessibile all'utente.

Riprendendo la premessa contenuta nel paragrafo [3](#3-nuovi-font-in-cartella-non-di-sistema), riporto il  frammento  da inserire nel preambolo di un documento in XeLaTeX per utilizzare Aptos in una cartella personalizzata, come quella indicata nella prima riga del codice seguente:

    \setmainfont[Path = C:/Users/fpasut/AppData/Local/Microsoft/Windows/Fonts/,
    Extension = .ttf,
    UprightFont = Aptos,
    BoldFont = Aptos-Bold,
    ItalicFont = Aptos-Italic,
    BoldItalicFont = Aptos-Bold-Italic
    ]{}

Ovviamente lo stesso frammento può essere utilizzato per qualsiasi altro tipo di carattere.

In un sondaggio condotto con i miei collaboratori, Aptos ha ottenuto la maggioranza delle preferenze sulla leggibilità.

Funziona benissimo nel suo ambiente naturale, ovvero in Microsoft 365, ma in ambiente XeLeTeX pone qualche problema.

Il problema deriva dalle anomalie visualizzate dopo il  copia/incolla dei documenti in PDF compilati: molte parole risultano "incollate" tra loro.

In pratica, è lo stesso problema che ho descritto e documentato (ma allora era riferito a Garamond) in [questa sezione del mio precedente articolo](https://francopasut.netlify.app/it/post/atti_giudiziari_font_xelatex./#4-garamond-elegante-ma-con-un-difetto-importante).

Inoltre,  la medesima operazione di copia/incolla  genera punti di domanda in corrispondenza delle legature.

Quindi Aptos, sia pure nella propria chiarezza e leggibilità, non è utilizzabile per atti compilati da XeLaTeX da depositare nei processi telematici, come il Processo Civile Telematico ed il Processo Tributario Telematico.


# 5. New Century Schoolbook, ottimo grande e leggibile.

Non ne avevo mai sentito parlare prima del mio precedente articolo.

New Century Schoolbook è veramente un ottimo tipo di carattere, creato proprio per facilitare la lettura.

Presenta dimensione dei caratteri più larghi rispetto ad altri font comuni, una spaziatura tra lettere maggiore e forme più arrotondate e semplificate.

Queste caratteristiche lo rendono molto leggibile tanto da essere spesso preferito in ambito accademico e legale (secondo alcune fonti la Corte Suprema degli Stati Uniti ne richiederebbe l’uso per le sue sentenze).

![img](./MEMORIA-PROVA-CENTURY-crop.png "Bozza di atto giudiziario con font New Century Schoolbook")

L'ho usato per vari mesi, prima del "ritorno" di Garamond che ha un livello di eleganza irraggiungibile da altri *font*, come descritto nel prossimo capitolo.


# 6. Garamond, il ritorno.

Garamond è veramente molto elegante oltre che leggibile e leggero

Pare che la delicatezza dei tratti di Garamond consenta addirittura di risparmiare circa un quarto dell'inchiostro nella stampa su carta rispetto ad altri font di uso comune.

Tuttavia, nonostante tali qualità, nell'[articolo precedente](https://francopasut.netlify.app/it/post/atti_giudiziari_font_xelatex./#4-garamond-elegante-ma-con-un-difetto-importante) lo avevo scartato a causa di un difetto rilevante: la copia del testo dal PDF generava l'effetto "parole incollate", già menzionato  sopra a proposito di Aptos.

Ho provato più volte, quindi, a correggere quel difetto per "recuperare" Garamond.

Dopo avere escluso le legature ed  avere leggermente aumentato le dimensioni del carattere di  due e tre decimi rispetto alla versione base (che si traduce, nel codice sotto riportato, nell'opzione  Scale 1.2 oppure,  1.3), non ho riscontrato più alcun problema.

Per l'argomento delle "legature" richiamo [questo paragrafo di un mio articolo](https://francopasut.netlify.app/it/post/atti_giudiziari_latex_base/#5-la-questione-delle-legature).

Riporto, quindi, la stringa di configurazione:

    \setmainfont[Ligatures = NoCommon,Scale = 1.2]{Garamond}

![img](./MEMORIA-PROVA-GARAMOND-MODIFICATA-crop.png "Bozza di atto giudiziario con Garamond modificato")


# 7. Quindi qual è il font consigliato?

A seguito dei vari test, come sopra brevemente descritti, ho *adottato*, per i miei atti giudiziari, scritti in XeLaTeX, la versione di Garamond modificata e leggermente ingrandita, senza legature.

Anche New Century Schoolbook è un'ottima soluzione anche se Garamond conferisce un tocco di eleganza aggiuntiva.

Con Garamond "modificato" non ho avuto, sono ad oggi, più alcun problema nel *copia/incolla* dei caratteri tratti dai documenti in PDF compilati da XeLaTeX.

Grazie per l'attenzione.

