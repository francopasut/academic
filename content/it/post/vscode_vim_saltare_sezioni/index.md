---
title: "Markdown in VSCode, emulazione Vim e navigazione tra le sezioni"
date: 2026-07-29
slug:  vscode_vim_saltare_sezioni
categories:
  - Blog
tags:
  - Markdown
  - Visual Studio Code
  - VSCode
  - Vim
image:
  placement: 3
  preview_only: false 
  caption: 'Coding'
canonicalUrl: https://francopasut.blogspot.com/2026/07/markdown-in-vscode-emulazione-vim-e.html 
---

- [1. Premessa](#1-premessa)
- [2. Vim in VSCode](#2-vim-in-vscode)
- [3. Passo-passo su come inserire la configurazione](#3-passo-passo-su-come-inserire-la-configurazione)
- [4. Navigazione Nativa in VS Code: Vai al Simbolo / Titolo (`Ctrl + Shift + O`)](#4-navigazione-nativa-in-vs-code-vai-al-simbolo--titolo-ctrl--shift--o)
- [5. La Barra Laterale: Pannello "Struttura" (Outline)](#5-la-barra-laterale-pannello-struttura-outline)
- [6. La Barra Indirizzi Superiore (Breadcrumbs)](#6-la-barra-indirizzi-superiore-breadcrumbs)
- [7. Conclusioni](#7-conclusioni)

# 1. Premessa

Visual Studio Code è un ottimo editor per Markdown.

Per muoversi velocemente nella struttura dei documenti scritti in Markdown esistono varie possibilità integrate nell'editor.

Inoltre, che per chi ha esperienza di VIM ed ha emulato tale editor in VSCode, è anche possibile inserire una semplice configurazione per utilizzare lo spostamento tramite parentesi quadre.

Iniziamo proprio da quest'ultima modalità di salto tra le sezioni utilizzando VIM emulato in VSCode.

# 2. Vim in VSCode

Per chi ha familiarità con **Vim** o utilizza l'editing modale, la velocità di spostamento all'interno del testo è fondamentale (come ho approfondito nell'articolo su [Vim oltre Vim](https://francopasut.blogspot.com/2026/02/vim-oltre-vim.html)).

Per attivare l'editing modale in VS Code è possibile utilizzare il *plugin* **VSCodeVim**, un emulatore completo che unisce le funzionalità dell'*editor* Microsoft con la velocità di scrittura tipica di Vim.

In Vim esiste la possibilità di saltare tra le sezioni del documento usando le combinazioni `]]` (sezione successiva) e `[[` (sezione precedente).

Possiamo replicare esattamente questo comportamento in VS Code mappando i comandi di ricerca sui titoli Markdown (`#`, `##`, `###`, ecc.).

Ecco la sintesi della sezione del mio precedente articolo, sopra menzionato, dedicata all'emulazione di Vim in Visual Studio Code:

-   Per attivare l'editing modale in VS Code viene utilizzato il plugin VSCodeVim, un emulatore completo che unisce le funzionalità e la flessibilità dell'editor Microsoft con la velocità di scrittura tipica di Vim.
-   L'estensione si configura facilmente agendo sul file globale settings.json di VS Code (accessibile tramite la palette comandi con Ctrl + Shift + P e selezionando Open User Settings (JSON)).
-   Attraverso la configurazione JSON è possibile definire combinazioni personalizzate per velocizzare il flusso di lavoro.

Nel file di configurazione  *settings.json*, che si apre con `Ctrl+Shift+P` e scegliendo "Open User Settings (JSON)", si inserisce il seguente codice:

```
    "vim.normalModeKeyBindingsNonRecursive": [
        {
            "before": ["]", "]"],
            "after": ["/", "^", "#", "<Enter>"]
        },
        {
            "before": ["[", "["],
            "after": ["?", "^", "#", "<Enter>"]
        }
    ]
```

Se fosse presente altro codice, occorrerebbe aggiungere una virgola al termine del codice preesistente ed inserire il nuovo codice subito sotto, ovvero PRIMA dell'ultima parentesi graffa che chiude il ciclo di tutte le configurazioni.

Dopo tale modifica si potrà  usare:

-   `]]` per andare alla prossima sezione (prossimo #, ##, ecc.).
-   `[[` per tornare alla sezione precedente.

# 3. Passo-passo su come inserire la configurazione

Ripeto in modalità passo-passo il percorso per inserire la predetta configurazione:

1.  Apri la **Command Palette** con la combinazione di tasti `Ctrl + Shift + P` (o `Cmd + Shift + P` su macOS).
2.  Seleziona la voce `Preferences: Open User Settings (JSON)`.
3.  All'interno del file `settings.json`, inserisci il seguente blocco di codice per mappare la navigazione non ricorsiva in Normal Mode:

```
    "vim.normalModeKeyBindingsNonRecursive": [
        {
            "before": ["]", "]"],
            "after": ["/", "^", "#", "<Enter>"]
        },
        {
            "before": ["[", "["],
            "after": ["?", "^", "#", "<Enter>"]
        }
    ]
```

**Nota di sintassi JSON:** Se il file `settings.json` contiene già altre regole, assicurati di aggiungere una virgola `,` al termine della riga precedente prima di incollare questo blocco. Il tutto deve rimanere racchiuso all'interno delle parentesi graffe generali `{ ... }`.

Una volta salvato il file:

-   Premendo **`]]`** in Normal Mode, il cursore salterà istantaneamente al **titolo successivo** (qualsiasi riga che inizia con `#`).
-   Premendo **`[[`** in Normal Mode, il cursore tornerà al **titolo precedente**.

# 4. Navigazione Nativa in VS Code: Vai al Simbolo / Titolo (`Ctrl + Shift + O`)

Per chi non usa l'emulazione Vim o preferisci cercare un titolo specifico anziché scorrere in sequenza, VS Code offre la potente funzionalità nativa **Go to Symbol in File**.

-   **Scorciatoia da tastiera:** `Ctrl + Shift + O` (su macOS: `Cmd + Shift + O`).
-   **Funzionamento:** Premendo questa combinazione si apre la barra di ricerca in alto contenente l'elenco completo di tutte le intestazioni (da `H1` a `H6`) presenti nel documento attivo.

Se dopo aver premuto `Ctrl + Shift + O` aggiungi il carattere **`:`** (ottenendo la stringa `@:` nella barra), VS Code organizzerà automaticamente tutti i titoli per livello gerarchico (`H1`, `H2`, `H3`&hellip;), consentendoti di individuare subito la macro-struttura del file.

# 5. La Barra Laterale: Pannello "Struttura" (Outline)

Per una visione d'insieme permanente durante la stesura o la revisione, lo strumento ideale è il pannello **Struttura** (*Outline*).

1.  Apri la barra laterale **Esplora risorse** (`Ctrl + Shift + E`).
2.  Nella parte inferiore della barra espandi la sezione **Struttura** (*Outline*).

In questo riquadro si vede l'albero completo dell'indice Markdown, aggiornato in tempo reale durante la scrittura:

-   Cliccando su un qualsiasi titolo della struttura, il cursore si posizionerà immediatamente alla riga corrispondente.
-   L'elemento attivo si evidenzia automaticamente mentre scorri il documento.
-   È possibile filtrare gli elementi semplicemente digitando all'interno del pannello quando è attivo.

# 6. La Barra Indirizzi Superiore (Breadcrumbs)

Subito sotto la scheda del file aperto (e sopra l'area di modifica del testo) si trova la barra dei **Breadcrumbs** (le "briciole di pane", ovvero il percorso del documento).

Nei file Markdown, i Breadcrumbs non mostrano soltanto la struttura delle cartelle sul disco, ma integrano anche **la sezione e il titolo corrente** in cui ci si prova con il cursore.

-   Cliccando sul nome dell'intestazione mostrato nei Breadcrumbs, si apre un menu a tendina con tutti i titoli dello stesso livello o del livello superiore.
-   Questo permette di saltare al volo da un capitolo all'altro senza dover aprire pannelli laterali o ricordare combinazioni di tasti.

# 7. Conclusioni

Padroneggiare la navigazione strutturale nei documenti scritti in Markdown con  Visual Studio Code permette di trasformare l'editor in un ambiente di scrittura veloce ed efficiente:

1.  Per la **scrittura sequenziale rapida**, l'emulazione Vim con `]]` e `[[` garantisce continuità senza staccare le mani dalla tastiera.
2.  Per la **ricerca mirata**, la combinazione `Ctrl + Shift + O` permette di saltare all'istante a qualunque intestazione.
3.  Per la **gestione visiva di documenti complessi**, la combinazione tra **Pannello Struttura** e **Breadcrumbs** offre un controllo totale del flusso di lavoro.

Grazie per l'attenzione.

