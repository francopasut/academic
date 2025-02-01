---
title: "LaTeX: alcune considerazioni sulla dimensione dei caratteri"
date: 2023-08-11
slug:  character-size-considerazions-latex
categories:
  - Blog
tags:
  - LaTeX
image:
  placement: 3
  preview_only: true 
  caption: 'Character sizes list in LaTeX'
---



## LaTeX: definizione di classe, le classi standard e  le dimensioni dei caratteri.

In LaTeX, il termine "classe" si riferisce a un tipo di documento predefinito o personalizzato che determina il *layout* generale, lo stile e le opzioni disponibili per la formattazione di un documento. 

Le classi in LaTeX sono identificate dall'estensione di file `.cls` e forniscono le istruzioni di base per la struttura del documento.

Le caratteristiche principali di una "classe" di LaTeX si riferiscono al formato della pagina nonché allo stile del titolo, delle  sezioni  e del testo.

Le classi standard di LaTeX sono  `article`, `report`, `book` e `letter`.

Per utilizzare una classe in LaTeX, è necessario dichiararla nel preambolo del documento utilizzando il comando `\documentclass` come dall'esempio seguente:

```tex
\documentclass[a4paper,12pt]{article}
```

Nel precedente esempio, viene dichiarata la classe `article` con le opzioni `a4paper` per il formato della pagina e `12pt` per la dimensione del carattere.

Per quanto concerne la dimensione dei caratteri, le classi standard supportano, in via ordinaria, soltanto tre valori: **10pt (dimensione di "default"), 11pt e 12pt**.

Ciò può sembrare molto riduttivo,  anche se  per la maggior parte dei documenti è sufficiente.

La domanda è, ovviamente, la seguente: è possibile impostare una diversa dimensione dei caratteri nei modelli ordinari di LaTeX? Ad esempio **14pt**?

È certamente possibile: sia con  risorse già normalmente disponibili in LaTeX che con l'utilizzo di pacchetti aggiuntivi.

Le seguenti osservazioni si riferiscono alle soluzioni disponibili in  LaTeX senza l'utilizzo di pacchetti specifici.

## Quali sono i comandi di dimensionamento dei caratteri in LaTeX?

LaTeX ha una serie di comandi dedicati alla modifica della dimensione dei caratteri standard.

La sequenza, dal più piccolo al più grande, è la seguente:

 1. \\tiny
 2. \\scriptsize
 3. \\footnotesize
 4. \\small
 5. \\normalsize
 6. \\large
 7. \\Large
 8. \\LARGE
 9. \\huge
10. \\Huge

## Quando si usano i comandi di dimensionamento dei caratteri in LaTeX?

Ogni comando di dimensione ha una sua specifica utilità,  come si riporta nell'elenco seguente:

 1. `\tiny` riduce la dimensione del carattere al più piccolo livello possibile ed  è utile per note a piè di pagina o didascalie molto brevi.
 2. `\scriptsize` riduce la dimensione del carattere rispetto al normale ed  è adatto per didascalie, etichette o testo ausiliario.
 3. `\footnotesize` riduce leggermente la dimensione del carattere rispetto al normale ed  è spesso usato per le note a piè di pagina.
 4. `\small` riduce la dimensione del carattere rispetto al normale ed  è adatto per testo di supporto o citazioni brevi.
 5. `\normalsize` ripristina la dimensione del carattere al valore normale ed  è il comando predefinito utilizzato per la maggior parte del testo nel documento.
 6. `\large` aumenta leggermente la dimensione del carattere rispetto al normale ed è utile per una leggera enfatizzazione del testo.
 7. `\Large` aumenta ulteriormente la dimensione del carattere rispetto al precedente comando.
 8. `\LARGE` aumenta ancora la dimensione del carattere.
 9. `\huge` aumenta notevolmente la dimensione del carattere ed pone in chiara enfasi il testo.
10. `\Huge` aumenta ulteriormente la dimensione del carattere rispetto ai precedenti ed è il comando di dimensione del carattere più grande disponibile in LaTeX.

## Come si usano i comandi di dimensionamento dei caratteri in LaTeX?

Per utilizzare questi comandi, basta inserirli nel documento al punto desiderato.

