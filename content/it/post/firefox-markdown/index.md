---
title: "Markdown in Firefox"
date: 2022-10-24
slug:  markdown_firefox
categories:
  - Internet
tags:
  - Markdown
  - Firefox
image:
  placement: 3
  preview_only: false 
  caption: 'Markdown under Firefox'
---

{{% toc %}}

## Abstract

Utilizzare Mozilla Firefox come visualizzatore di documenti scritti in Markdown sotto Linux Ubuntu, Fedora and Arch, con menzione di MS Windows e macOS.

## Mozilla Firefox ed il formato Markdown

Mozilla Firefox, uno dei migliori navigatori di Internet,  non legge nativamente i documenti scritti in Markdown.

Se si prova ad aprire un documento scritto in Markdown il navigatore chiede se debba salvarlo in locale o se debba aprirlo con un'applicazione tra quelle proposte dal sistema operativo. Ma non renderizza il documento.

Occorre, quindi, utilizzare un componente aggiuntivo per visualizzare un documento scritto in Markdown in modalità renderizzata all'interno del navigatore.

Un ottimo componente è [*Markdown Viewer Webext*](https://github.com/KeithLRobertson/markdown-viewer).

Oltre alla visualizzazione del contenuto scritto in Mardown, il componente rende disponibile un sommario a scomparsa che consente anche di scegliere lo *stile* (*default* e *github*) e di scaricare in locale la versione HTML del documento.

Ho avuto, tuttavia, qualche problema ad installare il componente in Linux, specialmente nella distribuzione Ubuntu. Ho provato anche in Fedora ed Arch ma il procedimento è stato un po' più semplice.

Riporto delle linee guida concise per vari sistemi operativi, rivolte soprattutto a coloro che hanno installato il browser tramite SNAP in Ubuntu.

## Nessun problema per l'installazione del plugin in MS Windows e macOS

Nel sistema operativo **MS Windows** (prova effettuata su versione 10) il componente funziona subito, immediatamente dopo l'installazione effettuata dalla funzione dedicata di Firefox.

Non occorre alcuna configurazione aggiuntiva rispetto alla semplice installazione del plugin.

Anche nel sistema operativo **macOS** (provata versione Catilina 10.15.7) funziona immediatamente senza alcuna configurazione aggiuntiva.

## Solo una piccola correzione  in GNU/Linux Fedora ed Arch

Sia in GNU/Linux Fedora che Arch l'installazione ha reso necessaria solo una piccola correzione.

Seguendo le indicazioni della [pagina GitHub](https://github.com/KeithLRobertson/markdown-viewer) del componente, ho aggiungo, sotto le cartelle `~/.local/share`, le cartelle `/mime/packages`.

All'interno della cartella `packages` ho inserito il "file" `text-markdown.xml` con il seguente contenuto:

```xml
<?xml version="1.0"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
<mime-type type="text/plain">
<glob pattern="*.md"/>
<glob pattern="*.mkd"/>
<glob pattern="*.mkdn"/>
<glob pattern="*.mdwn"/>
<glob pattern="*.mdown"/>
<glob pattern="*.markdown"/>
</mime-type>
</mime-info>
```

Infine ho eseguito il comando `update-mime-database ~/.local/share/mime`.

Attenzione: essendo una cartella locale **non deve essere usato il prefisso "sudo"** perché, in caso contrario, il sistema evidenzierebbe che il percorso non è nel PATH.

Tutto qui, la procedura è illustrata con chiarezza sia nella pagina del programmatore del componente che in vari articoli in rete.

## Un'installazione un po' più impegnativa in Ubuntu

In Ubuntu è molto probabile che Mozilla Firefox sia stato installato tramite il gestore di pacchetti SNAP.

Il problema, in questo caso, deriva dall’isolamento dei pacchetti SNAP rispetto al resto del sistema operativo.

Sono, quindi, necessari alcuni interventi aggiuntivi rispetto alle altre distribuzioni Linux.

Occorre prima di tutto digitare, nel campo degli indirizzi Internet di Firefox, il seguente comando: `about:profiles`

La risponda al comando precedente fornisce una stringa del tipo: `/home/franco/snap/firefox/common/.mozilla/(...)`.

Occorre cercare, nella stringa,  la cartella immediatamente superiore a quella denominata `.mozilla`.

La cartella da prendere come riferimento dovrebbe essere denominata `common`.

All'interno della cartella `common`, quindi, si inserisce un file denominato `mime.types`.

Il percorso completo con il nuovo file potrebbe, quindi, essere simile al  seguente `/home/franco/snap/firefox/common/mime.types`.

All'interno del "file" `mime.types` occorre scrivere la seguente linea di codice:


```bash
type=text/plain exts=md,mkd,mkdn,mdwn,mdown,markdown, desc="Markdown document"
```

Non è ancora finita!

Occorre lanciare, sempre nel campo degli indirizzi, un altro comando denominato `about:config`, accettare l'avviso *Procedi con Cautela*  premendo il tasto *Accetta il Rischio e Procedi* e digitare nel campo di ricerca la stringa `helpers.private_mime_types_file`.

Sulla destra trovate l'icona di una matita che dovete premere per modificare il campo precompilato con la stringa `~/.mime.types` modificandolo con il percorso al "file" sopra creato, utilizzando non la tilde (~) per la *home*  ma  il percorso assoluto completo.

Nel mio caso:  `/home/franco/snap/firefox/common/mime.types` ma non  `~/snap/firefox/common/mime.types`.

Abbiamo finito: riavviamo Firefox e godiamoci il Markdown all'interno del navigatore.

A proposito: il modo più rapido per caricare nel navigatore un documento esterno è utilizzare il comando `Ctrl-o` (`Cmd-o` per macOS) e selezionare il documento nella finestra che appare.

In sintesi,  il gestore SNAP in Ubuntu rende un po' più articolata la configurazione del componente a causa del suo isolamento dei pacchetti rispetto al sistema operativo.

Grazie per l'attenzione.
