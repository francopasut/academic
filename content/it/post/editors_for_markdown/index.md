---
title: "Markdown con Vim, Emacs, Sublime Text 4 e Visual Studio Code"
date: 2024-04-12
slug:  markdown-vim-emacs-sublime-vscode
categories:
  - Blog
tags:
  - Markdown
  - Emacs
  - Vim
  - Sublime Text
  - Visual Studio Code
image:
  placement: 3
  preview_only: false 
  caption: 'Sistemi di scrittura per Markdown'
---


<p align="center">
  <i>Abstract:</i>
</p>

Come se la cavano   quattro editor *generalisti*, ovvero progettati per essere utilizzati con una vasta gamma di linguaggi di programmazione e file di testo,  per la scrittura di documenti in linguaggio Markdown? Questo è l'oggetto di questo articolo basato sulle mie esperienze personali   nell'utilizzo di Vim, Emacs, Sublime Text 4 e Visual Studio Code sia direttamente che con estensioni dedicate al predetto linguaggio di marcatura.

- [1. Premessa.](#1-premessa)
- [2. Vim e Markdown.](#2-vim-e-markdown)
  - [2.1. Vim senza *plugin*.](#21-vim-senza-plugin)
  - [2.2. Vim con il *plugin* vim-markdown.](#22-vim-con-il-plugin-vim-markdown)
  - [2.3. Vim con il *plugin* UltiSnips.](#23-vim-con-il-plugin-ultisnips)
  - [2.4. Vim e l'anteprima di Markdown.](#24-vim-e-lanteprima-di-markdown)
- [3. Emacs e Markdown.](#3-emacs-e-markdown)
  - [3.1. Emacs senza *plugin*.](#31-emacs-senza-plugin)
  - [3.2. Emacs con il *markdown-mode*.](#32-emacs-con-il-markdown-mode)
  - [3.3. Emacs e l'anteprima in Markdown.](#33-emacs-e-lanteprima-in-markdown)
- [4. Sublime Text 4 e Markdown.](#4-sublime-text-4-e-markdown)
  - [4.1. Sublime Text 4 senza *plugin*.](#41-sublime-text-4-senza-plugin)
  - [4.2. Sublime Text 4 con il *plugin* "MarkdownEditing".](#42-sublime-text-4-con-il-plugin-markdownediting)
  - [4.3. Sublime Text 4 e l'anteprima in Markdown.](#43-sublime-text-4-e-lanteprima-in-markdown)
- [5. Visual Studio Code e Markdown.](#5-visual-studio-code-e-markdown)
  - [5.1. VSCode senza *plugin*](#51-vscode-senza-plugin)
  - [5.2. VSCode con il *plugin* "Markdown All in One".](#52-vscode-con-il-plugin-markdown-all-in-one)
- [6. In sintesi.](#6-in-sintesi)


## 1. Premessa.

Markdown è un  linguaggio  di marcatura semplice, alla portata di chiunque, compatibile con HTML e che consente di scrivere testi molto eleganti e ben formattati sia per la pubblicazione in rete che per la stampa.

Questo articolo, tuttavia, non tratta del linguaggio in sè, peraltro ampiamente descritto in rete,  ma di come vari *editor* a linea di comando consentano di scrivere in Markdown.

Una caratteristica sia dei linguaggi di marcatura che di programmazione  consiste, infatti,  nella utilizzabilità di qualsiasi *editor* di testo semplice per scrivere il relativo codice.

L'articolo è basato sulla mia personale esperienza con  *Vim*, *Emacs*, *Sublime Text* e *Visual Studio Code*,  su tre punti principali:

1. Comportamento dell'editor  senza *plugin* o estensioni installate.
1. Comportamento con plugin o estensioni specifici per il linguaggio Markdown.
1. Gestione dell'anteprima.


## 2. Vim e Markdown.

Vim può essere un formidabile strumento di scrittura anche per Markdown, come per qualsiasi altro linguaggio,  a patto di superare l'ostacolo iniziale costituito dalla fase  di apprendimento.

### 2.1. Vim senza *plugin*.

Senza *plugin* il formato *.md* viene gestito come semplice documento di testo senza alcuna funzione dedicata.


In pratica: il "valore aggiunto"  di Vim  è  **Vim stesso**,  con la propria originale scrittura *modale*.

La comunità degli utilizzatori di Vim ha, tuttavia, sviluppato alcune estensioni molto utili per la scrittura in Markdown, tra cui  *"[vim-markdown](https://github.com/preservim/vim-markdown)"* e *"[UltiSnips](https://github.com/SirVer/ultisnips)"*.

### 2.2. Vim con il *plugin* vim-markdown.

Il *plugin* [vim-markdown](https://github.com/preservim/vim-markdown) è utile per molte funzioni tra cui: il  *folding*,  il  *concealing*, il movimento tra i nomi di sezioni, il TOC (Table Of Contents).

Nella [pagina del programmatore](https://github.com/preservim/vim-markdown)  sono analiticamente descritte le funzionalità rese disponibili dal *plugin*.

Riporto, in questo articolo, soltanto la parte relativa al TOC:

>:Toc: create a quickfix vertical window navigable table of contents with the headers.
>
>Hit <Enter> on a line to jump to the corresponding line of the markdown file.
>
>:Toch: Same as :Toc but in an horizontal window.
>
>:Toct: Same as :Toc but in a new tab.
>
>:Tocv: Same as :Toc for symmetry with :Toch and :Tocv.
>
>:InsertToc: Insert table of contents at the current line. 

### 2.3. Vim con il *plugin* UltiSnips.

Un eccellente  *plugin* per Vim è [UltiSnips](https://github.com/SirVer/ultisnips). 

Le raccolte di *snippets* dedicate a quel *plugin* si trovano in [honza/vim-snippets](https://github.com/honza/vim-snippets/tree/master/UltiSnips).

Sull'argomento rimando ai  miei due articoli seguenti:

- ["Vim, UltiSnips ed Honza vim-snippets: differenza e gestione delle cartelle snippets ed UltiSnips"](https://francopasut.netlify.app/it/post/vim_honza_snippets_ultisnips/)
- ["Vim, Markdown, Snippets, UltiSnips: come ottenere un link ben formattato con un comando unico"](https://francopasut.netlify.app/it/post/vim_markdown_snippet_url/)

Il primo articolo è dedicato alla gestione degli snippets in Vim con  *UnltiSnip* mentre il secondo contiene uno *snippet* personalizzato che trovo molto utile per creare collegamenti ipertestuali quando il testo descrittivo è già presente nei documenti.

### 2.4. Vim e l'anteprima di Markdown. 

Per quanto concerne la gestione dell'anteprima richiamo altri due miei articoli:

-  ["Vim e l'anteprima in Markdown"](https://francopasut.netlify.app/it/post/vim_markdown_preview_plugin/),
-  ["Markdown in Firefox"](https://francopasut.netlify.app/it/post/markdown_firefox/).


## 3. Emacs e Markdown.

Emacs è un altro editor altamente personalizzabile ed estensibile con una vastissima base di programmi aggiuntivi.

### 3.1. Emacs senza *plugin*.

L'apertura di un *file* ".md"  con  Emacs  privo di  pacchetti aggiuntivi attiva la modalità "Fundamental" ovvero la  modalità di base dell'editor.

In questa modalità non vi è alcuna funzionalità dedicata a Markdown  ed è possibile utilizzare l'editor con le proprie funzionalità native come se per un qualsiasi documento di testo.


### 3.2. Emacs con il *markdown-mode*.

Per aggiungere funzionalità specifiche ai documenti scritti in Markdown  occorre installare il  pacchetto [markdown-mode](https://jblevins.org/projects/markdown-mode/).

Riporto l'immagine tratta  dall'attuale pagina iniziale del *plugin*:

![markdown_mode](markdown_mode.png)

La stringa di installazione con la libreria Melpa è la seguente: `M-x package-install RET markdown-mode RET `.

Per *Straight* con *use-package*, che è la mia attuale configurazione, occorre inserire la seguente configurazione in *.emacs*:

```elisp
(use-package markdown-mode
  :straight t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "markdown"))
```
Un'osservazione: in rete si trova la configurazione `use-package` associata al comando *multimarkdown*. Io ho preferito modificare tale configurazione ed associarlo al comando  *markdown* per maggiore semplicità di installazione.

Il comando *multimarkdown*, infatti, deve essere compilato dalla sorgente, come indicato nella [pagina dedicata su GitHub](https://fletcher.github.io/MultiMarkdown-5/installation).


Con il pacchetto *markdown-mode* viene anche installato, nella barra superiore, un menu con l'indicazione delle principali operazioni:

![Emacs Markdown-Mode Menu](emacs_markdown_mode_menu.png)

Il menu è molto utile per avere a disposizione   le principali  combinazioni di tasti del *plugin*.

Con tale pacchetto la  gestione della strutturazione dei documenti diventa simile a quella di *Org-mode*,  con l'uso del tasto `Tab` nelle intestazioni per espanderle o collassarle singolarmente e della combinazione `Shift-Tab` per espandere o collassare tutte le intestazioni contemporaneamente.

Anche i comandi  di spostamento tra i paragrafi sono  gli stessi di *Org-mode*:

- `C-c C-n` per saltare all'intestazione successiva di qualsiasi livello.
- `C-c C-p` per saltare all'intestazione precedente di qualsiasi livello.
- `C-c C-f` per saltare all'intestazione successiva dello stesso livello.
- `C-c C-b` per saltare all'intestazione precedente dello stesso livello.
- `C-c C-u` per risalire di livello.

Anche queste combinazioni, come molte altre, sono riportate nel menu dedicato a Markdown.

La descrizione analitica dei comandi è riportata anche alla [pagina del pacchetto](https://jblevins.org/projects/markdown-mode/).

### 3.3. Emacs e l'anteprima in Markdown.

Tra i comandi aggiunti dal *plugin* c'è, come è visibile nell'immagine precedente, anche la voce *Preview & Export* in cui è possibile lanciare sia l'anteprima su *browser* (`C-c C-c p`) che  il *Live Export*  (`C-c C-c l`) su finestra separata di Emacs.

Emacs usa una propria configurazione per il *browser* dell'anteprima, indipendente dal *browser* di "default" del sistema operativo.  

Negli esempi seguenti la personalizzazione consente di lanciare Opera al posto di Firefox.

Per modificare la configurazione con il sistema di pacchetti  Melpa, si usa il seguente frammento in `.emacs`:

```elisp
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "opera")
```

Con il sistema  `use-package` con `straight.el`  si può aggiungere un frammento alla configurazione già sopra riportata.

Il frammento dedicato al browser inizia dalla riga contenente il comando `:config`:


```elisp
(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "markdown")
  :config
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "opera"))
```


## 4. Sublime Text 4 e Markdown.

Una delle principali novità introdotta da *Sublime Text* rispetto ai precedenti editor è  costituita dalla *Command Palette*.

Grazie alla *Command Palette*  è sufficiente ricordare un'unica combinazione di tasti,   tipicamente `ctrl + shift + p` (Windows, Linux) o `⌘ + ⇧ + p` (su Mac),  per tutti i comandi.

Questo facilita molto la memorizzazione delle combinazioni specifiche che possono anche essere digitate direttamente per evitare il passaggio intermedio della Command Palette stessa.

### 4.1. Sublime Text 4 senza *plugin*.

In modalità di base,  Sublime Text 4 ha un comportamento  molto interessante: anche nativamente l'editor riconosce il linguaggio dall'estensione del nome del documento ed inserisce l'indicazione "*Markdown*" in basso a destra, con attivazione della combinazione di tasti `Ctrl-r` per saltare tra i paragrafi.

### 4.2. Sublime Text 4 con il *plugin* "MarkdownEditing".

Un ottimo plugin è [Markdown Editing](https://sublimetext-markdown.github.io/MarkdownEditing/).

![markdown_editing](markdown_editing.png)

Dopo l'installazione del *plugin* anche le sue funzioni sono attivabili tramite la Palette.

È sufficiente, quindi, aprire la *Command Palette*  con `ctrl + shift + p` (Windows, Linux) o `⌘ + ⇧ + p` (su Mac) e premere il comando richiesto, ad esempio *fold* o *link*, e lanciare il comando che risulta accanto al nome *MarkdownEditing*.

![sublime fold palette](sublime_fold_palette.png)

Digitando  nella *Command Palette* la stringa *MarkdownEditing:* si avrà l'elenco completo dei comandi disponibili con il *plugin*.

### 4.3. Sublime Text 4 e l'anteprima in Markdown.

Per  l'anteprima è possibile installare il plugin "Markdown Preview", attivare la lista dei comandi con ` ctrl + shift + p`, lanciare il comando `Markdown Preview: Preview in browser` e selezionare *markdown*.

![sublime preview](sublime_preview_palette.png)

## 5. Visual Studio Code e Markdown.

Infine: *Visual Studio Code*, di seguito per brevità VSCode.

È l'*editor* più recente tra quelli menzionati in questo articolo.

Anche VSCode ha la *Command Palette*, già descritta per Sublime Text, attivabile con il comando `Ctrl + Shift + P`.

### 5.1. VSCode senza *plugin*

Anche senza alcuna aggiunta, VSCode consente di visualizzare l'anteprima dei documenti scritti in Markdown.

L'anteprima integrata  deve essere attivata mediante la combinazione `Ctr+K V` per aprire  una finestra affiancata o `Ctrl+Shift V` per aprirlo in un *tab* separato.

Una particolarità molto utile: l'anteprima *segue* automaticamente la posizione del cursore nel documento e risponde automaticamente allo *scrolling* del *mouse*.

Un'altra funzione integrata è l'Outline laterale basato sull'intestazione dei paragrafi ai vari livelli. Si trova nella finestra di *Explorer*, sulla sinistra della schermata.

L'Outline può anche essere generato con il comando `Ctrl+Shift O` per saltare velocemente in qualsiasi paragrafo del documento.

Inoltre VSCode comprende una raccolta di  *snippets* per inserire velocemente vari elementi del linguaggio. Gli *snippets* vengono attivati con il comando `Ctrl+Spazio`.

Quindi, VSCode ha un set nativo molto avanzato di funzioni dedicate al linguaggio Markdown.

### 5.2. VSCode con il *plugin* "[Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)".

Naturalmente esistono vari *plugin* che estendono  VSCode per Markdown.

Il mio preferito, in questo momento, è *Markdown All In One* che consente, tra l'altro, di creare un  Indice (Table Of Contents, TOC) automatico in qualsiasi punto del documento e di aggiungere la numerazione  dei paragrafi.

Per il creazione del TOC basta partire dalla *Command Palette* e digitare "*table*" per ottenere i  comandi  sia per la creazione che per l'aggiornamento dell'indice.

Per la numerazione automatica delle intestazioni si parte  ancora una volta dalla *Command Palette*  digitando la parola "numbers", anche parzialmente, per ottenere il comando per creare/aggiornare o rimuovere la numerazione.

È anche possibile generare una documento HTML esportato dal documento Markdown, digidando la parola  "html" nella Palette di comando.



## 6. In sintesi.

Quale programma  uso per scrivere in Markdown?

Cerco di usarli tutti.

Però preferisco Vim quando voglio fare un po' di  *training mentale* e *Visual Studio Code* quando voglio scrivere "tranquillamente" ottenendo automaticamente una visualizzazione in anteprima, il  sommario e la numerazione dei paragrafi.

Grazie per la vostra attenzione.
