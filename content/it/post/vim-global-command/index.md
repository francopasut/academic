---
title: "A proposito di Vim e del Comando Globale"
date: 2022-12-03
slug:  vim_global_command_about
categories:
  - Editor
tags:
  - Vim
image:
  placement: 3
  preview_only: false 
  caption: 'Vim ed il Globo'
---



## Vim e il comando globale: struttura di base

Questo articolo non è una completa disamina del Comando Globale in Vim ma è solo una serie di osservazioni personali sullo stesso.

Potete trovare una buona rassegna, scritta da chi ne sa molto più di me, [in questa pagina](https://dev.to/iggredible/discovering-vim-global-command-49ad).

Con il "Comando globale" di Vim (`g`) è possibile replicare vari
*ex-comandi* su più righe.

La struttura di base del comando globale è molto semplice:
`:g/pattern/command`, ovvero:

- `:` attiva la "modalità di comando".
- `g` attiva il "comando globale".
- `/pattern/` è la "zona di ricerca" per la corrispondenza dei modelli
  nel documento.
- `/command/` è il comando applicato alle intere righe in cui si trovano
  i risultati.

La struttura di base è quindi bifasica: una fase di ricerca iniziale e
una fase di comando.

Per dimostrare come funziona questa struttura, ipotizziamo l'esistenza delle seguenti
righe:

    abc
    def
    ghi
    jkl
    mno

Se si desidera eliminare la riga  contenente la lettera "a", è possibile
utilizzare il seguente comando `:g/a/d` in cui:

- `:` è il tipico carattere di attivazione della modalità di comando in Vim.
- `a` è il modello di ricerca.
- `d` è il comando (Elimina) applicato all'intera riga in cui si trova
  il risultato della ricerca.

  È davvero semplice!

## Comando Globale di Vim e intervallo di ricerca

Se invece si vuole cancellare un *intervallo di righe* che corrispondono
a un modello iniziale e finale, è necessario utilizzare un *comando
globale* leggermente più strutturato.

Supponiamo di dover cancellare tutte le righe tra quella contenente la
lettera "a" e quella contenente la lettera "k".

In questo caso, è necessario utilizzare una struttura trifasica: schema
iniziale, schema finale e comando.

La struttura è la seguente `:g/initial_pattern/,/ final_pattern/command`

I modelli iniziale e finale sono separati da una virgola.

In questo caso, si usa la seguente formula
`:g/a/,/k/d` in cui:

- `a` è il modello iniziale
- `k` è lo schema finale
- `d` è il comando

Se invece si vuole cancellare solo l'intervallo che inizia dalla riga
**dopo** il primo pattern corrispondente, si deve usare l'opzione `+1`
al pattern iniziale:
`:g/a/+1,/k/d`

Allo stesso tempo, se si deve cancellare fino all'intervallo **prima**
del pattern di corrispondenza finale, si deve usare l'opzione `-1` dopo
il pattern finale:
`:g/a/,/k/-1d`

Combinando i due obiettivi precedenti: se si deve cancellare
l'intervallo che inizia dalla riga **dopo** il modello di corrispondenza
iniziale e fino alla riga **prima** del modello di corrispondenza
finale, si devono usare entrambe le opzioni `+1` e `-1`:
`:g/a/+1,/k/-1d`.

## Esempi vari

Naturalmente, è possibile eseguire tutte le altre operazioni consentite
dal comando globale, tra cui:

- Cancellare (come visto sopra)
- Sostituire
- Normale
- Stampa
- Spostare
- Metti
- Copia
- Ordinamento

Esempio con il comando *Normale*: supponiamo di dover aggiungere una
riga vuota dopo la riga con la lettera "a" in qualsiasi punto del
documento si trovi il cursore.

Questa è la soluzione:
`:g/a/norm o`

Che cos'è questa `norm o`?

Quando trova l'obiettivo, la formula istruisce Vim ad applicare la
modalità normale (`norm`) e a digitare virtualmente l'aggiunta di una
riga sotto con il comando standard `o` di Vim, che tutti coloro che
usano Vim, ovviamente, conoscono già.

Un altro obiettivo per il quale bisogna aggiungere un punto alla fine di
ogni riga.

Ecco come fare:
`:g/a/norm A,`.

Il comando `norm A,` aggiunge una virgola alla fine della riga.

Con la stessa logica si possono creare infinite combinazioni di comandi.

Grazie per l'attenzione.
