---
title: "Vim, Sublime Text, Visual Studio Code e i cursori multipli."
date: 2024-07-08
slug:  vim_sublime_vsc_multicursors
categories:
  - Blog
tags:
  - Vim
  - Visual Studio Code
  - Sublime Text
image:
  placement: 3
  preview_only: false 
  caption: 'Cursori multipli'
---


<p align="center">
ABSTRACT
</p>

Articolo sulla gestione comparata dei cursori multipli in Sublime Text, Visual Studio Code e Vim.

- [1. Cursori multipli? Multi-cursori? Di cosa stiamo parlando?](#1-cursori-multipli-multi-cursori-di-cosa-stiamo-parlando)
- [2. Chi ha "inventato" i cursori multipli?](#2-chi-ha-inventato-i-cursori-multipli)
- [3. I cursori multipli in Sublime Text 3 e 4.](#3-i-cursori-multipli-in-sublime-text-3-e-4)
- [4. I cursori multipli in Visual Studio Code.](#4-i-cursori-multipli-in-visual-studio-code)
- [5. Confronto tra Sublime Text e Visual Studio Code](#5-confronto-tra-sublime-text-e-visual-studio-code)
- [6. Vim e le funzioni integrate di modifica multipla.](#6-vim-e-le-funzioni-integrate-di-modifica-multipla)
- [7. Multi cursori effettivi anche su Vim.](#7-multi-cursori-effettivi-anche-su-vim)


## 1. Cursori multipli? Multi-cursori? Di cosa stiamo parlando?

Cosa sono i cursori multipli?

Un esempio vale più di molte parole: immaginate di avere un elenco composto  da centinaio di righe e di dovere inserire un alcuni caratteri, ad esempio una coppia di asterischi,  all'inizio ed alla fine di ciascun termine della lista.

Provate ad eseguire l'operazione manualmente per un centinaio di volte ed a cronometrare il tempo dedicato!

Ora immaginate, invece, di inserire quei caratteri **una sola volta per tutte le righe** ma utilizzando un **centinaio di cursori contemporaneamente**.

![Multi Cursor List](multi_cursor_list.png)

Questi sono, appunti, i **cursori multipli**.

Notate come i cursori **non siano allineati**: questo dipende dal fatto che ogni singolo cursore si sposta a seconda della lunghezza delle parole. In altri termini: i cursori sono indipendenti tra loro per quanto concerne la gestione delle parole e delle frasi.

## 2. Chi ha "inventato" i cursori multipli?

I cursori multipli sono stati introdotti per la prima volta nell'editor di testo **Sublime Text 2**, rilasciato nel 2011.

Chi utilizzava *Sublime Text* si è reso conto che l'utilizzo dei cursori multipli poteva fare risparmiare un'enorme quantità di tempo.

Per questo, altri editor di testo, come
**Visual Studio Code**,
**Atom** (editor ormai abbandonato, purtroppo),
**Vim** (solo installando un *plugin*),
**Emacs** (solo installando un *plugin*),
**UltraEdit**,
**Gedit**,
hanno, successivamente, implementato funzionalità simili.

In questo articolo riporto alcune considerazioni pratiche su vari sistemi operativi, ovvero  in  Windows 10 (utilizzato "necessariamente"  per lavoro) e varie distribuzioni GNU/Linux (in particolare Debian, Arch, Fedora e Ubuntu) sui  cursori multipli in  **Sublime Text 3/4**,  in **Visual Studio Code** ed in **Vim** con qualche cenno alle funzioni integrate  in Vim che consentono di ottenere, ma solo in determinate condizioni, risultati analoghi.

Attenzione: non ho approfondito il tema collegato delle *selezioni multiple* (ad esempio: `Ctrl+d` in Sublime Texte e Visual Studio Code, che meriterebbe una trattazione separata.

Quindi, non dovete considerare questo articolo come una rassegna completa sul tema dei cursori multipli ma soltanto una descrizione delle funzioni che utilizzo  in concreto  sui tre *editor* indicati.

## 3. I cursori multipli in Sublime Text 3 e 4.

Per rendere omaggio all'inventore dei cursori multipli,  la prima analisi non può che essere dedicata a *Sublime Text*.

Il sistema più semplice per aggiungere cursori è quello di tenere premuto il tasto `Ctrl` e di *cliccare* con il tasto sinistro del *mouse* sui vari punti in cui occorre aggiungere i cursori.

Un altro metodo è quello di tenere premuti i tasti `Alt+Shift` ed usare i tasti freccia per estendere i cursori multipli al di sotto o al sopra del punto iniziale.

Ma il metodo che trovo praticamente "perfetto" è quello della combinazione `Ctrl+Shift+l`.

In pratica funziona così: occorre selezionare tutti i vari paragrafi, senza alcuna limitazione di lunghezza, che si intendono associare a cursori multipli; una volta terminata la selezione si preme  `Ctrl+Shift+l` per creare i cursori multipli al termine di ogni paragrafo.

Dopo avere aggiunto i vari cursori basta scrivere o effettuare qualsiasi operazione, ad esempio di spostamento in avanti o indietro, che sarà estesa parallelamente a tutti i punti in cui sono stati aggiunti i vari cursori.

Nel caso di paragrafi che vanno a capo della riga, occorre premere `Home` o `End` due volte per mandare tutti i cursori contemporaneamente all'origine o alla fine effettive delle righe.

Per uscire dai cursori multipli si preme il tasto `Esc` oppure si *clicca* con il mouse, senza tenere premuto il tasto `Ctrl` in un punto qualsiasi del documento.

A tale proposito ho notato che in *Sublime Text 3* è necessario premere il tasto *Esc* due volte.

È probabile che tale configurazione abbia lo scopo di  prevenire uscite accidentali dalla modalità multipla oppure di separare le operazioni di annullamento ed uscita.

Il sistema è veramente utile per effettuare velocemente e contemporaneamente operazioni di *editing* su numero virtualmente infinito di paragrafi.

## 4. I cursori multipli in Visual Studio Code.

La gestione dei cursori multipli in *Visual Studio Code* presenta qualche piccola differenza rispetto   a  *Sublime Text*.


Per aggiungere cursori con il *mouse* in punti diversi del documento si preme il tasto `Alt` al posto di `Ctrl`.

Per aggiungere i cursori in sequenza, la combinazioni di tasti è simile: `Shift + Alt + Down↓/Up↑`

Per aggiungere i cursori alla fine di ogni riga selezionata si può utilizzare la *palette* con il comando veloce `F1` o quello più lungo `Ctrl + Alt + P` e cercare il comando `Add Cursors to Line Ends`.

Il dato interessante di Visual Studio Code è che ogni comando può essere lanciato dalla *Command Palette*, senza necessità di *ricordare* le varie combinazioni di lancio.

Anche la funzione di aggiunta dei cursori ad ogni fine paragrafo è indicata nella *Palette*, con la relativa combinazione di lancio:  `Shift + Alt + I`.

La *palette* dei comandi di Visual Studio Code  è effettivamente completa e utile per avere tutto a portata di mano senza necessità di memorizzare le varie scorciatoie.

In altri termini, Visual Studio Code consente di liberare la memoria (umana) destinata  e, quindi, di scrivere concentrandosi sui contenuti.


## 5. Confronto tra Sublime Text e Visual Studio Code

Data la similitudine tra i due *editor*, almeno per quanto concerne i cursori multipli, riporto una semplice tabella di comparazione per tre modalità di aggiunta:


| Editor             | Con mouse     | In sequenza               | Fine aree selezionate |
| :----------------- | :------------ | :------------------------ | :-------------------- |
| Sublime Text       | `Ctrl + clic` | `Shift + Alt + Down↓/Up↑` | `Ctrl+Shift+l`        |
| Visual Studio Code | `Alt + clic`  | `Shift + Alt + Down↓/Up↑` | `Shift + Alt + I`     |

In entrambi gli *editor*, per uscire occorre premere `Esc` o *cliccare* senza premere il tasto `Ctrl` in un punto qualsiasi del documento.


## 6. Vim e le funzioni integrate di modifica multipla.

Vim non ha, nativamente, funzioni di gestione dei cursori multipli analoghe a quelle dei più recenti *editor* sopra visti.

Ciò, tuttavia, non significa che Vim, anche senza *plugin*, non possa gestire più righe contemporaneamente.

La  funzione  integrata per modificare  più righe contemporaneamente avviene tramite  la modalità *blocco visivo*.

La combinazione  `Ctrl+v`, predispone l'*editor* alla selezione di varie righe sottostanti consecutive  mediante il tasto  `j`.

Arrivati all'ultima riga, si possono utilizzare **per tutte le righe selezionate** i  *movimenti*, come ad esempio il tasto `w` per passare alla parola successiva.

Tuttavia i *movimenti*  funzionano, per tutte le righe, basandosi   sulla struttura dell'ultima riga.

Ad esempio: è possibile aggiungere il prefisso `\item` ad ogni riga con il seguente procedimento:

- `Ctrl+v` (`Ctrl+q` in Windows) per attivare la selezione delle varie righe,
- Selezione materiale delle righe con i tasti di movimento, es. `j`.
- Premere `I` (i maiuscola),
- Digitare il testo `\item` che verrà visualizzato solo sulla prima riga,
- Premere il tasto `Esc` ottenendo l'aggiunta  su tutte le righe selezionate del testo inserito.

Il sistema funziona perfettamente ma ad una condizione essenziale:  tutto il testo selezionato  deve  essere perfettamente allineato.

Se, quindi, una parola di una riga fosse più lunga o più corta rispetto alle parole di  righe parallele, il sistema darebbe un risultato non coerente.

## 7. Multi cursori effettivi anche su Vim.

Anche su Vim è, tuttavia, possibile ottenere un'effettiva esperienza di cursori multipli, molto simile a quella dei due *editor* precedenti.

Per tale funzione, occorre installare il *plugin* [vim-visual-multi](https://github.com/mg979/vim-visual-multi).


Con questo *plugin* i comandi  di spostamento si  adattano automaticamente alla lunghezza effettiva delle parole in ciascuna riga, in modo analogo a quanto avviene in *Sublime Text* ed in *Visual Studio Code*.

A questo punto è possibile creare cursori multipli con il comando `Ctrl + Down↓/Up↑`.

Una volta creati i cursori si possono immediatamente effettuare le consuete operazioni in *modo normale*, ad esempio `dw`, `de`, `yw`, oppure effettuare i vari spostamenti con `w`, `$`, `0`.

La videata seguente è il risultato dello spostamento con `2w`:

![vim multi cursori](vim_multi_cursors.png)

Si può attivare il *modo esteso*, che corrisponde all'estensione multi-cursore del tipico *modo visuale* di Vim,  premendo il tasto `Tab`.

Si attiva, poi, la scrittura in *Insert Mode* con `i`,`a`, `I`,`A`.

In particolare:

- `i` attiva il modo inserimento nei punti in cui si trovano i vari cursori,
- `a` attiva il modo inserimento sui caratteri successivi rispetto a quelli in cui si trovano i vari cursori,
- `I` attiva il modo inserimento all'inizio delle righe,
- `A` attiva il modo inserimento alla fine delle righe.

Esistono altri comandi, oltre a quelli sopra indicati.

L'elenco completo si trova [questo punto](https://github.com/mg979/vim-visual-multi?tab=readme-ov-file#vim-visual-multi) della pagina GitHub del *plugin*.

Grazie per l'attenzione.