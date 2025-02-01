---
title: "Vim e l'anteprima in Markdown"
date: 2023-02-11
slug:  vim_markdown_preview_plugin
categories:
  - Blog
tags:
  - Vim
  - Markdown
image:
  placement: 3
  preview_only: false 
  caption: 'Vim e Markdown'
---




## Premessa

Vim è un ottimo editor per Markdown, sia per le proprie caratteristche "native" che per la possibilità di aggiungere specifiche funzioni tramite "plugin".

Per la visualizzazione in anteprima dei documenti occorre, a meno che non si utilizzi la soluzione "manuale" menzionata al termine di questo articolo, utilizzare un "plugin" dedicato.

Fino a qualche anno fa, il mio preferito era "_iamcco/markdown-preview.vim_" perchè forniva un vero effetto _live_ in tempo reale durante la digitazione del testo, ancora prima del salvataggio periodico.

Purtroppo quel progetto è stato abbandonato dal mese di febbraio 2020.

Tuttavia esistono interessanti soluzioni alternativa che costituiscono l'oggetto di questi appunti.

Il sistema operativo prevalentemente utilizzato per questo articolo è Arch Linux ma vi sono indicazioni anche per altre distribuzioni GNU/Linux.

## Anteprima con il plugin "Livedown"

Per questa soluzione è necessario utilizzare *npm* ovvero Node Package Manager, una libreria per i pacchetti JavaScript.

Per l'installazione nelle distribuzioni derivate da Debian si usa:

```bash
$ sudo apt install npm
```

Per CentOS 8, Fedora, e  Red Hat:

```bash
$ sudo dnf install npm	
```

Per  Arch Linux e  derivate (Manjaro, EndeavourOS): 

```bash
$ sudo pacman -S npm
```

oppure (per chi usa *yay*): 

```bash
$ yay -S npm
```


Arch ha proposto, subito dopo la prima installazione di `npm`, l'aggiornamento ad `npm@9.3.0` che ho effettuato,  seguendo le indicazioni,  con:

```bash
sudo npm install -g npm@9.3.0.
```

A questo punto  l'installazione di *livedown* avviene attraverso `npm` con il comando:

```bash
sudo npm install -g livedown
```

A questo punto è possibile procedere all'installazione del  *plugin* vero e proprio con i sistemi previsti per ciascun gestiore.

Ad esempio, con il sistema *VimPlug* si usa il comando:  

```bash
Plug 'shime/vim-livedown'.
```


Infine, per evitare di digitare ogni volta l'intero comando `LivedownToggle`,   occorre personalizzare la tastiera inserendo nel file di configurazione *.vimrc* il seguente comando:

```bash
nmap gm :LivedownToggle<CR> 
```

Al posto della combinazione `gm`  è possibile utilizzarne altre prestando attenzione a non creare conflitto con altro comando di sistema.


Mentre il *plugin* è in stato di attivazione, l'anteprima viene automaticamente aggiornato nel browser attivo  ad ogni salvataggio del documento (comando `:w` di Vim).

## Anteprima con il plugin "Vim Markdown Preview"

