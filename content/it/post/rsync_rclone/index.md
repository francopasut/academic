---
title: "Osservazioni personali su Robocopy, Rsync e Rclone"
date: 2026-01-31
slug:  rsync_rclone
categories:
  - Blog
tags:
  - Windows
  - Linux
  - Rsync
  - Rclone
image:
  placement: 3
  preview_only: false 
  caption: 'Rsync vs Rclone'
canonicalUrl: https://francopasut.blogspot.com/2026/01/osservazioni-personali-su-robocopy.html 
---

- [1. Premessa](#1-premessa)
- [2. Articolo precedente: breve confronto tra robocopy e rsync](#2-articolo-precedente-breve-confronto-tra-robocopy-e-rsync)
- [3. Lentezza di rsync con WebDAV](#3-lentezza-di-rsync-con-webdav)
- [4. Installazione di Rclone su Linux:  repository o sito ufficiale?](#4-installazione-di-rclone-su-linux--repository-o-sito-ufficiale)
- [5. Configurazione di Rclone](#5-configurazione-di-rclone)


# 1. Premessa

Robocopy, Rsync e Rclone sono tre ottimi strumenti per la sincronizzazione.

Il primo è un comando nativo di Windows 10 e 11. Il secondo è lo standard *de facto* per GNU/Linux (e macOS). Il terzo è un  vero "coltellino svizzero" multi-piattaforma: gira su Windows, Linux, macOS, FreeBSD e persino su Android/iOS (tramite app terze).

Strutturalmente, mentre Robocopy e Rsync nascono per dischi locali o server, Rclone è specializzato nel parlare con i servizi Cloud (Google Drive, Dropbox, S3, OneDrive, NextCloud, ecc.)


# 2. Articolo precedente: breve confronto tra robocopy e rsync

Ho dedicato al confronto tra *robocopy* e  *rsync*  un paragrafo di un  [mio articolo](https://francopasut.netlify.app/it/post/xcopy_robocopy_windowsv/#robocopy-e-rsync) al quale rimando.

Riporto una sintesi del paragrafo.

Robocopy (Windows) e rsync (Linux) sono utility speculari progettate per la sincronizzazione efficiente dei dati. 

Le loro caratteristiche comuni includono:

-   Efficienza Incrementale: Entrambi ottimizzano i tempi copiando esclusivamente i file nuovi o modificati, ignorando quelli già presenti e invariati.
-   Flessibilità e Controllo: Permettono di filtrare i contenuti attraverso opzioni di esclusione per file o cartelle specifiche.
-   Affidabilità: Sono strumenti robusti, capaci di gestire carichi di lavoro pesanti e file di grandi dimensioni.
-   Modalità Mirroring: Entrambi offrono la funzione "copia a specchio" (tramite il comando /MIR in Robocopy e &ndash;delete in Rsync), che allinea perfettamente la destinazione alla sorgente eliminando i file non più presenti nell'origine.


# 3. Lentezza di rsync con WebDAV

Rsync è un ottimo sincronizzatore, con un set completo di opzioni.

Però utilizzato con il protocollo WebDAV, come nel mio caso, può essere molto lento.

Ecco una sintesi estrema dei tre colli di bottiglia che possono rallentare rsync su WebDAV:

-   Eccesso di "controlli" (Overhead): Il protocollo WebDAV invia troppi messaggi di controllo per ogni singola operazione.
-   Effetto "imbuto" (Locking): Il sistema di montaggio (FUSE/davfs2) blocca i file per sicurezza, costringendo le operazioni a procedere una alla volta invece che in parallelo.
-   Confronto inefficiente (Scanning): Rsync fatica a capire a distanza quali file siano cambiati; finisce per analizzare troppi dati solo per decidere cosa copiare, rallentando l'intero processo.

Ho personalmente provato la lentezza di *rsync* su Debian e derivati, incluso Ubuntu.

Cercando informazioni per velocizzare *rsync* ho, invece, "scoperto" *rclone*.

*Rclone* non incorre nei limiti di  *davfs2* e non è affetto dai problemi sopra menzionati  perché non dialoga con il sistema come se fosse un disco locale ma "parla" direttamente con il server usando più "corsie" contemporaneamente (multi-threading).

Inoltre *Rclone*  funziona a prescindere dalla posizione in cui si trova il cursore nel terminale in quanto il percorso sia locale che remoto viene memorizzato al suo interno in fase di  configurazione.

Di seguito riporto alcune indicazioni, derivanti direttamente dalle mie prove d'uso, per l'installazione, la configurazione e l'utilizzo di *Rclone*.


# 4. Installazione di Rclone su Linux:  repository o sito ufficiale?

Nel mondo Linux, siamo abituati alla comodità dei gestori di pacchetti: che si tratti di APT su Debian e derivate, DNF su Fedora o Pacman su Arch, un semplice comando solitamente basta a risolvere tutto. Tuttavia, non sempre i repository ufficiali offrono la versione più aggiornata (e sicura) di un software.

Quando ho testato Rclone mi sono imbattuto in una differenza sostanziale tra le distribuzioni che vale la pena approfondire.

Per effettuare i test su Debian, ho installato il software tramite il classico comando: `sudo apt install rclone`.

Il risultato? La versione presente nei repository era talmente obsoleta da far scattare un avviso di sicurezza durante l'uso di bisync. Il sistema mi avvertiva di non utilizzare il comando in produzione poiché considerato ancora in fase sperimentale in quella specifica release.

A questo punto mi sono spostato su Fedora, la situazione è migliorata.

Utilizzando: `sudo dnf install rclone` l'installazione non ha restituito alcun avviso, segno che i repository di Fedora ospitano una versione più recente rispetto a quella di Debian Stable.

Per uniformare le prestazioni e assicurarmi di avere le ultime funzionalità (e correzioni di bug), ho provato, quindi, a rimuovere la versione di sistema su Debian e procedere con l'installazione manuale consigliata dagli sviluppatori.

Dopo l'installazione tramite questo comando da terminale:

    sudo -v ; curl https://rclone.org/install.sh | sudo bash

il software è risultato aggiornato all'ultima versione stabile disponibile e tutti i segnali di allarme sono spariti.

Pertanto,  consiglio di installare Rclone direttamente tramite lo script ufficiale presente sulla [pagina di download del progetto](https://rclone.org/install/) oppure di utilizzare i pacchetti di distribuzioni più aggiornate, come Fedora o Arch.


# 5. Configurazione di Rclone

Dopo l'installazione occorre procedere alla configurazione: si lancia `rclone config` e si percorre la seguente procedura guidata:

1.  `n)` New remote: Digitare n e premere Invio.
2.  `name:` Scegliere un nome (es. mio<sub>webdav</sub>).
3.  `Storage:` Cercare "WebDAV" nella lista.
4.  `url:` Inserire l'indirizzo del server (es. <https://esempio.com/remote.php/dav/files/user/>).
5.  `vendor:` Scegliere il tipo di servizio (es. nextcloud, owncloud o other).
6.  `user:` Inserire un  nome utente.
7.  `password:` Digitare "y" per inserire la  password e confermarla.
8.  `bearer_token:` Lasciare vuoto.
9.  `Edit advanced config?:` Digitare "n".
10. `Keep this remote?:` Digitare "y" per salvare.
11. `q)` Quit config: Digitare q per uscire.

Alcuni comandi:

-   Comando per vedere i file remoti: `rclone ls mio_webdav:/`
-   Comando per copiare una cartella locale sul server: `rclone copy /home/utente/documenti mio_webdav:/backup`
-   Comando per effettuare la sincronizzazione (Speculare): `rclone sync /home/utente/documenti mio_webdav:/backup`

Tuttavia il comando `rclone sync` è unidirezionale.

A differenza di una sincronizzazione a due vie, `sync` ragiona secondo il principio del Mirroring (Specchio): in sintesi, la sorgente comanda, la destinazione ubbidisce.

Cosa succede in pratica?
Immaginiamo il comando: `rclone sync locale: remoto`:

-   Locale più recente: I file vengono aggiornati sul remoto.
-   Remoto più recente: I file nuovi sul remoto vengono sovrascritti dalle versioni vecchie locali.
-   File solo sul remoto: Vengono eliminati definitivamente per rendere il remoto identico al locale.

Se occorre che i file più recenti "vincano" sempre, ovunque essi si trovino, occorre cambiare comando: `rclone bisync locale: remoto:`.

Questo abilita la sincronizzazione bidirezionale, gestendo i conflitti e propagando le modifiche da entrambe le parti, come di fatto, avviene  con Dropbox o OneDrive.

Il comando completo per utilizzare  `bisync` è il seguente:

    rclone bisync /percorso/locale mio_webdav:/cartella_remota --resync

L'opzione `--resync` serve solo per la prima esecuzione, poi deve essere omessa.

Per effettuare operazioni di prova occorre utilizzare l'opzione  `--dry-run`.

Il comando completo  per le prove è, dunque,  il seguente: `rclone bisync /cartella/locale mio_webdav:/backup --dry-run -v`.

Per rendere effettive le operazioni basta eliminare l'opzione `--dry-run`.

L'opzione `-v`, ovvero "verbose", serve per visualizzare le operazioni in corso. Anche questa può essere omessa.

Ecco in sintesi il risultato:

-   Con `bisync` se si modifica un file sul server WebDAV, verrà copiato in locale e viceversa.
-   Se un file viene modificato contemporaneamente su entrambi i lati, rclone cercherà di gestire il conflitto.

Rammento che il comando `bisync` viene segnalato come sperimentale se Rclone viene installato nei repository di Debian e derivate (quanto meno ad oggi). Per questo motivo consiglio di installare l'applicazione dal proprio *repository*, come sopra già affermato.

In conclusione: *Rclone* è velocissimo! Inoltre funziona in qualsisi punto dell'albero delle cartelle vi troviate.

Da quando ho "scoperto" *Rclone* non ho più utilizzato *Rsync*.

