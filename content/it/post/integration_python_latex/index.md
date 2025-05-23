---
title: "Studio su un esempio di integrazione tra Python e LaTeX"
date: 2024-12-06
slug:  integration_python_latex
categories:
  - Blog
tags:
  - Python
  - LaTeX
image:
  placement: 3
  preview_only: false 
  caption: 'Python and LaTeX friendship'
canonicalUrl: https://francopasut.blogspot.com/2024/12/studio-su-un-esempio-di-integrazione.html
---

<p align="center">
INDICE
</p>


- [Argomento  di questo articolo.](#argomento--di-questo-articolo)
- [ Descrizione dell'operazione senza utilizzo di  Python.](#-descrizione-delloperazione-senza-utilizzo-di--python)
- [Contenuto del file Python.](#contenuto-del-file-python)
- [Analisi del programma.](#analisi-del-programma)
- [Sorgente in  LaTeX generato da Python.](#sorgente-in--latex-generato-da-python)
- [Per provare il programma.](#per-provare-il-programma)



<a id="org5ac324b"></a>

# Argomento  di questo articolo.

Questo scritto è  uno studio personale sull'integrazione tra Python e LaTeX.

Non sono un informatico ma uso LaTeX da oltre dieci anni per scrivere atti giudiziari.  Solo da qualche mese ho iniziato a seguire alcuni *tutorial* sulla programmazione con  Python.

Mi sono subito chiesto se  LaTeX e Python potessero interagire tra loro.

Quindi ho chiesto a  Gemini  di generare  un sorgente in Python con tale finalità.

La struttura del programma in Python è la seguente: viene generata una matrice   composta da 5 colonne e 10 righe di numeri casuali e  viene creato un documento in linguaggio LaTeX contenente la matrice appena generata.

Pur essendo il codice generato da Gemini,  le osservazioni e le analisi sono mie.

La studio è stato integralmente condotto su **sistemi operativi GNU/Linux**, in prevalenza Arch Linux.


<a id="without-python"></a>

# <a id="org52be670"></a> Descrizione dell'operazione senza utilizzo di  Python.

Per ottenere lo stesso risultato **senza** utilizzare un Python  occorrerebbe prima utilizzare un foglio di calcolo, inserire in una cella una formula per la generazione di numeri casuali, estendere  la formula alle celle vicine, copiare il contenuto generato ed inserire il materiale in un documento LaTeX precedentemente preparato.

Nella versione in Italiana di LibreOffice Calc si utilizzerebbe la funzione `=CASUALE.TRA.FISSO(1;100)` per inserire in **una cella** un numero casuale intero tra 1 e 100 e si trascinerebbe l'angolo in basso a destra della cella per riempire le altre celle con vari numeri casuali.

Nella versione inglese di LibreOffice Calc è, anche, possibile utilizzare il  comando `=RANDARRAY(10,5,1,100,1)` in cui:

-   `RANDARRAY`  crea una matrice di numeri casuali.
-   `(10,5,1,100)` fornisce alla precedente funzione i parametri di RIGHE, COLONNE, NUMERO INIZIALE e NUMERO FINALE.
-   L'ultimo numero `1` rappresenta la variabile booleana *TRUE* che limita la creazione ai numeri  interi. Se fosse `0`, ovvero *FALSE* sarebbero generati numeri decimali.
-   Il modello della funzione è, pertanto, il seguente: `RANDARRAY(rows, columns, min, max, integer)`.

Dopo la creazione dei dati occorrerebbe, poi,  inserirli in un documento LaTeX precedentemente preparato avendo cura di inserire tra i  dati numerici  i simboli per la generazione delle tabelle,  secondo la sintassi di LaTeX.

Per tale operazione  potrebbero essere utili i cursori multipli descritti in questo [mio articolo](https://francopasut.blogspot.com/2024/07/vim-sublime-text-visual-studio-code-e-i.html).


<a id="org3440ce9"></a>

# Contenuto del file Python.

Si seguito riporto il programma generato da Python:

``` python
import random
import subprocess
# Genera dati casuali
data = [[random.randint(1, 100) for _ in range(5)] for _ in range(10)]
# Crea il template LaTeX
with open('template.tex', 'w') as f:
    f.write(r'''
\documentclass{article}
\usepackage{booktabs}
\begin{document}
\begin{tabular}{rrrrr}
\toprule
\multicolumn{5}{c}{Tabella di dati casuali} \\
\midrule
''')
    # Aggiungi i dati alla tabella
    for row in data:
        f.write(' & '.join(map(str, row)) + r' \\')
    f.write(r'''
\bottomrule
\end{tabular}
\end{document}
''')
# Compila il documento LaTeX
subprocess.call(['pdflatex', 'template.tex'])
```



<a id="org6f7c50f"></a>

# Analisi del programma.

Il programma in Python è molte semplice, il passaggio fondamentale è il seguente:

    data = [[random.randint(1, 100) for _ in range(5)] for _ in range(10)]

È una *comprensione di liste* in cui sono visibili tre operazioni,  identificabili leggendo la stringa da destra a sinistra:

-   Il ciclo più a destra, "`for _ in range(10)`",   crea 10 liste interne.
-   L'altro ciclo,  "`for _ in range(5)`",  popola ogni lista interna  con 5 elementi.
-   La parte più a sinistra, "`random.randint(1, 100)`",  genera un numero  casuale compreso tra 1 e 100 ad ogni iterazione.

Il trattino basso (\_) all'interno dei cicli for si usa quando non occorre un valore effettivo dell'iteratore.

Il tutto viene assegnato alla variazione `data`.

In pratica viene creata una *lista di liste*, ovvero una matrice, con 10 liste esterne e 5 elementi interi casuali in ciascuna lista interna, ovvero una matrice 10x5 riempita con numeri casuali tra 1 e 100.

Dopo la generazione dei contenuti viene costruito il documento utilizzando il linguaggio LaTeX.

Di seguito riporto un esempio del sorgente in LaTeX creato da Python. Occorre, ovviamente, considerare che i numeri riportati nella matrice sono un'implementazione della causalità e, quindi, potrebbero essere differenti ad ogni compilazione del programma.


<a id="org4bb5116"></a>

# Sorgente in  LaTeX generato da Python.

``` latex
\documentclass{article}
\usepackage{booktabs}
\begin{document}
\begin{tabular}{rrrrr}
\toprule
\multicolumn{5}{c}{Tabella di dati casuali} \\
\midrule
  32 & 78 & 89 & 53 & 78 \\
  3 & 53 & 13 & 2 & 69 \\
  27 & 52 & 80 & 81 & 69 \\
  88 & 74 & 92 & 89 & 52 \\
  68 & 74 & 33 & 2 & 20 \\
  10 & 90 & 45 & 38 & 33 \\
  79 & 90 & 20 & 37 & 48 \\
  100 & 18 & 35 & 33 & 82 \\
  17 & 10 & 74 & 49 & 44 \\
  14 & 41 & 9 & 79 & 62 \\
\bottomrule
\end{tabular}
\end{document}
```



<a id="orgc5bc322"></a>

# Per provare il programma.

Per provare il programma occorre lanciare il compilatore di Phyton.

Quindi occorre utilizzare il comando `python` o `python3`, a seconda delle distribuzioni utilizzate, seguito dal nome del file in cui è presente in codice Python.

Un unico comando a fronte dei vari passaggi descritti al paragrafo
[2](#org52be670) di questo articolo.

Merita un approfondimento.

Grazie per l'attenzione.

Questo articolo è stato scritto in Org Mode.