La pagina di riferimento del plugin è [questa](https://github.com/JamshedVesuna/vim-markdown-preview#toggle).

Anche in questo caso occorre la disponibilità di uno specifico strumento di installazione:  *PIP*.

*PIP* serve ad automatizzare l'installazione e la gestione di pacchetti e moduli scritti nel linguaggio *Python*.

In Arch Linux si usa:

```bash
sudo pacman -S python2-pip # per Python 2
sudo pacman -S python-pip # per Phyton 3 
```


In Debian e derivate (Ubuntu, Mint) si usa:

```bash
install python-pip	#python 2
install python3-pip	#python 3
```

In CentOS:

```bash
install epel-release 
install python-pip
```

In Fedora:

```bash
dnf install python-pip	#Python 2
dnf install python3		#Python 3
```


Per la visualizzazione del GitHub Flavoured Markdown, con caratteristiche aggiuntive rispetto alla versione base, è necessario [Grip](https://github.com/joeyespo/grip).

Per installare *grip* tramite *pip* si usa il comando: `pip install grip`.

Il sistema mi ha  installato (alla data del  14/1/2023) *grip 4.6.1* nella cartella *home* dell'utente, ovvero `/home/username/.local/bin` (dove *username* corrisponde al nome reale dell'utente).

Può accadere che *grip* non venga "visto" dal sistema (a me si è verificato in Arch ma non in Ubuntu) ed il questo caso occorre procedere alla modifica della variabile di ambiente *PATH* che indica al sistema dove cercare gli eseguibili.

Per visualizzare l'attuale contenuto della variabile PATH si usa il comando `echo $PATH`.

Se la cartella `/home/username/.local/bin` non fosse presente occorrerebbe modificare il contenuto della variabile aggiungendo il percoso di quella cartella.

Per effettuare una prova si può modificare il PATH in modo provvisorio utilizzando la seguente stringa nella linea di comando *bash*:

```bash
export PATH=/home/username/.local/bin:$PATH
```

A questo punto è sufficiente da qualsiasi posizione, ad esempio dalla *home*, digitare un comando di prova, come ad esempio `$ grip --help`. Se il sistema rispondesse con l'elenco dei comandi di *grip* allora il test dovrebbe considerarsi superato.

Dopo avere positivamente superato il test si può rendere la modifica permanente in vari modi.

Per modificare il *percorso* solo per l'utente corrente si modifica il file `~/.bashrc` con un editor di testo (es `vim ~/.bashrc`) aggiungendo, in fondo, la stringa seguente:

```bash
export PATH=$PATH:/home/username/.local/bin
```

Per modificare il percorso per tutti gli utenti autorizzati nel sistema operativo,  occorre aprire in modalità amministratore (ovvero con il prefisso `sudo`) il documento `/etc/profile` e scorrere fino a vedere qualcosa simile a questo:

```bash
# Append our default paths
append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/bin'
```

A questo punto basta accodare, rammentando che "username" deve essere modificato con il nome effettivo dell'utente, la stringa seguente:

```bash
append_path '/home/username/.local/bin'
```

Un altro componente necessario è *xdotool* ma questo potrebbe già essere installato.

Prima di procedere, quindi, digitate il comando medesimo nel terminale: se il sistema rispondesse con "*comando non trovato*" o messagio simile, occorrerebbe procedere all'installazione.

Per installare tale componente in Arch Linux si usa: `sudo pacman -S xdotool` oppure, per chi usa yay, `yay -S xdotool`.

Analoghe indicazioni valgono  per le altre distribuzioni ma, ovviamente, utilizzando il relativo sistema di installazione (ad esempio *apt-get install* per Debian e derivate, *dnf install* per Fedora).

Occorre, infine, inserire la stringa seguente in .vimrc:

```bash
let vim_markdown_preview_github=1
```


Il *plugin* "Vim Markdown Preview" è compatibile nativamente solo con Google Chrome (o Safari in macOS).

Ciò significa che occorre avere installato e selezionato come predefinito quel navigatore.

Per utilizzare questo sistema di anteprima occorre aprire un file con estensione `.markdown` o `.md` e premere `Ctrl-p` sia per aprire l'anteprima che per aggiornarla durante l'editing.

In pratica: il salvataggio del documento con il comando `:w` di Vim, che nel precedente *plugin* provocava automaticamente anche l'aggiornamento dell'anteprima, in questo caso non è sufficiente e deve essere seguito da `Ctrl-p`.

Quindi occorre premere un doppio comando: prima il salvataggio del documento e poi l'aggiornamento dell'anteprima.

Aggiungo, inoltre, che il comando `Ctrl-p` è un po' più in "stile Emacs" che in quello Vim tipico.

Ho, inoltre, rilevato che l'aggiornamento con `Ctrl-p` dopo l'aggiunta di testo provoca dei messaggi di errore che, in ogni caso, non impediscono l'aggiornamento della visualizzazione.

## Una semplice soluzione senza plugin

In ogni caso è possibile utilizzare un anteprima "di fatto" **senza alcun *plugin*:** basta aprire il documento Markdown con un navigatore (di solito si usa il comando `Ctrl-o`) e aggiornare la visualizzazione del navigatore (`Ctrl-r`).

Il vantaggio di questo semplice sistema è anche quello di poter tenere aperti gli anteprima di molti documenti contemporaneamente (esempio uno stesso documento in italiano ed inglese).

Per visualizzare in Firefox i documenti scritti in linguaggio Markdown potete trovare alcune indicazioni in [questo mio articolo](https://francopasut.netlify.app/it/post/markdown_firefox/).

Grazie per l'attenzione.
