---
title: "Computer: appunti sull'uso di tastiera con mappatura internazionale al posto di quella italiana"
date: 2022-06-04
slug: tastiera_internazionale
categories:
  - Computer
tags:
  - Linux
  - Windows
  - macOS
image:
  placement: 3
  preview_only: false
  caption: 'Mappatura della tastiera "US International with Dead Keys"'
---

{{% toc %}}


## Perché un italiano dovrebbe utilizzare una mappatura internazionale?

È la domanda che chiunque utilizzi un computer con sistema operativo configurato in italiano ragionevolmente si porrebbe. In particolare: perché una mappatura americana internazionale?

Risposta semplice: perché è più completa. Ma non solo, lo vedremo più avanti.

Vi siete mai chiesti perché le vocali maiuscole dei documenti scritti a computer hanno quasi sempre l'apostrofo al posto dell'accento? La mappatura italiana dei più diffusi sistemi operativi rende un po' meno comoda  l'accentatura delle vocali maiuscole rispetto alle minuscole e spesso si utilizza la scorciatoia dell'apostrofo al posto dell'accento. Anche di questo ne parlerò più avanti.

In questo articolo illustrerò alcune differenze che, a mio avviso, rendono particolarmente efficiente, forse anche preferibile, l'utilizzo della mappatura internazionale al posto di quella localizzata italiana.

Al termine aggiungerò alcune indicazioni con relative illustrazioni per tre sistemi operativi: Windows, macOS e GNU/Linux Ubuntu.

## Mappatura con "Tasti Muti"

Esistono varie versioni di tastiera internazionale: *UK con tasti muti, UK Macintosh, US alt, US con tasti muti AltGr*.

Per rendere possibile la creazione di lettere accentate ed altri caratteri tipografici non presenti in prima battuta la mappatura deve avere i "Tasti Muti".

La versione Americana (US) con "Tasti Muti" ("*US International with Dead Keys*") mi sembra, dopo un po' di test, la più adatta alle nostre esigenze.

I "Tasti Muti" o (nella traduzione letterale) "Tasti Morti" non producono un carattere tipografico diretto ma servono a creare caratteri "composti" come, appunto, una vocale sormontata da un accento grave (o acuto).

Il funzionamento è molto semplice: prima si preme il carattere "muto" e, poi, si preme il carattere di testo da combinare per ottenere il risultato finale.

Nel paragrafo seguente trovate alcuni esempi di lettere composte ottenute con la tecnica dei "Tasti Muti".

## Le vocali maiuscole accentate (non apostrofate)

Ritorniamo sulla questione  delle lettere maiuscole accentate.

La mappatura italiana non prevede tasti in prima battuta per le maiuscole accentate e spesso, per brevità, si  usa (impropriamente) l'apostrofo, come avveniva con la vecchie macchine da scrivere meccaniche.

In realtà le combinazioni esistono ma sono un po' scomode.

Con la mappatura internazionale, invece, la soluzione è molto semplice: basta premere il carattere `'` o *\`* (corrispondenti agli accenti acuto e grave) seguito immediatamente dalla vocale maiuscola o minuscola da accentare.

Ecco due esempi:

* *'+E = É*
* *\`+E = È*

La parola *PERCHÉ* si presenta molto meglio rispetto a *PERCHE'* e con la tastiera Internazionale È MOLTO PIÙ semplice da ottenere!

Per le vocali maiuscole o minuscole con accenti acuti è anche possibile utilizzare la scorciatoia `Alt - vocale`. Esempio `Alt - e` genera la "é"; `Alt - E` genera "É".

Da notare che l'accento acuto è, in realtà, diverso da quello sopra riportato ma si ottiene premendo lo stesso tasto muto seguito dal tasto tabulatore invece che una vocale: `'` + `Tab` = `´`.





L'accento grave, poi,  è particolarmente utile per chi scrive in LaTeX in quanto costituisce il carattere di attivazione delle doppie virgolette iniziali.

In pratica in LaTeX si scrive questo testo:

```
``testo tra virgolette''
```

per avere questo risultato: *“testo tra virgolette”*.

## Altri piccoli vantaggi

Altri piccoli vantaggi sono:

