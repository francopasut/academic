---
title: "Osservazioni sulla BARRA DELLE APPLICAZIONI e sulle SCORCIATOIE DA TASTIERA in WINDOWS e GNU/LINUX."
date: 2026-01-24
slug:  taskbar_shortcuts
categories:
  - Blog
tags:
  - Windows
  - Linux
  - Taskbar
image:
  placement: 3
  preview_only: false 
  caption: 'Monitor'
canonicalUrl: https://francopasut.blogspot.com/2026/01/osservazioni-sulla-barra-delle.html
---


- [1. Premessa.](#1-premessa)
- [2. Qual è il tasto Super?](#2-qual-è-il-tasto-super)
- [3. Cos'è la barra delle applicazioni?](#3-cosè-la-barra-delle-applicazioni)
- [4. In sintesi: Super + numero di posizione.](#4-in-sintesi-super--numero-di-posizione)
- [5. Pinnare o non pinnare? Questo è il problema.](#5-pinnare-o-non-pinnare-questo-è-il-problema)
- [6. Non solo Windows](#6-non-solo-windows)
- [7. Non solo sistemi operativi: Browser ed Outlook.](#7-non-solo-sistemi-operativi-browser-ed-outlook)
- [8. In sintesi.](#8-in-sintesi)


# 1. Premessa.

Nei sistemi operativi dotati di interfaccia grafica, come Windows e le principali distribuzioni GNU/Linux, la combinazione ALT+TAB rimane lo standard più immediato per la navigazione tra le finestre aperte.

Se con poche finestre aperte questo metodo risulta efficace, al crescere del carico di lavoro diventa rapidamente dispersivo. 

Alla lunga, l'uso continuo di ALT+TAB genera un accumulo di passaggi ripetitivi e poco efficienti. 

Anche l'alternativa ALT+ESC non risolve il problema alla radice, poiché costringe comunque a scorrere l'elenco fino a trovare la finestra desiderata. 

Per questo, il sistema più diretto e veloce rimane un altro: la combinazione Tasto SUPER + NUMERO."

In questo articolo descrivo come funziona il sistema di *lancio* di tipo *SUPER+NUMERO* in MS Windows 10 e 11 con qualche cenno a GNU/Linux,  sistemi operativi che uso, rispettivamente, in ufficio ed a casa.


# 2. Qual è il tasto Super?

*Nella  tastiera del mio computer non vedo alcun tasto denominato "Super"*.

In effetti nelle tastiere per computer non esiste un tasto con il nome "Super" serigrafato, contrariamente a quanto avviene per i tasti Alt, Ctrl (Control), Invio (Return) ed altri, oltre che, naturalmente, per tutti i tasti alfanumerici.

Il tasto Super esiste ed è quello contrassegnato con un LOGO, di solito quello di Windows ma che potrebbe anche essere il logo di altro genere.

Si riconosce molto facilmente in quanto si trova, di solito, in basso a sinistra sulla tastiera, accanto al tasto ALT.

Un po' di storia: pur essendo stato introdotto, per la prima volta, nel 1978 è stato inizialmente utilizzato dall'editor Emacs (con il quale sto scrivendo questo articolo) per essere, poi, abbandonato tra la fine degli  anni '80 e l'inizio del '90.

Nel settembre 1994 tornò con il nome "Tasto Windows", tuttavia, sulla tastiera  Microsoft Natural Keyboard prodotta da Microsoft e, da tale data, si diffuse gradualmente in tutte le tastiere per computer.

Le comunità Linux e BSD, avendo bisogno di un tasto modificatore aggiuntivo per le loro scorciatoie globali, decisero di mappare il "nuovo" tasto Windows sulla vecchia funzione "Super" definita decenni prima.

In questo articolo adotto il nome originale di "Tasto Super" che preferisco a quello dedicato ad un solo sistema operativo ma, se preferite, potete chiamarlo anche "Tasto Window".

Il tasto è essenziale per alcune funzioni di sistema, tra cui quella di lancio veloce delle finestre sulla barra delle applicazioni, anche denominata per brevità  *taskbar*.


# 3. Cos'è la barra delle applicazioni?

Per descrivere con semplicità la barra delle applicazioni di Windows 11 prendo in prestito una videata tratta dal [servizio di supporto di Microsoft](https://support.microsoft.com/it-it/windows/personalizzare-la-barra-delle-applicazioni-in-windows-0657a50f-0cc7-dbfd-ae6b-05020b195b07):

![img](./taskbar-windows-17-1-2026.png)

L'immagine è molto chiara.

La parte che ci interessa per la funzione di avvio veloce è quella riportata al punto 5 della precedente immagine.

In pratica è la barra, solitamente posta in basso sul monitor, in cui sono riportate le icone delle applicazioni aperte (o "pinnate", come sarà chiarito di seguito).


# 4. In sintesi: Super + numero di posizione.

Il principio è molto semplice: per attivare una finestra di applicazione occorre **premere e mantenere premuto** il tasto Super seguito dal numero di posizione dell'icona.

Nell'immagine precedente, la prima icona delle applicazioni presente al punto 5 è quella di Copilot.

Premendo, quindi, `Super + 1` si ottiene il lancio dell'applicazione Copilot.

Stessa soluzione, ovviamente con numero diverso, per lanciare l'applicazione Esplora File che, al punto sopra indicato, si trova in seconda posizione: `Super + 2`.

Per Edge, vista la sua posizione, si preme `Super + 3`, e così via.

L'allineamento delle icone e, quindi, il numero di posizione da digitare con *Super*,  può essere modificato trascinando trascinando la relativa icona a destra o sinistra nella barra della delle applicazioni.

Se si preme nuovamente una combinazione *Super + Numero* di un'applicazione visualizzata la stessa viene ridotta ad icona e, quindi, nascosta dal schermo del computer.

Se sono aperte più finestre della stessa applicazione — come accade spesso con Outlook quando si separano le singole email dalla schermata principale — la stessa combinazione di tasti *Super + Numero*  permette di scorrere ciclicamente tra di esse. 

Dopo aver richiamato l’istanza principale, i successivi input mostrano in sequenza tutte le altre finestre attive senza mai ridurle a icona.


# 5. Pinnare o non pinnare? Questo è il problema.

Cos'è il "pinning" e come funziona?

"Pinnare" un'applicazione significa ancorarla permanentemente alla barra delle applicazioni.

La procedura è semplice.

1.  Se l'app fosse già aperta occorrerebbe fare clic destro sull'icona nella barra e selezionare "Aggiungi alla barra delle applicazioni".
2.  Se l'app non fosse aperta occorre procedere dal menu Start, cercare l'app, fare  clic destro e selezionare la medesima voce sopra indicata.
3.  Altra possibilità è utilizzare il "Drag & Drop" trascinando un collegamento dal desktop direttamente sulla barra delle applicazioni.

Il dilemma è: conviene davvero ancorare le icone?

La scelta non è scontata.

In teoria, non ancorare nulla permetterebbe di avere desktop virtuali con sequenze di icone personalizzate. 

Tuttavia, Windows tende a modificare arbitrariamente l'ordine delle icone non ancorate, annullando i benefici delle scorciatoie da tastiera.

L'ancoraggio garantisce una posizione fissa, ma presenta un limite strutturale: le icone pinnate compaiono in tutti i desktop virtuali, anche se l'app non è ancora stata aperta in quella specifica schermata.

Questo crea un'inefficienza nel sistema di lancio rapido in quanto le icone ancorate occuperebbero i primi slot (es. posizioni 1-6).

In un nuovo desktop virtuale, la prima applicazione aperta non sarebbe la numero 1, ma la numero 7.

Per fare un esempio pratico riporto la sequenza delle applicazioni nella  *taskbar* del mio computer in cui si nota la prima icona, relativa ad Esplora File, con un trattino in basso e le altre icone, quelle di Outlook, OneNote, Acrobat Reader, Word ed Edge, senza trattino:

![img](./taskbar_1-14-1-2026.png)

Il trattino basso nella prima icona segnala una finestra *pinnata ed attivata* mentre l'assenza di trattino sotto le altre icone segnala finestre *pinnate ma non attivate*.

Se utilizzassi un secondo desktop virtuale la prima applicazione diversa da quelle pinnate assumerebbe il numero 7 e non il numero 1.

Poiché il sistema supporta solo 10 scorciatoie (da 1 a 0), le icone fisse "consumerebbero" slot preziosi che potrebbero essere usati per app specifiche di quel desktop.

Nonostante questo "spreco" di posizioni, l'ancoraggio resta la scelta migliore: la possibilità di rilanciare istantaneamente le app d'uso quotidiano con la stessa combinazione di tasti compensa ampiamente la perdita di flessibilità sui desktop virtuali.


# 6. Non solo Windows

Il metodo *taskbar con Super+numero* non è un'esclusiva di Windows.

Lo stesso metodo è utilizzato anche in vari ambienti Desktop di GNU/Linux. 

Di seguito riporto la taskbar di KDE PLASMA in DEBIAN Linux:

![img](./taskbar_kde_15-1-2026.png)

L'aspetto è praticamente sovrapponibile a quello innanzi illustrato. Anche l'utilizzo pratico è simile.

Ho anche provato altri ambienti Desktop di DEBIAN con i seguenti risultati:

-   Cinnamon e GNOME hanno funzioni analoghe a quelle sopra descritte.

-   Xfce, LXDE, LXQt, MATE e Openbox non hanno, invece, funzioni di lancio delle applicazioni analoghe a quelle sopra descritte.

HyprLand, provato sotto CachyOS, potrebbe averle ma dovrebbero essere  impostate nella configurazione.

Addirittura ci sono ambienti in cui viene visualizzato il numero di ciascuna icona da digitare per l'avvio tramite scorciatoia.

Mi riferisco, in particolare, alla versione GNOME di Ubuntu, come da schermata seguente:

![img](./taskbar_ubuntu_22-1-2026.png)


# 7. Non solo sistemi operativi: Browser ed Outlook.

Il principio di lancio con scorciatoie da tastiera corrispondenti alle posizioni delle icone non è escluso dei sistemi operativi.

Anche alcuni Browser hanno la funzione di lancio connesse alle posizione delle schede aperte sostituendo, però, il tasto Super con Ctrl.

Ho provato con Chrome e Edge con esito positivo.

Firefox ESR, invece, ha avuto esito negativo.

Anche Outlook supporta la navigazione rapida tramite scorciatoie  con il tasto Ctrl.

Questa combinazione permette di muoversi istantaneamente tra i suoi moduli principali, ad esempio:

-   Ctrl+1: Posta elettronica
-   Ctrl+2: Calendario
-   Ctrl+3: To Do (Attività)
-   Ctrl+4: Contatti (Persone)
-   Ctrl+5: Copilot

Riporto un'immagine delle icone di Outlook che possono essere lanciate con le scorciatoie rapide di tastiera sopra indicate:

![img](./taskbar_2-14-1-2026.png)

È importante notare che l'ordine di queste icone può essere personalizzato spostandole verso l'alto o verso il basso nella barra di navigazione.

Riporto un'immagine di un'icona di Outlook con frecce di spostamento:

![img](./taskbar_3-14-1-2026.png)

Modificando la loro sequenza visiva, cambierà automaticamente anche il numero associato alla combinazione di tasti, permettendo di mappare le sezioni secondo le diverse priorità.


# 8. In sintesi.

Con un minimo di sforzo mnemonico, il desktop di Windows ma anche quello di Linux con ambienti desktop KDE PLASMA, GNOME, Cinnamon, possono gestire le finestre molto velocemente ed efficacemente.

Occorre dimenticare la scorciatoia di ALT-TAB e scegliere una propria sequenza di icone pinnate da richiamare con le scorciatoie basate su "Super + numero".

