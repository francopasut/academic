---
title: "Vim, VimTex: ambienti e comandi in LaTeX"
date: 2022-11-26
slug:  vim_vimtex_surround
categories:
  - Editor
tags:
  - Vim
  - LaTeX
image:
  placement: 3
  preview_only: false 
  caption: 'Vim e LaTeX'
---



## Un sistema intelligente per scrivere

[Vim](https://www.vim.org/) è un ottimo strumento per elaborare i testi.

[LaTeX](https://www.latex-project.org/) è un sistema di composizione
tipografica "allo stato dell'arte".

Vim e LaTeX insieme costituiscono un potente sistema di scrittura, ma è
necessario un componente aggiuntivo per metterli in relazione.

<https://github.com/lervag/vimtex>\[VimTex\]\] fornisce esattamente
questo obiettivo: mettere in relazione Vim con LaTeX e fa il suo lavoro
molto bene.

Quindi Vim e VimTex sono un sistema intelligente per ogni tipo di
scrittore in LaTeX.

L'argomento è vastissimo e non può certamente essere contenuto in un
breve articolo come questo.

In questo articolo mi limito a trattare delle funzioni per la gestione
di ambienti e comandi.

## Funzioni integrate in Vimtex per ambienti e comandi

Chi usa LaTeX conosce già la differenza tra comandi e ambienti.

VimTeX ha alcune funzioni incorporate per la gestione di ambienti e
comandi, ma solo per **eliminarli** o **modificarli**.

La tabella riassuntiva delle funzioni incorporate è la seguente:

| Funzione                      | Tastiera |
|-------------------------------|:--------:|
| Elimina comando circostante   |  `dsc`   |
| Elimina ambiente circostante  |  `dse`   |
| Modifica comando circostante  |  `csc`   |
| Modifica ambiente circostante |  `cse`   |

Come si può notare, le combinazioni di tasti corrispondono alle iniziali
(in inglese) delle funzioni funzioni correlate.

Ad esempio: D(elete) S(surrounding) C(command) = `dsc` oppure C(hange)
S(urroundig) E(nvironment) = `cse` e così via.

In questo modo è più facile ricordare la sequenza dei tasti.

Quindi, con le funzioni incorporate in VimTex, è possibile *cancellare*
o *cambiare* i tag di ambienti o comandi.

Ad esempio:

- se vi trovate all'interno di un ambiente *itemize*, potete cancellare
  il comando `\begin{itemize} ... \... ´fine{itemize}` che circonda il
  testo, premendo la combinazione di tasti `dse`.
- se vi trovate all'interno di un ambiente *itemize*, potete cambiare il
  tag `\begin{itemize} ... \end{itemize}` in
  `\begin{enumerate} ... ... \end{enumerate}` premendo: `cse enumerate`.
- se vi trovate all'interno di un comando *textit*, potete cancellare il
  comando che circonda il testo premendo la combinazione di tasti `dsc`.
- se siete all'interno di un comando *textit*, potete cambiarlo in
  *textbf* premendo `csc textbf`.

Ma la domanda è: si possono **aggiungere** ambienti o comandi con le
funzioni integrate di VimTex?

La risposta è no, ma…

È possibile creare una funzione personalizzata che esegua questa
operazione.

Due soluzioni sono offerte dallo stesso programmatore di VimTex, Karl
Yngve Lervåg che ringrazio per l'ottimo lavoro, attualmente alle righe
5776 e seguenti del
<https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt>\[suo file
vimtex.txt\]\], capitolo **vimtex-faq-surround**.

Trovo che la prima soluzione si adatti perfettamente al contesto
dell'editor.

## Creare una funzione surround in VimTex basata sul plugin *surround.vim*

A questo scopo, è necessario installare un altro plugin,
***surround.vim*** e apportare una piccola modifica al file di
configurazione.

Come descritto sopra, è necessario inserire una piccola stringa di testo
aggiuntiva nel file di configurazione di vim, ad esempio in `.vimrc`
(per Linux/macOS) o in `_vimrc` (per Windows).

Lo scopo è quello di estendere le funzioni di *surround.vim* aggiungendo
le combinazioni di tasti `ys(object)c` e `ys(object)e` per creare
comandi e ambienti in LaTeX.

Ecco il codice:

gruppo latexSurround autocmd! autocmd FileType tex call
s:latexSurround() augroup END

funzione! s:latexSurround() let b:surround<sub>char2nr("e")</sub>
\\(01)} = "\\\begin{\1ambiente: \1}\\\end{\1\1}" let
b:surround<sub>char2nr("c")</sub> = "\\\\\1comando: \1{̊}" endfunction

Ora avete le seguenti due nuove risorse nel vostro "coltellino svizzero"
di Vim per LaTeX:

| Funzione                  |    Tastiera    |
|---------------------------|:--------------:|
| Crea comando circostante  | `ys(oggetto)c` |
| Crea ambiente circostante | `ys(oggetto)e` |
|                           |                |

Ovviamente, è necessario inserire i soliti marcatori di movimento o
oggetti di testo: ad esempio:

- `yswe center` per circondare una parola dall'ambiente *center*,
- `yssc textbf` per circondare un'intera riga dal comando *textbf*,
- `ysiwe comment` per circondare una parola con il cursore all'interno
  della parola stessa, dall'ambiente *comment*.
- `ysiwc section` per circondare una parola con il cursore all'interno
  di essa dal comando *section*.

Grazie per l'attenzione.