Ad esempio, per ridurre la dimensione del carattere di un frammento di testo, si scrive `\tiny` prima del testo e `\normalsize` dopo il testo per ripristinare la dimensione normale.

Ecco un esempio di come potrebbe apparire l'uso di questi comandi in LaTeX:

```tex
\documentclass{article}
\begin{document}

{\tiny Lorem ipsum dolor sit amet, consectetuer adipiscing elit.}

{\Huge Aenean commodo ligula eget dolor.}

Aenean massa. Cum sociis natoque penatibus.

\end{document}
```

Nell'esempio riportato sopra, il testo all'interno di  `{\tiny (...)}` verrà visualizzato molto piccolo, mentre il testo all'interno di  `{\Huge (...)}` verrà visualizzato molto grande.

Il testo dopo queste porzioni tra parentesi graffe verrà ripristinato alla dimensione normale.

Ecco il risultato effettivo:
![tiny-huge](tiny-huge-example.png "Tiny Huge Example")

È anche possibile usare i comandi  per cambiare la dimensione del testo all'inizio del documento per avere effetto su tutto il documento.

Ad esempio, il seguente codice renderà tutto il testo del documento di dimensioni `\Large`:

```tex
\documentclass{article}

\begin{document}
\Large


Aenean commodo ligula eget dolor.

\end{document}
```

È anche possibile usare gli stessi comandi  come delimitatori di ambiente, per cambiare la dimensione del testo all'interno di una zona di testo "isolando", quindi,  l'effetto dal resto del documento.

Ad esempio, il seguente frammento codice applica il comando `Large` al testo "*Aenean commodo ligula eget dolor.*" senza modificare le dimensioni del resto del documento: 

```tex
\documentclass{article}

\begin{document}

Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

\begin{Large}
Aenean commodo ligula eget dolor.
\end{Large}

Aenean massa. Cum sociis natoque penatibus.

\end{document}
```
Anche in questo caso riporto il risultato effettivo nell'immagine seguente:
![normal-large](normal-large-example.png "Normal Large Example")

I comandi, in sintesi,  si possono utilizzare in vari modi:

- All'interno di un ambiente (es center)
- Come delimitatori essi stessi di un ambiente.
- All'interno di un blocco di parentesi
- Con effetto permanente da un certo punto in poi

## Le classi alternative del progetto KOMA-Script.

In alternativa alle soluzioni sopre descritte, è possibile utilizzare lo  *script*  KOMA-Script che contiene un insieme di classi alternative rispetto alle classi standard sopra richiamate: `scrartcl`, al posto della classe `article` standard; `scrreprt`, al posto della classe `report`; `scrbook`, al posto della  classe `book`; `scrlttr2`, al posto della classe `letter`.

Le classi "Koma" di LaTeX, attraverso il pacchetto KOMA-Script, supportano una più vasta gamma di dimensioni del font rispetto allo standard, come da elenco seguente:

- 8pt: Una dimensione del font molto piccola, adatta per documenti con spazio limitato o con requisiti di compatta leggibilità.
- 9pt: Una dimensione del font leggermente più grande rispetto a 8pt, ma ancora abbastanza compatta. Può essere utilizzata per rendere il testo un po' più leggibile rispetto alle dimensioni più piccole.
- 10pt: La dimensione del font predefinita nelle classi standard di LaTeX come article, report e book. È un valore comune per la dimensione del font in molti documenti.
- 11pt: Una dimensione del font leggermente più grande rispetto a 10pt. Può essere utilizzata per migliorare la leggibilità del testo senza aumentarlo troppo drasticamente.
- 12pt: Un'altra dimensione del font comune nelle classi standard di LaTeX. È un po' più grande rispetto a 11pt e viene utilizzata per renderne il testo ancora più leggibile.
- 14pt, 17pt, 20pt e altre dimensioni personalizzate.

Quella che segue è una dichiarazione di classe di Koma-script con un *font-size* diverso da quelli standard:

```tex
\documentclass[fontsize=14pt]{scrartcl}
```

Per informazioni più approfondite su KOMA-Script consiglio di prendere visione della [relativa documentazione](https://ctan.org/pkg/koma-script).

Grazie per l'attenzione.
