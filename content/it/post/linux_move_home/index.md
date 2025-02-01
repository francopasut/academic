---
title: "Linux: spostare la cartella \"home/user\" indietro nella partitione \"radice\""
date: 2021-07-27
canonical_url: "https://medium.com/@francopasut/linux-move-home-user-directory-back-to-the-same-root-partition-181c23eee15d"
slug: linux_move_home
categories:
  - Operating Systems
tags:
  - Linux
image:
  placement: 3
  caption: 'Peppermix Linux'
---



## Qual è l'obiettivo di questo articolo?

Ho installato, come dovrebbe sempre avvenire, una distribuzione Linux in due distinte partizioni.

In particolare: la  cartella *radice*  nella partizione */dev/sdb2* e la cartella *home/user* in */dev/sdb3*.

Dopo un po' di tempo hoh avuto necessità di riportare la cartella  *home/user* to the all'interno della  partizione *radice*.

Perché questa necessità? Mi piace dedicare ogni partizione a distinte distribuzioni Linux.

## Cosa ho letto prima di scrivere questo articolo?

In rete ho trovato molti articoli su come muovere la cartella *home/user* in altre partizioni, ma non molti per l'operazione opposta.

Ecco alcuni riferimenti esterni:

-   [Move the home directory back to a single partition](https://askubuntu.com/questions/122464/move-the-home-directory-back-to-single-partition#122466)
-   [Re: Partioning advice dualboot LM18.3 and 19](https://forums.linuxmint.com/viewtopic.php?p=1539963&sid=70b6125fb0326c3bd1d9b9f6b1f1ad02#p1539963)

Ho risolto questo *piccolo* problema con un trucco personale,  forse non apprezzato dai puristi di Linux. Tuttavia è molto semplice, veloce ed efficace. 

## Ecco il mio trucco non elegante ma funzionante

Ho creato una chiavetta avviabile con un sistema operativo portabile (in particolare trattasi di Peppermint Linux) ed ho avviato il computer dalla chiavetta.

Ho utilizzato il montaggio automatico delle partizioni *sdb2* e *sb3* in modalità grafica (è sufficiente cliccare sulle icone delle relative cartelle nel gestore di "file").

![](automatic_mounting_partition.png)

Quindi ho copiato la cartella *home/franco*  dalla partizione *sdb3*, ho aperto la cartella *home* nella partizione *sdb2* 
![](copy_paste_folder.png)
Alla fine, ho avviato il sistema operativo in modalità "manutenzione", ho commentato in *fstab* la line che conteneva il riferimento alla precedente cartella *home/franco* su  *sdb3*, ho assegnato ai documenti, alle cartelle ed  alle sottocartelle,  la proprietà a mio nome con il seguente comando: `chown -R franco:franco franco`  ed ho riavviato il sistema operativo.

ADESSO FUNZIONA COME SECONDO LE MIE ESIGENZE!

Grazie per la vostra attenzione.

[Pubblicato in origine su Medium](https://medium.com/@francopasut/linux-move-home-user-directory-back-to-the-same-root-partition-181c23eee15d)
