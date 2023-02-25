---
title: "Uno studio su esportazione e importazione di partiture tra LilyPond e MuseScore via MusicXML"
date: 2023-02-25
slug:  lilypond_musescore_musicxml
categories:
  - Blog
tags:
  - LilyPond
  - MuseScore
  - MusicXML
image:
  placement: 3
  preview_only: false 
  caption: 'LilyPond e MuseScore'
---

{{% toc %}}



## A proposito di LilyPond e MuseScore.

[LilyPond](https://lilypond.org/) e [MuseScore](https://musescore.g) sono i due progetti *open source* più interessanti dedicati alla notazione musicale.

**LilyPond** è un linguaggio di marcatura, compatibile con  LaTeX (rimando a questo mio [articolo su LaTeX e LilyPond per scrivere testo e musica](https://francopasut.netlify.app/it/post/lilypond-lyluatex/)), che consente di scrivere partiture musicali di alta qualità grafica utilizzando caratteri di testo.

Questa caratteristica lo rende, tra l'altro,  utilizzabile anche da sistemi di IA, come ChatGPT,  per scrivere le partiture autogenerate.

**MuseScore** è da poco giunto alla versione 4 con  moltissime novità ed aggiornamenti sia sotto l'aspetto visuale che audio.

La resa musicale automatica delle sue partiture è tale da essere comparabile con le intepretazioni reali.

Tuttavia questo non è un articolo di confronto tra i due sistemi:  l'ideale è conoscerli entrambi.

Ma c'è un problema: potrebbe essere necessario trasferire partiture dall'una all'altra applicazione per evitare di dovere riscrivere tutto il lavoro da capo.

## È possibile convertire i formati delle partiture direttamente tra le due applicazioni?

Purtroppo no!   Non esiste (ancora)   una funzione di conversione  diretta tra le  applicazioni.

Tuttavia esiste  un formato intermedio di conversione comune a queste come ad altre applicazioni di notazione musicale: MusicXML.

[In questa pagina](https://www.w3.org/2021/06/musicxml40/musicxml-reference/examples/tutorial-apres-un-reve/) ho trovato un frammento di partitura trovato in formato MusicXML che ho utilizzato per i test.

Si tratta delle prime quattro battute della composizione per canto e pianoforte "*Après un rêve*",  op. 7 n. 1,  di Gabriel Fauré:

![export_pdf_lilypond](apres_reve_lilypond.png)

La descrizione di sole **4  battute,** in linguaggio MusicXML necessita di ben  **1570 linee di codice** ed il brano completo è composto da **48 battute**: a voi i conti!

Il linguaggio MusicXML è, quindi,  praticamente inutilizzabile per la scrittura e la lettura *diretta* delle partiture ma è, invece, un ottimo sistema di trasferimento tra diverse applicazioni di editing musicale.

MuseScore esporta senza problemi nel formato MusicXML e legge direttamente quel formato, addirittura senza necessità di importazione.

Il passaggio inverso è, purtroppo, più problematico: non esiste ancora una  funzione affidabile per esportare da LilyPond al formato MusicXML. 

Esiste, invece,  una funzione di importazione da MusicXML a LilyPond.

Una partitura esportata da MuseScore può, quindi, essere importata in LilyPond sia utilizzando la linea di comando che l'interfaccia grafica *Frescobaldi*, entrambe basate sul comando *musicxml2ly*.

Il punto "debole" è, quindi, nel passaggio da LilyPond a  MusicXML.


## Primo tentativo: da LilyPond a MuseScore con python-ly.

Il primo tentativo trae spunto da  [questa pagina](https://music.stackexchange.com/questions/42315/lilypond-to-musicxml-to-sibelius)  in cui viene suggerita la seguente soluzione:

> from a terminal on your mac or linux box:

> `pip install python-ly`

> `ly musicxml myscore.ly > myscore.musicxml`
>
> more information on ly: http://python-ly.readthedocs.io/en/latest/command.html#commands

Procedo, quindi,  con l'installazione di *python-ly* su Arch Linux con `pip install python-ly` e, successivamente, 
la conversione da LilyPond a MusicXML in ambiente Arch Linux con il seguente comando:

```bash
ly musicxml Documents/prova-apres-reve.ly > Documents/export_test.musicxml
```

Viene segnalato un errore:

```bash
Exception ignored in: <_io.TextIOWrapper name='<stdout>' mode='w' encoding='utf-8'>
OSError: [Errno 9] Bad file descriptor
```

Tuttavia viene creato un file con il nome indicato nel comando.

Provo, quindi, ad aprire il file con il comando `export_test.musicxml`.

L'apertura fornisce esito negativo!

Ho trovato un'altro suggerimento in [questa pagina](https://stackoverflow.com/questions/70885191/export-lilypond-file-to-musicxml-then-importing-that-into-musescore) con una sequenza di esportazione molto più complessa:

```bash
import ly.musicxml
import ly.document

e = ly.musicxml.writer()

ly_doc = ly.document.Document.load('songs/ly/old-macdonald-had-a-farm.ly')

e.parse_text(ly_doc.plaintext())
ly_doc_xml = e.musicxml()
ly_doc_xml.write('songs/ly/old-macdonald-had-a-farm.xml')
```


Anche questa, tuttavia,  non ha funzionato ed ha dato il seguente errore dopo la stringa `e = ly.musicxml.writer()`: 

```bash
bash: syntax error near unexpected token `('
```
Il primo tentativo ha, quindi, avuto esito negativo.


## Secondo tentativo: da LilyPond a MuseScore attraverso file MIDI.

Alcuni commentatori suggeriscono di utilizzare lo standard MIDI come base comune per trasferire le partiture.

Ho provato, quindi, ad aprire in MuseScore la versione MIDI di "Après un rêve", ottenuta direttamente dalla partitura aperta in Frescobaldi grazie alla presenza, nel codice sorgente, del  comando `\midi {\tempo 4 = 60 }`.

Il risultato è veramente deludente  e non ha bisogni di commenti, come risulta dai due frammenti sotto riportati (addirittura da 4 battute ne sono state tratte 8):

![Import Midi MuseScore](import_midi_musescore.png)

![Import Midi MuseScore 2](import_midi_musescore-2.png)

## Terzo tentativo: da LilyPond a MuseScore attraverso riconoscimento ottico della partitura in PDF.





MuseScore ha  una voce di menù denominata "Importa PDF". 

Trattasi di  un servizio di riconoscimento ottico della partitura in PDF basato su Audiveris.

Il servizio è gestito da [Musescore.com](http://Musescore.com) e questo  significa che sia necessario effettuare il login per accedere al servizio.

Ho provato, quindi, con il frammento di "Après un rêve" e riporto, per maggiore chiarezza, il risultato di partenza e di arrivo:

* **PDF di partenza in LilyPond**: ![export_pdf_lilypond](apres_reve_lilypond.png)
* **Importazione in MuseScore**: ![import_reve-musescore](apres_reve_musescore.png)

Il risultato è carente di alcuni elementi essenziali: la seconda terzina della terza battuta alla mano destra; l'ultimo accordo della terza battura alla mano sinistra.

Tuttavia è da tenere in considerazione.

## Quarto tentativo: da LilyPond a MuseScore attraverso Audiveris originale.

Come sopra anticipato, in MuseScore è presente una versione ridotta di Audiveris.

Ho, quindi, provato ad utilizzare il software Audiveris nella sua versione originale, attualmente alla 5.3.

La pagina del progetto si trova  a [questo indirizzo](https://audiveris.github.io/audiveris/).

In Arch è possibile installare  facilmente l'applicazione con `yay -S audiveris` e scegliendo la versione con Java 17.

Non ho effettuato l'installazione in altri sistemi operativi.

A questo punto ho sottoposto a riconoscimento ottico il solito frammento di Fauré ed **il risultato è stato, questa volta, decisamente molto interessante**.

Riporto, come in precedenza,  la videata di partenza  e di arrivo:

* **PDF di partenza in LilyPond**: 



![export_pdf_lilypond](apres_reve_lilypond.png)

* **Importazione in MuseScore**: 

![Audiveris import](apres_reve_audiveris.png)


Qualche piccolo particolare è da correggere, ad esempio la seconda battuta della parte vocale e la  distribuzione del testo.

Però il risultato è un'ottima base di partenza per l'importazione.

## Sintesi.

Il trasferimento da MusicXML e LilyPond avviene senza alcun problema grazie alla funzionalità di conversione diretta da MuseScore al formato di interscambio MusicXML ed alla corrisponde funzionalità di importazione di LilyPond tramite musicxml2ly.

Il trasferimento da LilyPond a MusicXML, invece, è problematico in quanto non esiste, ad oggi, una funzione di esportazione da LilyPond verso il medesimo formato di interscambio sopra menzionato.

La soluzione, al momento, più affidabile è costituita dalla lettura ottica della partitura in PDF generata da LilyPond attraverso il software open-source Audiveris nella versione originale, non nella ridotta versione contenuta in Frescobaldi.

Grazie per l'attenzione.