* Per la barra retroversa si utilizza un singolo tasto senza necessità di premere contemporaneamente il tasto Maiuscolo.
* Anche il punto e virgola si ottiene con un singolo tasto, senza premere il tasto maiuscolo.
* Il carattere "+" si trova sopra il carattere "=" ed è decisamente più comodo nelle formule matematiche perché riduce lo spostamento della mano e, quindi, l'affaticamente muscolare.

## Impostazione della tastiera internazionale in Windows

Per impostare una mappatura  in Windows (direttamente provato nella versione 10) si utilizza la voce *"Tastiere"*  da *"Impostazioni - Opzioni di lingua"*, come da immagine seguente:



![Impostazione Windows](impostazioni_opzioni_lingua_windows.PNG)

Per passare da una lingua ad un'altra si utilizza il selettore delle lingue collocato, normalmente, alla destra della barra delle applicazioni.


![Switch Windows](switch_lingua_windows.PNG)

Oppure ancora più velocemente si può premere il tasto tasto "Meta", anche denominato Super o Win (in pratica quello contrassegnato con un logo e collocato tra i tasti Ctrl e Alt sinistro), e la BARRA SPAZIATRICE per scorrere le tastiere installate. 

![Switch tastiera Windows](switch_lingua_windows2.PNG)

## Impostazione della tastiera internazionale in macOS

In macOS: Preferenze di Sistema - Sorgenti di input.

![Impostazione macOS](impostazione_tastiera_macos.png)

Per passare da una mappatura all'altra si può utilizzare il menù tastiera.

![Switch macOS](switch_macos.png)

Ancora più velocemente si può impostare una combinazione di tasti.

![Switch tastiera macOS](combinazione_tasti_macos.png)

Alcune particolarità: in *macOS*, l'accento grave (il "backtick" già sopra menzionato) ed il carattere "tilde" si trovano in una collocazione diversa rispetto a Windows e Linux.

Come risulta dall'immagine seguente, si trovano nel tasto che, nella mappatura italiana, è dedicato al "maggiore e minore", ovvero tra il tasto "Maiuscolo" e la lettera "Z".

![Particolarità macOS](backtick_us_intern.png)

## Impostazione della tastiera internazionale in GNU/Linux Ubuntu

La famiglia GNU/Linux è composta da una miriade di distribuzioni e meriterebbe una trattazione dedicata.

In questo articolo mi limito ad alcune indicazioni in riferimento ad Ubuntu, tra le più popolari e posta a base di altre distribuzioni derivate.

Per impostare una tastiera aggiuntiva in Ubuntu è sufficiente andare in *"Impostazioni - Regione e Lingua - Sorgenti input"*.

Il resto è molto intuitivo: con il segno "+" si aggiundono altre mappature, con *"Gestione lingue installate"* si modificano le mappature già installate.

![Impostazione Ubuntu](impostazione_ubuntu.png)

Anche in Ubuntu, in caso di mappature multiple, è molto semplice selezionare le varie tastiere configurate.

Innanzitutto si può utilizzare il puntatore nell'area di notifica:

![Switch Ubuntu](ubuntu_switch_barra.png)

Da notare che questo sistema operativo offre, come risulta dall'ultima voce del menù sopra riportato *"Mostra disposizione tastiera"*, la possibilità di visualizzare una **completa tastiera** nella mappatura corrente, compresi i tasti funzione, la tastierina numerica ed i tasti freccia.

![Internazionale completa](internazionale_completa.png)

Come nei precedenti sistemi operativi, si può anche utilizzare una "scorciatoia da tastiera", come da seguenti preimpostazioni:

![Switch tastiera Ubuntu](ubuntu_switch_tastiera.png)

## In conclusione

La tastiera internazionale è molto comoda ex efficiente e  può essere impostata, senza alcun problema, anche nei sistemi operativi con i menù in italiano:  mappatura e  lingua di sistema sono due elementi totalmente distinti tra loro che possono benissimo convivere.

Con un po' di allenamento si può utilizzare anche con i tasti serigrafati in italiano: basta memorizzare la diverse posizioni e digitare senza guardare le lettere stampate sui tasti.

L'unico problema? Quando vi sarete abituati a questa mappatura non vorrete più tornare indietro!

Grazie per l'attenzione.
