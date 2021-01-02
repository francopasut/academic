---
title: "Vim, movimenti lampo tra diverse finestre con EasyMotion"
date: 2020-08-11
canonical_url: "https://francopasut.github.io/editors/vim-easymotion/"
slug: vim_easymotion
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  caption: 'Vim like a lighting bolt'
---


{{% toc %}}



## Breve introduzione

Vim può saltare velocemente attraverso diversi documenti.

Vi è mai capitato di muovere il cursore usando i tasti freccia e premere continuamente i tasti fino al punto desiderato?

Se utilizzate Vim quei movimenti saranno soltanto un brutto ricordo. 

Dovete soltanto installare il componente aggiuntivo [EasyMotion](https://github.com/easymotion/vim-easymotion) e aggiungere qualche piccola configurazione. 




## Installazione e configurazione di *EasyMotion*

L'installazione del componente *EasyMotion* è veramente molto semplice.

Se utilizzate [Vim Plug](https://github.com/junegunn/vim-plug) per gestire i componenti aggiuntivi, attualmente il mio gestore favorito, tutto ciò che dovete fare è inserire nel vostro *.vimrc* le seguenti stringhe:

```vim
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
```

The stringhe devono essere inserire in mezzo ai seguenti delimitatori

-   `call plug#begin('~/.vim/plugged')`
-   `call plug#end()`

A questo punto dovete digitare il comando `:PlugInstall`. Tutto qui. 

Se utilizzate altri gestori le operazioni potrebbero essere leggermente differenti.

Dopo l'installazione occorre configurare il componente seguento le istruzioni presenti nella [pagina dello sviluppatore](https://github.com/easymotion/vim-easymotion).

Riporto la mia attuale configurazione: 

```vim
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

function! s:incsearch_config(...) abort
return incsearch#util#deepextend(deepcopy({
	\   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
	\   'keymap': {
	\     "\<CR>": '<Over>(easymotion)'
	\   },
	\   'is_expr': 0
	\ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
```
Non è affatto un problema se non conoscete lo specifico significato del codice: dovete soltanto copiarlo ed incollarlo nel vostro file di configurazione *.vimrc*. 


## Utilizzo di  *EasyMotion* in Vim

È anche molto semplice usare il componente. 

Per raggiungere il punto del documento che desiderate, dovete osservare il testo ed identificare uno o più caratteri da utilizzare come bersaglio. 

Quindi premete, nella modalità _normale_, uno dei comandi seguenti: 

1.  `\f` per saltare ad un singolo carattere
2.  `\s` per saltare verso una combinazione di due caratteri
3.  `/  + string search` per saltare verso una stringa di testo  completa

Seguendo le istruzioni avrete una serie di lettere evidenziate sul testo base: trattasi dei *punti bersaglio* che potrebe raggiungere premendo la lettera corrispondente. 

Potete saltare ovunque sia nello stesso documento che in altri documenti visibili a monitor.

Dovete soltanto premere la lettera di puntamento. Tutto qui!




## Esempi con immagini

Qualche immagine può essere molto utile.

Nella prima immmagine potete osservare il risultato di una ricerca di singolo carattere con il comando seguente: `\f + <one letter>` ("\\" è la cosiddetta lettera _\<Leader\>_ di base).

Nell'esempio seguente ho utilizzato la ricerca della lettera "o".

![Figura 1](/img/barra-f.png "Esempio di ricerca con  *Leader*-f")

Nel secondo esempio ho utilizzato una ricerca a doppio carattere con il comando `\s + <two letters>` puntato sulle lettere *qu*: le lettere bersaglio sono molto meno numerose.

![Figura 2](/img/barra-s.png "Esempio di riserca con  *Leader*-s")



Potete anche utilizzare il sistema di ricerca di Vim, ovvero la combinazione di `/ + <word>`.

Nella seguente immagine potete vedere il risultato della seguente ricerca `/ + "justo"`. Ora si utilizza la lettera *d* come bersaglio ed otterrete il seguente risultato:

![Figura 3](/img/barra-cerca-justo.png "L'effetto del componente nel sistema ordinario di ricerca di Vim.")

Nell'immagine finale potete vedere il risultato della *ordinaria ricerca in Vim* con gli effetti aggiunti da *EasyMotion*.

Potete vedere che la posizione del cursore è esattamente sotto la lettera *d*.

![Figura 4](/img/barra-cerca-justo-evid.png "Esempio di ricerca  in Vim con le parola evidenziate")




## In breve

In Vim potete utilizzare il componente *EasyMotion* per saltare verso qualsiasi punto di un documento visibile nel mosaico del vostro deskto. 

Grazie per la vostra attenzione.

Pubblicato in origine nel [mio Notebook](https://francopasut.github.io/editors/vim-easymotion/)


