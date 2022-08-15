---
title: "Vim ed Espressioni Regolari per la rimozione degli spazi bianchi ridondanti"
date: 2022-07-19
slug: vim_regex_white_spaces
categories:
  - Editors
tags:
  - Vim
  - RegEx
image:
  placement: 3
  preview_only: true 
  caption: 'Vim e RegEx'
---

{{% toc %}}

## Premessa e struttura dell'articolo

Ho scritto questo articolo per esercitarmi "sul campo" nella costruzione  delle formule delle *Espressioni Regolari*, anche denominate *RegEx* in Vim.

In particolare l'obiettivo è quello di "ripulire" documenti con  spazi bianchi in eccedenza sia all'inizio che alla fine di ogni riga.

Per la comprensione dell'articolo è sufficiente una conoscenza di base di Vim e delle Espressioni Regolari integrate nell'_editor_.

Le varie formule vengono  applicate su documenti interi ma, trattandosi di normalissimi comandi di ricerca in Vim, possono essere applicate a singole righe o a intervalli specifici di righe nel contesto del documento.

Le formule illustrate sono tre e la costruzione è progressiva con analisi "passo per passo" della sintassi delle _Espressioni Regolari_.

La struttura dell'articolo è la seguente: prima illustro la creazione della formula per un'operazione di fine riga; poi passo alla formula inversa, ovvero per la stessa operazione ma ad inizio riga; infine combino le due formule un unica comando che effettui entrambe le operazioni.

Ogni passaggio è preceduto da una sintesi della situazione di riferimento e dell'obiettivo.

Alla fine di ogni paragrafo riporto un'immagine con l'effetto della specifica formula sul testo del documento.

Buona lettura!

## Eliminare spazi bianchi ridondanti  dopo l'ultima parola delle righe

* **Situazione di riferimento**: righe con numerosi spazi bianchi dopo l'ultima parola. Può capitare quando si copiano frammenti di testo da Internet.
* **Obiettivo**: cancellare mediante Vim tutti gli spazi bianchi dopo l'ultima parola di ogni riga con un solo comando composito.

L'utilizzo delle *Espressioni Regolari* in Vim consente di centrare l'**obiettivo** con un singolo comando composito che si autoreplica in tutto il documento.

In pratica: occorre costruire la stringa di ricerca in modo da trovare la **situazione di riferimento** alla quale applicare l'azione di cancellazione mirata.

Avendo lo scopo di selezionare gli spazi bianchi a fine righa, occorre *legare* il carattere che identifica, in genere, gli spazi bianchi (`\s`) con il simbolo che identifica l'ultimo carattere della riga (`$`).

Quindi il primo costrutto potrebbe essere, appunto: `\s+$`.

Tuttavia quel costrutto è **errato** perché il simbolo `+` è considerato, nella sintassi delle *Espressioni Regolari*, un *metacarattere* ovvero il *carattere speciale* che non identifica se stesso ma altri caratteri.

Il metacarattere in questione è un operatore di ripetizione che corrisponde ad una sequenza predefinita.

In particolare, il metacarattere `+` identifica **una o più corrispondenze di caratteri**.

In pratica **non identifica** soltanto l'ipotesi di *nessun carattere* che corrisponde, invece, ad altro metacarattere, non oggetto dell'attuale articolo.

Occorre, pertanto, annullare la natura *speciale* di tale *metacarattere* per ricondurlo al suo significato grafico originale, ovvero al *segno di addizione matematica*.

Per ottenere tale risultato occorre premettere al segno di addizione il simbolo di *escape*, ovvero il carattere `\` (descritto anche in [questo mio articolo](https://francopasut.netlify.app/post/vim_special_search/#the-escape-character)).

Quindi la corretta sequenza centrale della stringa è la seguente: `\s\+$`.

Una volta risolta la parte centrale della stringa è molto semplice completare il comando di ricerca in Vim: occorre soltanto attivare la ricerca globale con `%s\` e la sostituzione desiderata consistente nella eliminazione degli spazi con `//g` (o `gc)` se preferite confermare ogni singola istanza.

Ecco, quindi, la stringa completa:

```
%s/\s\+$//g
```
L'effetto del comando viene evidenziato nella zona in grigio:

![spazi finali](spazi_finali.png)

Con l'eventuale aggiunta della lettera `c` per la conferma esplicita di ogni istanza.

