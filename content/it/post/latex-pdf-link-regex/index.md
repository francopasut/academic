---
title: "Generazione automatica di collegamenti ipertestuali, in ambiente LaTeX mediante   le Espressioni Regolari di Vim, tra atti giudiziari e documenti prodotti.
"
date: 2024-01-08
slug:  latex-pdf-link-regex
categories:
  - Blog
tags:
  - Vim
  - RegEx
  - PDF
  - LaTeX
image:
  placement: 3
  preview_only: false 
  caption: 'Link Documents'
---

Abstract: Vim è un editor dalle infinite risorse. Può anche anche generare, grazie alle Espressioni Regolari incorporate, collegamenti ipertestuali in linguaggio LaTeX verso altri documenti presenti in locale. Per gli Avvocati ciò significa collegare un atto principale con le relative produzioni documentali. Questa è l'analisi del procedimento.

- [1. Oggetto di questo articolo.](#1-oggetto-di-questo-articolo)
- [2. Prima di cominciare.](#2-prima-di-cominciare)
- [3. Configurazione del documento principale.](#3-configurazione-del-documento-principale)
- [4. Formula in RegEx per la generazione automatica dei collegamenti.](#4-formula-in-regex-per-la-generazione-automatica-dei-collegamenti)
- [5. Spiegazione della formula RegEx.](#5-spiegazione-della-formula-regex)
- [6. Gestione del "carattere di sottolineatura".](#6-gestione-del-carattere-di-sottolineatura)
- [7. Collegamenti all'interno del testo](#7-collegamenti-allinterno-del-testo)
  - [7.1. Soluzione del "collegamento indiretto":](#71-soluzione-del-collegamento-indiretto)
  - [7.2. Soluzione del "collegamento diretto":](#72-soluzione-del-collegamento-diretto)



##   1. Oggetto di questo articolo.

A volte occorre inserire in un documento principale in PDF una lista di documenti da richiamare con  specifici collegamenti ipertestuali dedicati ad ogni elemento della lista.

Il caso tipico è quello degli  atti giudiziari con riferimento alle  relative produzioni documentali.

La costruzione *manuale* dei collegamenti ipertestuali tra atti e documenti è stata già trattata nel mio articolo [PCT e collegamenti ipertestuali tra atti e documenti in Word, Writer e LaTeX](https://francopasut.blogspot.com/2018/08/pct-e-collegamenti-ipertestuali-tra.html).

In questo articolo tratto, invece, della **generazione automatica** dei  collegamenti ipertestuali in   ***LaTeX*** mediante   ***Vim*** tramite le ***Espressioni Regolari*** (RegEx)  integrate nell'*editor*.

##  2. Prima di cominciare.

Per l'eventuale pre-elaborazione dei nomi dei  documenti con sistemi *open-source*, richiamo questi miei articoli:

- [Atti giudiziari: numerazione automatica delle produzioni documentali con risorse gratuite ed Espressioni Regolari in Windows, macOS e Linux](https://francopasut.blogspot.com/2018/11/atti-giudiziari-numerazione-automatica.html)
- [LaTeX e Atti Giudiziari, gestione degli elenchi documentali mediante elaborazione automatica dei dati alla rinfusa](https://francopasut.blogspot.com/2019/01/latex-e-atti-giudiziari-gestione-degli.html)).

Per una opportuna base di conoscenza di *LaTeX* richiamo i miei articoli:

- [LaTeX per atti giudiziari, configurazione di base](https://francopasut.blogspot.com/2018/12/latex-per-atti-giudiziari.html)
- [LaTeX e Atti Giudiziari: creazione e utilizzo dei riferimenti incrociati](https://francopasut.blogspot.com/2019/03/latex-e-atti-giudiziari-creazione-e.html)

Ad integrazione, per  una disamina del tema dedicato ai  *link* locali in *LaTeX*, consiglio [questo articolo](https://www.overleaf.com/learn/latex/Hyperlinks#Linking_local_files).

##  3. Configurazione del documento principale.

La prima operazione è quella di creare un documento in LaTeX inserendo, nel preambolo, il caricamento del  pacchetto *hyperref*:

```tex
\usepackage{hyperref}
```

Potrebbe seguire anche l'eventuale  configurazione  `\hypersetup{pdfnewwindow}` che serve per aprire i documenti richiamati dai vari collegamenti ipertestuali in schede separate  rispetto al documento principale:


```tex
\usepackage{hyperref}
\hypersetup{pdfnewwindow}
```



Questo si rende necessario perché, altrimenti, i documenti richiamati tramite collegamenti ipertestuali potrebbero sovrapporsi tra loro ed al documento principale medesimo e questo renderebbe difficile il ritorno all'indietro nella sequenza.

Lo stesso   comando *pdfnewwindow* può, tuttavia, essere  inserito  anche all'interno delle formule   *RegEx* che vedremo di seguito in questo articolo.

Dunque, la situazione di partenza è la seguente: abbiamo un documento principale in PDF che al proprio interno presenta una lista di documenti secondari che dovrebbero essere richiamati con link ipertestuali dedicati ad ogni singolo documento.

 La lista documentale è configurata seguendo lo *standard* di *LaTeX*, come nell'esempio seguente:

> \\item DOC 01.pdf  
> \\item DOC 02.pdf  
> \\item DOC nn.pdf   
> (...)


L'ambiente può essere sia di tipo *itemize* (o *compactitem* con il pacchetto *paralist*) che  *enumerate* (o *compactenum* con il pacchetto *paralist*).

La differenza tra le due varianti *itemize* ed *enumerate* diventa importante per i [collegamenti incrociati all'interno del documento](#7-collegamenti-allinterno-del-testo).


##   4. Formula in RegEx per la generazione automatica dei collegamenti.

Ecco, quindi, la formula che aggiunge un collegamento ipertestuale a **tutti gli elementi** presenti nel documento princiale formate con lo schema sopra indicato:

```bash
:%s/\\item \(.*\.pdf\)/\\item \\href[pdfnewwindow]{run:.\/\1}{\1}/g
```

L'applicazione della formula *RegEx* in Vim  restituisce la seguente stringa:

```tex
\item \href[pdfnewwindow]{run:./NOME DOCUMENTO.pdf}{NOME DOCUMENTO.pdf}
```

Dopo la compilazione del documento principale,  il documento *collegato* è cliccabile direttamente dal punto in cui si trova il relativo nome nella lista.

Il sistema funziona anche con i **PDF contenenti spazi** nel nome.

Invece di applicare la formula su **tutti gli elementi** è possibile limitare l'operazione ad una **selezione di elementi** di  una lista.

Per ottenere tale risultato occorre selezionare le righe da elaborare ed utilizzare la seguente formula (tenendo conto che la prima parte `'<,'>s'`, è aggiunta direttamente da *Vim* stesso):

```bash
'<,'>s/\\item \(.*\.pdf\)/\\item \\href[pdfnewwindow]{run:.\/\1}{\1}/g
```

##   5. Spiegazione della formula RegEx.

Prima di analizzare la formula *RegEx* occorre tenere conto che nelle Espressioni Regolari incorporate  in Vim,   le parentesi tonde consentono di  definire **gruppi di cattura**  che possono, poi, essere utilizzati,   con una numerazione del tipo *"\\1, \\2"*,  ecc. per  la sostituzione in altre parti della formula.

- Il frammento `:%s/` inizia la sostituzione su tutte le linee del documento.
- Il frammento `\\item \(.*\.pdf\)` cattura  la parte del nome del documento che **segue *\\item* e termina con *.pdf*.**
- Il frammento `\\item \\href[pdfnewwindow]{run:..\/\1}{\1}` sostituisce, infine,  la riga corrente con il nuovo formato desiderato.
- Il  richiamo `\1` rappresenta il blocco catturato (il nome del documento), come illustrato nella precisazione riportata all'inizio di questo paragrafo.

##   6. Gestione del "carattere di sottolineatura".

Occorre prestare attenzione al *carattere di sottolineatura* ovvero al *trattino basso* ("*\_*") che viene spesso usato al posto degli spazi bianchi, ad esempio: *DOC_01.pdf* al posto di *DOC 01.pdf*.

Se nel nome dei documenti da collegare fosse contenuto tale carattere, il linguaggio *LaTeX* restituirebbe  un errore.

In pratica: nella seguente formula:

```tex
\item \href[pdfnewwindow]{run:./DOC_01.pdf}{DOC_01.pdf}
```

si otterrebbe il seguente errore:

```vim
nomefile.tex|13 error| Missing $ inserted.
```

Questo errore deriva dal fatto che il carattere di sottolineatura  è normalmente utilizzato in *LaTeX* per indicare un *pedice* in notazione matematica mentre, nel sistema operativo, lo stesso carattere viene utilizzato come "*trattino unificatore*" dei caratteri che compongono i nomi dei documenti. In pratica, come sopra già evidenziato,  viene usato al posto degli spazi bianchi nei nomi dei documenti.

Per evitare l'errore sopra evidenziato occorre modificare il nome dei documenti, ovviamente **prima** di applicare la formula *RegEx*,   utilizzando il carattere di ***escape*** (*/*).

Il carattere di *escape* deve precedere  ogni *carattere di sottolineatura*

Ad esempio il nome "*DOC_01.pdf*" deve essere modificato in "*DOC\\\_01.pdf*".

È molto semplice creare  una formula *RegEx* in *Vim* che inserisca l'*escape* automaticamente per ogni carattere di sottolineatura contenuto nel documento.

Ecco la formula che effettua tale sostituzione **globalmente** nel documento.

```bash
%s/_/\\_/g
```

Anche in questo caso è possibile applicare la stessa formula ad una selezione di testo, utilizzando la stessa regola sopra descritta.

Applicando la formula di creazione dei collegamenti al nome di documento con *escape*  si otterebbe, dunque,

```tex
\item \href[pdfnewwindow]{run:./DOC\_01.pdf}{DOC\_01.pdf}
```

In questo modo viene neutralizzata la matrice matematica del  *carattere di sottolineatura* in *LaTeX*.

##    7. Collegamenti all'interno del testo

I collegamenti possono, ovviamente,  essere anche  sparsi all'interno dei documenti, oltre che nella ipotetica lista sopra menzionata.

Per utilizzare la lista di documenti come sopra elaboratori in altri punti  *sparsi* del documento principale  io, per ora, seguo sostanzialmente, due metodi: il collegamento indiretto e quello diretto.

###   7.1. Soluzione del "collegamento indiretto":

Nel caso di **collegamento indiretto** utilizzo un tag `\label{label_name}` all'elemento della lista (che, in questo caso, deve essere necessariamente di tipo *numerato*)  in modo da potere richiamare l'elenco etichettato con il tag `\ref` ovunque nel documento.

In pratica: nel punto sparso da collegare  si scrive "*vedi Doc. n. \\ref{label_name}*" in cui *label_name* è lo stesso contenuto nel tag `\label{label_name}`.

###   7.2. Soluzione del "collegamento diretto":

Nel caso di **collegamento diretto** si *salta* direttamente al collegamento esterno inserendo, nel punto *sparso* del documento principale, il collegamento *copiato* dal relativo elemento della lista.

La copia con Vim è velocissima: basta usare, **in qualsiasi punto del link da copiare** il comando composito `yiW` ed incollare il frammento  nel punto desiderato con `p`.

Consiglio anche di *personalizzare*  il riferimento ipertestuale per renderlo più adatto alla citazione infradocumentale, come di seguito riportato.

Ad esempio: il frammento  `{run:./DOC\_01.pdf}{DOC\_01\_DOCUMENT\_NAME.pdf}` potrebbe diventare più semplicemente `{run:./DOC_01.pdf}{DOC 1}` all'interno del testo.

Ovvero: invece che riportare il nome completo del documento si può riportare soltanto il numero all'interno della lista.

Grazie per l'attenzione.