---
title: "Vim e le liste di snippet per UltiSnips ed altri plugin."
date: 2024-06-20
slug:  vim_snippet_ultisnips_snipmate
categories:
  - Blog
tags:
  - Vim
  - Snippets
image:
  placement: 3
  preview_only: false 
  caption: 'UltiSnips Honza vim-snippets snipMate'
---


<p align="center">
ABSTRACT
</p>

Articolo  sulle diverse raccolte di snippet  per diversi *plugin* di Vim e sulla possibilità di convertire da un formato ad un altro.


- [1. Premessa](#1-premessa)
- [2. Passaggi per utilizzare gli snippet](#2-passaggi-per-utilizzare-gli-snippet)
- [3. Snippet personalizzati in locale.](#3-snippet-personalizzati-in-locale)
- [4. *Honza*: perché due diverse raccolte di *snippet*?](#4-honza-perché-due-diverse-raccolte-di-snippet)
- [5. Sintesi tra le due raccolte.](#5-sintesi-tra-le-due-raccolte)
- [6. È possibile "mescolare" gli snippet delle due raccolte?](#6-è-possibile-mescolare-gli-snippet-delle-due-raccolte)


## 1. Premessa

Nell'articolo ["Vim, UltiSnips ed Honza vim-snippets: differenza e gestione delle cartelle snippets ed UltiSnips"](https://francopasut.netlify.app/it/post/vim_honza_snippets_ultisnips/) ho già affrontato il tema degli *snippet* e di  *UltiSnips*  per Vim:

Questo articolo è un approfondimento rispetto al precedente,  soprattutto sotto l'aspetto delle differenze sintattiche  e della possibilità di "mescolare" tra loro  frammenti vari di codice tratti dalle due raccolte di *snippet*.

## 2. Passaggi per utilizzare gli snippet

Per la parte introduttiva su *UltiSnips* e *Honza vim-snippets* richiamo il mio precedente articolo sopra menzionato.

Riassumo brevemente i passaggi:

1. **Installazione di UltiSnips**:
   - Utilizzando  un  plugin manager come `vim-plug`, occorre aggiungere questa riga al tuo file di configurazione (`.vimrc` o `init.vim`):

     ```vim
     Plug 'SirVer/ultisnips'
     Plug 'honza/vim-snippets'
     ```
     Nel caso di altri *plugin manager* occorre utilizzare il procedimento specifico previsto.

2. **Configurazione di Vim**:
   - L'installazione non è sufficiente. Occorre anche aggiungere le seguenti righe alla configurazione di Vim per caricare gli snippet di `UltiSnips`:

     ```vim
     let g:UltiSnipsSnippetDirectories=["UltiSnips"]
     ```
3. **Riavvio di Vim**:
   - A questo punto basta riavviare Vim o eseguire `:source ~/.vimrc` per caricare le nuove impostazioni.

Con questa configurazione, `UltiSnips` caricherà automaticamente gli *snippet* presenti nella  cartella `UltiSnips` del *repository* `honza/vim-snippets`.

Ecco un esempio di configurazione completa per Vim con `UltiSnips` e gli snippet dal repository `honza/vim-snippets`:

```vim
call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

```

## 3. Snippet personalizzati in locale.

È possibile aggiungere *snippet* personalizzati in locale creando una cartella ed una raccolta per ciascuna tipologia di *snippet*. 

Ad esempio, per Markdown, si  deve creare  un *file* denominato `markdown.snippets` all'interno di una cartella dedicata che potrebbe, ad esempio, chiamarsi `UltiSnips` sotto la cartella `home`, come nell'esempio di seguito riportato:

```bash
mkdir ~/UltiSnips
cd UltiSnips
touch markdown.snippets
```

Anche in questo caso richiamo un mio precedente articolo: [Vim, Markdown, Snippets, UltiSnips: come ottenere un link ben formattato con un comando unico](https://francopasut.netlify.app/it/post/vim_markdown_snippet_url/) con un esempio concreto di *snippet* personalizzato.

Occorre, poi, adeguare la configurazione in `.vimrc`  per caricare sia gli snippet del repository `honza/vim-snippets` che quelli  personalizzati:

```vim

let g:UltiSnipsSnippetDirectories=["~/UltiSnips", "UltiSnips"]

```
Da notare che la prima configurazione richiama una cartella locale mente la seconda richiama il *repository* su GitHub.

L'ordine dei due comandi in `g:UltiSnipsSnippetDirectories` è importante. 

Gli snippet nelle directory specificate per primi sovrascriveranno quelli nelle directory successive in caso di conflitti.

È possibile usare il comando `:UltiSnipsEdit` per modificare direttamente gli snippet del linguaggio attivo e poi ricaricarli automaticamente.

## 4. *Honza*: perché due diverse raccolte di *snippet*?

Come già osservato nel mio precedente articolo, menzionato all'inizio, nella [pagina   GitHub di Honza vim-snippets](https://github.com/honza/vim-snippets) sono contenute due distinte raccolte di *snippet*:

- Una raccolta si trova nella  cartella denominata *UltiSnips*.
- Un'altra raccolta si trova nella cartella  denominata *snippets*.

L'immagine seguente rende bene l'idea delle due cartelle:

![Honza Snippets](honza_snippets_github_framed.png)
Gli *snippet* della prima  cartella sono progettati per essere utilizzati con il plugin `UltiSnips` di Vim.

Gli *snippet* della seconda cartella sono progettati per essere utilizzati con altri plugin di snippet per Vim, come `snipMate` e `neosnippet`.

Tra le due raccolte vi è una differenza sintattica essenziale: gli *snippet* presenti nella cartella *UltiSnips* hanno un  *tag* di chiusura denominato `endsnippet` mentre quelli contenuti nella  cartella *snippets* di primo livello non hanno alcun *tag* di chiusura.

## 5. Sintesi tra le due raccolte.

Riporto, in sintesi, le osservazioni sulle due raccolte:

1. Contenuto della cartella `UltiSnips`:
   - Gli snippet in questa cartella sono progettati per essere utilizzati con il plugin `UltiSnips`.
   - Ogni snippet ha un tag di chiusura denominato `endsnippet`.
   - Modello:

     ```vim
     snippet trigger "description"
     snippet content
     endsnippet
     ```
     Esempio concreto (tratto dalla raccolta `tex.snippets`):
     ```vim
     snippet fig "Figure environment" bi
     \begin{figure}[${1:htpb}]
     	\centering
     	${2:\includegraphics[width=0.8\textwidth]{$3}}
     	\caption{${4:$3}}
     	\label{fig:${5:${3/\W+/-/g}}}
     \end{figure}
     endsnippet
     ```

2. Contenuto della Cartella `snippets` di primo livello:
   - Gli snippet in questa cartella sono progettati per essere utilizzati con altri plugin di snippet, come `snipMate` e `neosnippet`.
   - Non includono un tag di chiusura.
   - Modello:

     ```vim
     snippet trigger
     snippet content
     ```
     Esempio concreto (tratto dalla raccolta `tex.snippets`):

     ```vim
     snippet fig figure environment (includegraphics)
     	\\begin{figure}
     	\\begin{center}
     		\\includegraphics[scale=${1}]{Figures/${2}}
     	\\end{center}
     	\\caption{${3}}
     	\\label{fig:${4}}
     	\\end{figure}
     	${0}
     ```

## 6. È possibile "mescolare" gli snippet delle due raccolte?

Gli *snippet* delle due raccolte sono materialmente diversi tra loro, non sono semplicemente due gruppi paralleli di *snippet* scritti con diversa sintassi.

Pertanto potrebbe essere utile scambiare *snippet* tra le due raccolte.

La domanda è, pertanto, la seguente: è possibile "convertire" gli snippet progettati per snipMate in quelli progettati per UltiSnips semplicemente aggiungendo il tag di chiusura?

Per avere un riscontro diretto ho provato a convertire alcuni *snippet* per Python contenuti nella cartella `snippets` per utilizzarli con il plugin *UltiSnips* semplicemente aggiungendo il tag di chiusura `endsnippet`.

Riporto la versione originale, seguita dalla versione "convertita":

- Versione originale:

```vim
    snippet pr
    	print($0)
    snippet prs
    	print("$0")
    snippet prf
    	print(f"$0")
    snippet fpr
    	print($0, file=${1:sys.stderr})
    snippet fprs
    	print("$0", file=${1:sys.stderr})
    snippet fprf
    	print(f"$0", file=${1:sys.stderr})
```

- Versione convertita per UltiSnips:

```vim
    snippet pr
        print($0)
    endsnippet
    snippet prs
        print("$0")
    endsnippet
    snippet prf
        print(f"$0")
    endsnippet
    snippet fpr
        print($0, file=${1:sys.stderr})
    endsnippet
    snippet fprs
        print("$0", file=${1:sys.stderr})
    endsnippet
    snippet fprf
        print(f"$0", file=${1:sys.stderr})
    endsnippet
```

La prova ha dato esito positivo: l'aggiunta del *tag* di chiusura ha consentito di rendere disponibili gli *snippet* anche per *UltiSnips*.

In generale, quindi, l'aggiunta del  tag di chiusura `endsnippet` consente di convertire gli *snippet* dalla cartella *snippets* di `honza/vim-snippets` nel formato dedicato ad *UltiSnips*.

Tuttavia alcuni *snippet* potrebbero richiedere modifiche aggiuntive per funzionare correttamente con *UltiSnips*. Potrebbe essere necessario regolare le variabili, la logica o la formattazione per garantire un comportamento coerente.

È fondamentale testare accuratamente ogni *snippet* convertito per garantirne il corretto funzionamento.

Nei casi più complessi potrebbe essere necessario utilizzare strumenti di conversione dedicati, ad es. [snippets-converter.nvim](https://github.com/smjonas/snippet-converter.nvim).

Grazie per l'attenzione.
