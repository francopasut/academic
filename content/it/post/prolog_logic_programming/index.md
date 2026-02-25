---
title: "Prolog: tra logica e linguaggio di programmazione"
date: 2026-02-25
slug:  prolog_logic_programming
categories:
  - Blog
tags:
  - Prolog
  - Python
  - Logic Studio Code
image:
  placement: 3
  preview_only: false 
  caption: 'Prolog e Filosofia'
canonicalUrl: https://francopasut.blogspot.com/2026/02/prolog-tra-logica-e-linguaggio-di.html
---

- [1. Premessa](#1-premessa)
- [2. Mani sulla tastiera](#2-mani-sulla-tastiera)
- [3. Esempio](#3-esempio)
- [4. Il fascino di Prolog](#4-il-fascino-di-prolog)
- [5. Giochiamo con la logica](#5-giochiamo-con-la-logica)
  - [5.1. Versione Prolog](#51-versione-prolog)
  - [5.2. Versione Python](#52-versione-python)
- [6. Osservazioni sui due linguaggi](#6-osservazioni-sui-due-linguaggi)


# 1. Premessa

Nato negli anni '70 per l'elaborazione del linguaggio naturale e l'intelligenza artificiale dell'epoca, il Prolog (abbreviazione di "Programmation en Logique") è un linguaggio di programmazione un po' particolare.

La "logica" di Prolog si focalizza sulla definizione di relazioni e fatti, anziché sulle istruzioni sequenziali. 

Il linguaggio si basa su tre pilastri fondamentali:

-   Fatti: Verità assolute sul mondo che stiamo modellando.
-   Regole: Relazioni condizionali che permettono di inferire nuove informazioni.
-   Interrogazioni (Query): Domande rivolte al sistema per verificare la verità di un'affermazione o trovare soluzioni.

In Prolog, non esistono cicli "for" o variabili nel senso tradizionale.

# 2. Mani sulla tastiera

Per provare il codice Prolog sul proprio computer è possibile installare SWI-Prolog, l'implementazione *open source* più diffusa e documentata.

Ad esempio, per Debian (che sto utilizzando in questo momento) e distribuzioni derivate: `sudo apt install swi-prolog`.

Per scrivere sorgenti in Prolog occorre aggiungere l'estensione `.pl` ai file.

Per effettuare le richieste (query) occorre procedere come segue:

-   avviare l'interprete aprendo il terminale e digitando `swipl`.
-   digita il comando di consultazione compreso il punto finale: `?- consult('family.pl').`
-   scrivere le *query*, ovvero le richieste.

Oppure, molto più semplicemente, è possibile utilizzare un ambiente on-line, simile a Colab per Python.

Io ho utilizzato senza alcun problema l'ambiente  SWISH (<https://swish.swi-prolog.org/>): basta aprire il sito, scrivere fatti e regole, poi scrivere le query  nel riquadro in basso a destra e premere *Run!* o `Ctrl+Ret`..

# 3. Esempio

Ecco un semplice esempio di codice sorgente in Prolog:

    % Fatti: definisce chi è genitore di chi
    genitore(giovanni, maria).
    genitore(giovanni, paolo).
    genitore(maria, luca).
    
    % Regola: X è nonno di Y se X è genitore di Z e Z è genitore di Y
    nonno(X, Y) :- 
        genitore(X, Z), 
        genitore(Z, Y).

Esempi di richieste:

1.  Query: `?- genitore(maria, luca).`
2.  Result: `true` (Il sistema conferma il fatto).
3.  Query: `?- nonno (giovanni, luca).`
4.  Result: `true` (Il sistema applica la regola logica).
5.  Query: `?- genitore(maria, Chi).`
6.  Result: `Chi = luca` (Il sistema trova l'identità che soddisfa la relazione).

# 4. Il fascino di Prolog

Che senso ha, oggi, studiare un linguaggio nato decenni fa con la promessa di plasmare la "futura" Intelligenza Artificiale?

Oggi l’IA è finalmente tra noi, è diventata realtà e permea ogni aspetto del quotidiano, ma la sua implementazione ha preso strade diverse, affidandosi a linguaggi e paradigmi differenti.

Viene da chiedersi, dunque: ****Prolog serve ancora a qualcosa?****

La risposta, probabilmente, non va cercata nella produttività fine a se stessa. Il vero fascino di Prolog  risiede  nella sua ****essenza****.

Prolog non si presenta come un comune linguaggio di programmazione ma  somiglia molto di più a un ****gioco di logica pura****, un labirinto intellettuale dove non ci sono obiettivi commerciali, ma solo il piacere della deduzione.

-   ****Non si danno comandi:**** Si dichiarano fatti e relazioni.
-   ****Non si descrive il "come":**** Si definisce il "cosa".
-   ****L'obiettivo è la logica stessa:**** Risolvere un problema in Prolog è un esercizio filosofico prima che tecnico.

Prolog mi sembra più adatto alle facoltà umanistiche, come ad esempio  filosofia, che a quelle di informatica.

In ogni caso filosofia e informatica sono entrambe coinvolte nel linguaggio, come nell'immagine di copertina di questo articolo.

In un mondo dominato dal pragmatismo, Prolog  è la prova che un linguaggio può essere "utile" non per quello che ti permette di **costruire**, ma per come  costringe a **pensare**.

Prolog rimane, quindi, "utile" e  rilevante in logica, intelligenza artificiale simbolica, elaborazione del linguaggio naturale e sistemi esperti, dove la programmazione dichiarativa semplifica problemi complessi.

# 5. Giochiamo con la logica

Per dimostrare l'abilità di Prolog a risolvere gli enigmi di logica propongo un semplicissimo gioco in doppio formato: Prolog e Python.

Il gioco è un classico  della logica: l'Enigma dell'Assassino. È un piccolo mistero deduttivo dove dobbiamo scoprire chi è il colpevole basandoci su alcuni fatti e regole.

## 5.1. Versione Prolog

    % Fatti: Chi possiede cosa e dove si trova
    persona(pierina).
    persona(gianni).
    
    arma(pistola).
    arma(coltello).
    
    luogo(cucina).
    luogo(studio).
    
    % Relazioni osservate
    si_trova(pierina, cucina).
    si_trova(gianni, studio).
    
    possiede(pierina, coltello).
    possiede(gianni, pistola).
    
    % Regola: Qualcuno è colpevole se si trova nello stesso luogo della vittima
    % e possiede l'arma del delitto (supponiamo sia la pistola).
    colpevole(X) :- 
        persona(X),
        si_trova(X, studio), % Il delitto è avvenuto nello studio
        possiede(X, pistola).  

Per trovare il colpevole, nel terminale Prolog (anche quello online) si scrive `?- colpevole(Chi).`

Il sistema risponde `Chi = gianni.`.

## 5.2. Versione Python

    # Definizione dei dati come dizionari (strutture dati)
    sospettati = [
        {"nome": "Pierina", "luogo": "cucina", "arma": "coltello"},
        {"nome": "Gianni", "luogo": "studio", "arma": "pistola"}
    ]
    
    scena_del_crimine = "studio"
    arma_delitto = "pistola"
    
    def trova_colpevole(lista_sospettati):
        for persona in lista_sospettati:
            # Logica di controllo esplicita
            if persona["luogo"] == scena_del_crimine and persona["arma"] == arma_delitto:
                return persona["nome"]
        return "Nessun colpevole trovato"
    
    # Esecuzione
    risultato = trova_colpevole(sospettati)
    print(f"Il colpevole è: {risultato}")  

Per lanciare il programma in Python, consiglio il servizio online  [Google Colab](https://colab.research.google.com).

# 6. Osservazioni sui due linguaggi

In questo piccolo esempio emerge con chiarezza la differenza tra un linguaggio di programmazione basato sulla logica ed uno tradizionale.

Nel primo caso, ovvero nel sorgente in Prolog, viene descritto  cosa è vero mentre nel secondo caso, ovvero nel sorgente in Python, viene descritto il modo di trovare la soluzione.

Il motore di ricerca in Prolog è integrato (Backtracking): cerca automaticamente tra i fatti dichiarati.

Il motore di ricerca in Pyhton deve essere, invece, costruito mediante cicli *for* o istruzioni *if*.

I dati in Prolog vengono dichiarati nel codice che contiene direttamente un database di fatti.

In Python i dati devon essere strutturati (liste, come dizionari, o classi, nel caso specifico non presenti).

È vero che Python è molto più versatile ed ha librerie immense.

Però Prolog fa la sua bella figura: notate l'eleganza e pulizia del codice in Prolog rispetto al corrispettivo di Python.

Considerate anche che in Prolog, se aggiungessimo un terzo sospettato, non sarebbe necessario cambiare la "funzione" di ricerca, quindi il sorgente rimarrebbe pulito ed ordinato.

In Python, se la logica diventasse più complessa (es. "A è colpevole se B mente"), il codice diventerebbe più complesso con una serie aggiuntiva di if-else.

Grazie per l'attenzione.

