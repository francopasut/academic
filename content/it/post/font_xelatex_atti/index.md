---
title: "Atti giudiziari, Font, XeLaTeX."
date: 2025-02-09
slug:  atti_giudiziari_font_xelatex.
categories:
  - Blog
tags:
  - Emacs
  - XeLaTeX
  - Processo Civile Telematico
  - PCT
image:
  placement: 3
  preview_only: false 
  caption: 'Computer e Atti Giudiziari'
canonicalUrl: https://francopasut.blogspot.com/2025/02/atti-giudiziari-font-xelatex.html
---

- [1. Premessa](#1-premessa)
- [2. I caratteri di tipo corrente.](#2-i-caratteri-di-tipo-corrente)
- [3. TIMES NEW ROMAN: il piu usato.](#3-times-new-roman-il-piu-usato)
- [4. GARAMOND, elegante ma con un difetto importante!](#4-garamond-elegante-ma-con-un-difetto-importante)
- [5. ARIAL: squadrato e con un piccolo difetto di confusione.](#5-arial-squadrato-e-con-un-piccolo-difetto-di-confusione)
- [6. CALIBRI ed HELVETICA: anche questi un po' squadrati.](#6-calibri-ed-helvetica-anche-questi-un-po-squadrati)
- [7. COURIER NEW, ottimo per le bozze.](#7-courier-new-ottimo-per-le-bozze)
- [8. VERDANA: perfetto!](#8-verdana-perfetto)
- [9. A proposito di XeLaTeX.](#9-a-proposito-di-xelatex)
- [10. Conclusione](#10-conclusione)


# 1. Premessa

L'aspetto tipografico degli atti giudiziari civili è attualmente regolamentato dal   Decreto Ministeriale n. 110 del 7 agosto 2023 "*Regolamento per la definizione dei criteri di redazione, dei limiti e degli schemi informatici degli atti giudiziari con la strutturazione dei campi necessari per l'inserimento delle informazioni nei registri del processo, ai sensi dell'articolo 46 delle disposizioni per l'attuazione del codice di procedura civile*" (GU n.187 del 11-08-2023).

Il riferimento specifico ai *font* è contenuto all'art. 6 che si riporta:

    Tecniche redazionali
    1. Gli atti sono redatti mediante caratteri di tipo corrente, preferibilmente:
    a) utilizzando caratteri di dimensioni di 12 punti;
    b) con interlinea di 1,5;
    c) con margini orizzontali e verticali di 2,5 centimetri.
    2. Non sono consentite note, salvo che per l'indicazione dei precedenti giurisprudenziali nonché dei riferimenti dottrinari.

La caratteristica  di tale norma è quella di  **non indicare espressamente** un *font*, ma di prevedere soltanto la necessità che sia "*di tipo corrente*".

Cosa significa "di tipo  corrente"?


<a id="org3e4139a"></a>

# 2. I caratteri di tipo corrente.

Per rispondere alla domanda precedente ho provato a formulare un *prompt* a Gemini che mi ha risposto come segue:

> Gli atti giudiziari devono essere redatti utilizzando ****caratteri di tipo corrente**** per garantire la leggibilità e la chiarezza del testo.
> 
> Con l'espressione "carattere di tipo corrente" si fa riferimento a caratteri facilmente leggibili, come **Times New Roman, Arial, Calibri o Verdana**, che non alterano la forma delle lettere e non rendono difficoltosa la lettura.
> 
> Per intenderci, sono da evitare tutti quei caratteri grafici (ad esempio corsivo, gotico, o con effetti 3D) che rendono più difficile la lettura, privilegiando sempre l'aspetto pratico dell'atto.

Pertanto il DM **non esprime** alcun nome di *font* ma stabilisce soltanto una proprietà necessaria.

Rimane, quindi, da verificare quale sia, tra i *font correnti* quello che offra la migliore leggibilità negli atti processuali.

Ho confrontato   vari frammenti di un ipotetico frontespizio di atto giudiziario, scritto con  [XeLaTeX](#orgee6e28f).

I frammenti sono rispettivamente basati  sulle seguenti famiglie di caratteri: Times New Roman,  Garamond, Arial, Calibri, Helvetica,  Courier New, e Verdana.

Ho omesso di descrivere analiticamente ogni singolo *font* in quanto le relative  informazioni sono facilmente reperibili in rete.

Questo articolo è una semplice riflessione derivante da una quotidiana attività di redazione di atti giudiziari.

Il nome del Tribunale utilizzato nei modelli è, ovviamente, inventato (in particolare è ispirato al romanzo "Il giuoco delle perle di vetro" di Hermann Hesse).


<a id="org31c8f60"></a>

# 3. TIMES NEW ROMAN: il piu usato.

![img](./TIMES_NEW_ROMAN-ATTO-XELATEX-crop.png)

È molto probabilmente il *font*  più diffuso in quanto utilizzato di *default* in noti programmi di videoscrittura.

Per essere leggibile è leggibile, però il suo utilizzo "di massa", anche inconsapevole, lo rende un tantino "banale".

Una curiosità: è stato creato nel 1932 per il quotidiano Times ma, dal 2007, è stato abbandonato proprio dal Times per una versione più moderna (ovvero "Times Modern").

Quindi, è un *font* "vecchio" e, per i miei gusti,  un po' troppo "ornato".


<a id="orgcdb0dbd"></a>

# 4. GARAMOND, elegante ma con un difetto importante!

![img](./GARAMOND-ATTO-XELATEX-crop.png)

Garamond è decisamente molto elegante ma ha un difetto rilevante: la copia del testo dal PDF, requisito essenziale per il Processo Civile Telematico, a volte genera un fastidiosissimo effetto "parole incollate".

Per esemplificare, il seguente frammento scritto in Garamond copiato dal PDF ed incollato in un documento da editare:

> Piaccia al Tribunale Ill.mo adito rigettare il ricorso proposto da TIZIO

è stato trasformato come segue:  

> PiacciaalTribunaleIll.moaditorigettareilricorsopropostodaTIZIO

Lo stesso frammento scritto in  Times New Roman è stato, invece, correttamente copiato ed incollato, senza alcuna "sorpresa".

In un sistema in cui è normativamente prevista la possibilità di estrarre i contenuti dai PDF questo difetto è tale da rendere inutilizzabile il *font* in questione.


<a id="org8acf591"></a>

# 5. ARIAL: squadrato e con un piccolo difetto di confusione.

![img](./ARIAL-ATTO-XELATEX-crop.png)

Font squadrato, ottimo per la targhe segnaletiche  o didascalie in mostre e musei.

Inoltre, per quanto riguarda gli atti giudiziari come per qualsiasi altro documento articolato, presenta un piccolo problema.

In particolare: i caratteri "i" maiuscolo e "l" minuscolo sono assolutamente uguali, come risulta dalla prima riga di contenuti riportate nell'immagine. Solo il contesto può, quindi, dirimere il dubbio.

In un ambito, come quello giudiziario,  in cui occorre evitare ogni potenziale dubbio di lettura, tale piccolo difetto può fare la differenza.


<a id="org3b1cdb7"></a>

# 6. CALIBRI ed HELVETICA: anche questi un po' squadrati.

Di seguito,  prima  il CALIBRI e, poi, l'HELVETICA:

![img](./CALIBRI-ATTO-XELATEX-crop.png)

<div class="org-center">
<hr />
</div>

![img](./HELVETICA-ATTO-XELATEX-crop.png)

Per Calibri ed Helvetica valgono le stesse considerazioni già svolte per ARIAL, ivi compresa l'osservazione sulla I maiuscola e la l minuscola.


<a id="org83fec8d"></a>

# 7. COURIER NEW, ottimo per le bozze.

![img](./COURIER_NEW-ATTO-XELATEX-crop.png)

È il *font* che piu si avvicina alla vecchia macchina da scrivere meccanica.

La caratteristica di base è quella di essere *monospazio* in quanto le varie lettere occupano sempre lo stesso spazio sul foglio.

In pratica le lettere "i" ed "m" occupano lo stesso spazio.

Utile, quindi, per incolonnamenti in cui i gruppi di caratteri devono essere perfettamente allineati verticalmente.

Non può essere definito  un *font* elegante ma ha il pregio di essere  facile da leggere.

In particolare  offre una visualizzazione immediata dei titoli delle sezioni e delle parti in neretto.

Il suo ambiente naturale è, quindi, costituito dalle bozze di atti e documenti.


<a id="orgd8ca336"></a>

# 8. VERDANA: perfetto!

![img](./VERDANA-ATTO-XELATEX-crop.png)

Verdana è il *font*  più chiaro e leggibile tra quelli provati in questo articolo.

Non è né  troppo ornato (vedasi Times New Roman) né non troppo squadrato (vedasi Arial).

È solido ma non troppo.

In sintesi: "buca" il  monitor come nessun altro *font*.

Al momento è il mio preferito.


<a id="orga5e25ae"></a>

# 9. A proposito di XeLaTeX.

Tutte le prove sono state realizzate con  XeLaTeX.

XeLaTeX è un motore di composizione tipografica, evoluzione del sistema TeX, che funzione con un  linguaggio di marcatura molto simile a LaTeX ma con l'aggiunta della  gestione esplicita dei *font*.

Le stesse prove possono, ovviamente, essere realizzate con qualsiasi programma di videoscrittura.

Riporto il frammento di codice in XeLaTeX, configurato su Verdana, ovvero il mio *font* preferito.

``` tex
\documentclass[12pt,a4paper]{article}
\usepackage[a4paper,top=2.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm]{geometry}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[italian]{babel}
\usepackage{fontspec}
\setmainfont{Verdana}
\usepackage{sectsty}
\allsectionsfont{\centering}
\usepackage{indentfirst}
\usepackage{paralist}
\usepackage{microtype}
%\DisableLigatures{}
\usepackage[doublespacing]{setspace} %Fissa l'interlinea ad 1,5
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage[official]{eurosym}
\usepackage{booktabs}
\usepackage{caption}
\usepackage[font=itshape]{quoting}
\usepackage{enumitem}
\usepackage{comment}
\usepackage[hidelinks]{hyperref}
%\usepackage{hyperref}
\pagestyle{empty}
\usepackage{etoolbox}
\makeatletter

\begin{document}

\begin{center}
\Huge TRIBUNALE DI CASTALIA
\end{center}

\begin{center}
Memoria difensiva
\end{center}




\section{FATTO}

\subsection{Oggetto del giudizio}

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 

\section{DIRITTO} % (fold)

\subsection{Normativa applicabile} % (fold)

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 

\section{ISTANZE E CONCLUSIONI}


\subsection{Conclusioni}
\label{sec:conclusioni}


        Piaccia al Tribunale Ill.mo adito


\end{document}
```


<a id="org568274f"></a>

# 10. Conclusione

L'utilizzo di XeLaTeX per la gestione dei *font* semplifica enormemente la redazione di atti e documenti complessi.

Al momento il mio *font* preferito per leggibilità e chiarezza è **Verdana**.

Grazie per l'attenzione.

Articolo scritto in Org Mode.

