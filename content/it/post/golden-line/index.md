---
title: "La  \"linea evolutiva\" tra Ed, Vi e Vim" 
date: 2021-03-25 
canonical_url: "https://medium.com/@francopasut/the-golden-line-across-ed-vi-and-vim-fa7b69b2089" 
slug: golden_line 
categories:
 - Editors 
tags:
 - Vim 
image: 
  placement: 3 
  preview_only: true 
  caption: 'Ed code'
---

{{% toc %}}

## Piccola prefazione a proposito di Ed, Vi and Vim

Avete mai sentito parlare di **Ed** e  **Vi**? Probabilmente avrete sentito parlare di **Vim**.

Sono sistemi di scrittura a linea di comando.

**Ed** è stato creato nel 1969 ed è stato uno dei primi componenti del sistema operativo Unix.

**Vi** risale al  1976 ed è stato il sistema di scrittura standard per Unix fino all'arrivo, nel 1984, di  Emacs.

**Vim** è nato nel  1991 ed è attualmente il *più veloce sistema di scrittura dell'universo*!

Se stato utilizzando un sistema operativo basato su Unix,   ad esempio una distribuzione Linux o il macOS, li avete tutti già disponibili (Anche se Vi come opzione all'interno di Vim) oppure, in ogni caso, installabili (in Arch Linux: `pacman -S ed vim`).

Esiste una *linea costante*tra di essi There's a *linea evolutiva* tra di essi. Trattasi dell'argomento di questo breve articolo.

## Scriviamo un documento con Ed

Ed è un editore di linea essenziale: anche se le operazioni di base sono molto semplici, nel 1969 ha rappresentato una vera evoluzione nella scrittura.

Questo editore è stato progettato per utilizzare alcuni caratteri come comandi per attivare specifiche funzioni di scrittura dei testi.

It was not yet a *modal editor* but an editor with specific input commands.

Vediamo un semplice esempio (ricordate che dopo ogni comando occorre premere il tasto Invio).

Premete `ed` (+ Invio) nel terminale e guardate cosa succede: nulla più che cursore in una linea vuote. Dov'è l'editore? Vi trovate proprio al suo interno!

Benvenuti nel vostro primo *buffer* in Ed!

Adesso scriviamo all'interno: premiamo `a` per  *appendere* il testo ed iniziare a scrivere qualcosa. Al termine basta inserire un punto e premere Invio.

Ora avete un buffer (testo memorizzato in un ambiente temporano) ma non ancora un documento di testo.

Per trasformare la memoria temporanea in un documento occore salvarlo con il comando `w` (write).

Per attribuire un nome al documento, ad esempio *test.txt*, occorre digitare `w test.txt`.

Ora avete un documento chiamato *text.txt* creato dal precedente *buffer*.

Per *modificare* qualche linea occorre utilizzare il comando `c` (change). Al termine si utilizza il comando `q` (quit) per uscire da Ed.

Ed ecco il mio primo documento scritto con Ed (in Arch Linux):

![My first Ed document](/img/ed_document.png)

Sotto riporto un piccolo sommario dei comandi utilizzati per il documento *test.txt* scritto in Ed:

* `a` per *appendere* del testo
* `.` per terminare la fase di scrittura
* `w` per salvare  (*write*) il testo in un documento
* `q` per uscire (*quit*) da Ed
* `c` per modificare (*change*) una linea

Chi usa Vim avrà già riconosciuto alcuni comandi di uso comune: *a, w, q, c*!

Per chi non conosce Vim vedremo alcuni comandi più sotto.

## Diamo un'occhiata a Vi 

Il nome Vim signitica "*Improved Vi*", ovvero "*Vi potenziato*". Vi è il *padre* di Vim.

Oggi, se lanciate il comando testuale `vi` in un terminale di sistema operativo basato su Unix, sarà lanciato Vim, ovvero il programmata di editing attuale.

Se, invece, volete proprio il programma *Vi tradizionale* potete lanciare il seguente comando: `vim -u NONE filename` per ritornare all'anno 1976. Nessun file di configurazione, nessun "plugin",  soltanto il  *Vi classico*.

Invece di usare lettere come comandi, "Vi" introdusse il "sistema modale":  modo Normale, modo Inserimento, modo Comando e così via.

Ogni "modalità" corrisponde ad un diverso comportamento dell'editore ed è attivato da un carattere.

Ma quale carattere utilizzare per passare da una modalità all'altra? La soluzione deriva proprio dall'impostazione di Ed.

Questo significa che per passare dal modo  *normale* ad *inserimento* occorre digitare il tasto  `i`(insert), per *aggiungere* testo occorre digitare `a`(append), per *modificare* il testo occorre digitare `c`(change), per *salvare* occorre digitare `w`(write) e per *uscire* occorre digitare `q`(quit).

È, pertanto, ragionevole ritenere che chi ha creato "Vi" si sia ispirato ai comandi di "Ed".

## Da "Vi" a "Vim"

"Vim" deriva da un "clone" di "Vi" chiamato "Stevie", scritto per  [Atari ST](https://en.wikipedia.org/wiki/Atari_ST) nel 1987, aggiungendovi altri funzioni e rendendolo retro-compatibile.

Infatti la prima definizione di Vim fu "*Imitazione di Vi*" poi variata in  "*Vi potenziato*" (in inglese "**V**i **im**proved*").

Vim utilizza le stesse lettere di comando di Vi. La stessa struttura già descritta per Vi vale anche per Vim.

Vim ha aggiunto un numero praticamente infinito di funzioni e configurazioni ma le basi sono le stesse di Vi e, pertanto, le stesse dal "vecchio", ma sempre presente, Ed del 1969.

Grazie per la vostra attenzione.

[Pubblicato in origine su Medium](https://medium.com/@francopasut/the-golden-line-across-ed-vi-and-vim-fa7b69b2089)