Impressione personale: la costruzione delle Espressioni Regolari partendo dal centro mi ricorda la costruzione delle frasi latine partendo dal verbo.

Sarebbe interessante approfondire questa inconsueta analogia.

## Eliminare spazi bianchi ridondanti all'inizio delle righe

* **Situazione di riferimento**: righe con numerosi spazi bianchi prima della prima parola. Può capitare quando si copiano frammenti di testo da Internet.
* **Obiettivo**: cancellare mediante Vim tutti gli spazi bianchi prima della prima parola di ogni riga con un solo comando composito.

Con la stessa tecnica precedente si può facilmente costruire una *espressione regolare* che effettui l'operazione specualare: cancellare tutti gli spazi bianchi presenti prima della prima parola di ogni riga.

Anche in questo caso è opportuno partire dalla parte centrale della formula.

Se prima avevamo utilizzato il simbolo di *fine riga*, ora sarà necessario utilizzare il carattere di *inizio riga*, ovvero l'accento circoflesso: `^`.

Invertendo, quindi, l'ordine dei fattori, occorrerà, quindi, inserire prima il carattere di *inizio riga* (`^`), seguito dal segno di addizione matematico (`\+`) e, da ultimo, dal carattere, già sopra visto, che identifica gli spazi bianchi (`\s`).

Unendo i tre pezzi si ha una prima frazione composita del comando: `^\+\s`.

Questa frazione, tuttavia, **non è corretta** in quando non tiene conto che il carattere di *spazi bianchi* viene ripetuto solo in unica istanza.

Con la formula sopra abbozzata, quindi, la ricerca terminerebbe al **primo spazio bianco della riga** e lascerebbe intatti tutti gli altri spazi bianchi che precedono la prima parola della riga.

Occorre, quindi, introdurre un altro *metacarattere di ripetizione*, ovvero il segno asterisco `*` il quale, posto subito dopo il carattere di spazio bianco, ne amplifica all'infinito la portata fino a quando non viene identificato il primo carattere *non bianco* che determina la fine della sequenza di ricerca.

In pratica L’asterisco “*\**" confronta 0, uno o più dei precedenti caratteri.

Possiamo anche semplificare la formula eliminando il simbolo di addizione matematica in quanto la ricerca si fermerebbe, in ogni caso, al primo carattere non bianco della riga.

Ed ecco la formula finale con le aggiunte e le semplificazioni sopra descritte:

```
%s/^\s*//g
```
Anche in questo caso l'effetto viene evidenziato nella zona in grigio:

![spazi iniziali](spazi_iniziali.png)

## Unione delle due precedenti formule

* **Situazione di riferimento**: righe con numerosi spazi bianchi prima della prima parola e dopo l'ultima parola.
* **Obiettivo**: cancellare mediante Vim tutti gli spazi bianchi prima della prima parola e dopo l'ultima parola di ogni riga con un solo comando composito.

È evidente che, a questo punto, ci si chieda che sia possibile unire i due comandi precedenti in un unico comando.

È possibile ma occorre qualche chiarimento in più.

Anche in questo caso il punto di partenza è la parte centrale del costrutto che dovrà comprendere sia la prima stringa di ricerca che la seconda, unita da un operatore alternativo di tipo *or*, ovvero che identifichi sia la prima che la seconda **situazione di riferimento** sopra descritta.

L'operatore in questione è la *barra verticale*, ovvero il carattere `|` che deve essere opportunamente preceduta dal solito *carattere di escape*.

Ma non basta: occorere anche racchiudere i due diversi frammenti in parentesi tonde, come avverrebbe per le espressioni matematiche e premettere, ad ogni parentesi di apertura e chiusura, il carattere di *escape*.

Alla fine del procedimento di fusione dei due frammenti e con le opportune modifiche sopra descritte, si ottiene il comando composito seguente:

```
%s/\(^\s*\)\|\(\s\+$\)//g
```

Anche in questo caso potete notare l'effetto sulla zona in grigio:

![spazi iniziali e finali](spazi_iniziali_finali.png)

Sembra complesso ma, ragionando sui singoli passaggi che l'hanno generato come illustrati nei precedenti capitoli, non dovrebbero esserci problemi per comprenderne chiaramente la logica costruttiva.

Grazie per la vostra attenzione.
