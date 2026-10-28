---
title: "Dalla grammatica latina alla programmazione in Prolog: due mondi a confronto"
date: 2026-10-27
slug:  latino_prolog
categories:
  - Blog
tags:
  - Latino
  - Prolog
image:
  placement: 3
  preview_only: false 
  caption: 'Latino e Prolog'
canonicalUrl: https://francopasut.blogspot.com/2026/10/dalla-grammatica-latina-alla.html
---


- [1. Sintesi di un mio articolo precedente sul Prolog](#1-sintesi-di-un-mio-articolo-precedente-sul-prolog)
- [2. Prolog e Latino](#2-prolog-e-latino)
- [3. La struttura della frase](#3-la-struttura-della-frase)
- [4. La flessibilità dell'ordine](#4-la-flessibilità-dellordine)
- [5. Analisi del comportamento delle query in Prolog](#5-analisi-del-comportamento-delle-query-in-prolog)
- [6. Perché questo conferma l'articolo?](#6-perché-questo-conferma-larticolo)
- [7. Perché negli altri linguaggi di programmazione non vale la stessa osservazione?](#7-perché-negli-altri-linguaggi-di-programmazione-non-vale-la-stessa-osservazione)
- [8. Conclusioni](#8-conclusioni)


# 1. Sintesi di un mio articolo precedente sul Prolog

Ho già menzionato Prolog in un mio  [precedente articolo](https://francopasut.blogspot.com/2026/02/prolog-tra-logica-e-linguaggio-di.html) dal quale riporto un breve sunto.

Nato negli anni '70 per l'elaborazione del linguaggio naturale e l'intelligenza artificiale simbolica, Prolog (**Programmation en Logique**) si distingue dai tradizionali linguaggi di programmazione per il suo paradigma dichiarativo, focalizzato sulla definizione di fatti, regole e relazioni condizionali anziché sulla stesura di istruzioni sequenziali o algoritmi di controllo. 

Anziché specificare il "come" risolvere un problema attraverso cicli o costrutti procedurali, la programmazione in Prolog consiste nel dichiarare "cosa" è vero e nell'interrogare il sistema tramite query, lasciando al motore di risoluzione integrato (**backtracking**) il compito di effettuare le deduzioni logiche. 

Sebbene l'IA moderna abbia intrapreso strade prevalentemente orientate all'apprendimento statistico e ad altri linguaggi come Python, il valore primario di Prolog risiede nella sua essenza formativa e filosofica: più che un semplice strumento produttivo, esso costituisce un esercizio di logica pura che trasforma il modo di modellare il pensiero, mantenendo una forte rilevanza nei sistemi esperti, nella rappresentazione della conoscenza e nella risoluzione di problemi deduttivi complessi con un codice essenziale ed elegante.

In Prolog si dichiarano fatti e regole; poi si pongono domande, lasciando al programma il compito di cercare una risposta.

# 2. Prolog e Latino

È possibile ipotizzare un collegamento tra il linguaggio Prolog e la lingua latina?

A prima vista, no! Prolog e Latino sembrano appartenere a mondi lontanissimi. 

Prolog non deriva dal latino e non è stato creato per tradurlo.

Quindi che collegamento potrebbe esserci?

Un accostamento possibile esiste e  può essere un modo interessante per capire sia la grammatica sia la programmazione.

La somiglianza è  nel modo in cui possiamo descrivere le informazioni.

Negli esempi seguenti è stato utilizzato il linguaggio SWI-Prolog installato in Linux Debian. L'articolo è stato scritto in Emacs Org Mode, come quasi tutti i miei precedenti articoli.

# 3. La struttura della frase

Consideriamo la semplicissima frase latina "*puella rosam amat*" ("la ragazza ama la rosa").

In latino, il soggetto *puella* è al nominativo, l'oggetto *rosam* è all'accusativo e il verbo *amat* concorda con il soggetto. 

L'ordine delle parole in latino è  flessibile perché i casi grammaticali ci dicono chi fa che cosa.

In Prolog, possiamo rappresentare questa stessa relazione logica definendo un predicato:

    % Fatti di base
    nome(puella).
    nome(rosa).
    
    % Relazione: chi ama chi
    % ama(Soggetto, Oggetto)
    ama(puella, rosa).

# 4. La flessibilità dell'ordine

Poiché il latino permette variazioni nell'ordine delle parole senza perdere il significato principale, possiamo dire anche *rosam puella amat*. La logica sottostante non cambia.

Allo stesso modo, in Prolog la struttura logica dei dati prescinde dalla loro presentazione visiva o testuale. Possiamo interrogare il sistema in diversi modi:

    ?- ama(Chi, Cosa).
    Chi = puella,
    Cosa = rosa.

# 5. Analisi del comportamento delle query in Prolog

Per meglio comprendere quanto sopra occorre precisare  come Prolog gestisce la corrispondenza posizionale degli argomenti rispetto ai nomi delle variabili che scegliamo di usare nell'interrogazione (*query*).

Nel fatto sopra definito:

    ama(puella, rosa).

la struttura dei dati è posizionale e, per convenzione (esplicitata nel commento del codice come `ama(Soggetto, Oggetto)`), il primo argomento rappresenta il soggetto e il secondo l'oggetto.

Quando si scrive:

`?- ama(Chi, Cosa).`: si sta posizionando la variabile `Chi` al primo posto (soggetto) e `Cosa` al secondo posto (oggetto). Il motore di Prolog restituisce quindi `Chi = puella` e `Cosa = rosa`.

`?- ama(Cosa, Chi).`: in questo modo si stanno invertendo i *nomi delle variabili* nella query. In pratica: `Cosa` al primo posto e `Chi` al secondo. Poiché il fatto originale mantiene sempre `puella` al primo posto e `rosa` al secondo, Prolog assegnerà coerentemente `Cosa = puella` e `Chi = rosa`.

# 6. Perché questo conferma l'articolo?

L'affermazione dell'articolo secondo cui *«la struttura logica dei dati prescinde dalla loro presentazione visiva o testuale»* significa che la relazione logica fondamentale tra i dati (`ama(puella, rosa)`) non viene alterata dal modo in cui scegli di interrogare il sistema o dai nomi arbitrari (`Chi`, `Cosa`, oppure `X`, `Y`) che assegni alle variabili.

Esattamente come in latino, la comprensione logica del significato non si perde anche se si modifica l'ordine visivo o la disposizione delle parole nella frase, in Prolog la relazione logica è indipendente dalla forma sintattica transitoria della query.

Le variabili della query sono solo etichette o "contenitori" posizionali: invertendo l'ordine delle variabili nella domanda (`Cosa, Chi`), si invertono i contenitori in cui vengono inseriti i valori, ma la verità logica e la struttura dei dati sottostanti rimangono perfettamente identiche.

# 7. Perché negli altri linguaggi di programmazione non vale la stessa osservazione?

Nei linguaggi di programmazione tradizionali come Python, il paradigma di riferimento è imperativo, procedurale o orientato agli oggetti, profondamente diverso da quello logico e dichiarativo di Prolog. Questa differenza strutturale influisce sul modo in cui i dati e le funzioni vengono interpretati.

Nei linguaggi procedurali, il codice è un insieme di istruzioni sequenziali che il computer deve eseguire passo dopo passo per calcolare un risultato. Quando in Python si definisce una funzione o si chiama un metodo, ad esempio ama(soggetto, oggetto), gli argomenti passati seguono una rigorosa assegnazione posizionale (a meno di non esplicitare i parametri tramite keyword arguments). L'ordine con cui inserisci i valori determina direttamente il flusso logico e il significato operativo: invertire gli argomenti in una chiamata di funzione in Python altera immediatamente i dati elaborati all'interno del blocco di codice, perché il linguaggio esegue esattamente ciò che gli viene ordinato di fare in quella specifica sequenza.

Prolog, al contrario, non descrive come calcolare un risultato attraverso un algoritmo, ma dichiara cosa è vero all'interno di un sistema di relazioni logiche. Una clausola come **ama(puella,rosa)**
non è una funzione da eseguire, ma un'affermazione di fatto all'interno di uno spazio relazionale. Il motore di Prolog non segue un flusso di controllo sequenziale, ma utilizza l'unificazione (un pattern matching basato sulla logica dei predicati del primo ordine) per verificare la compatibilità logica tra la query e la base di conoscenza.

Per questo motivo, mentre in Python la sintassi e l'ordine delle chiamate sono legati a doppio filo a una procedura di calcolo algoritmico, in Prolog la struttura dei dati è pensata come una rete di relazioni pure, svincolata da un'esecuzione procedurale o da una rigida sequenza di istruzioni.

# 8. Conclusioni

Il confronto rivela un'inaspettata affinità tra logica formale e linguistica storica, accomunate dalla centralità delle relazioni strutturali.

Un'essenzialità che si riflette anche nella scelta di Org Mode per la redazione del testo: uno strumento che ne preserva la pulizia e la composizione, facilitandone l'integrazione e la resa finale.

Vi ringrazio per l'attenzione.

