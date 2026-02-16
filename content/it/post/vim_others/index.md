---
title: "Vim... oltre Vim"
date: 2026-02-16
slug:  vim_others
categories:
  - Blog
tags:
  - Vim
  - Emacs
  - Visual Studio Code
  - Sublime Text
  - Zed
image:
  placement: 3
  preview_only: false 
  caption: 'La Radice di Vim'
canonicalUrl: https://francopasut.blogspot.com/2026/02/vim-oltre-vim.html
---



- [1. Vim in cinque minuti](#1-vim-in-cinque-minuti)
- [2. Non un tutorial su Vim](#2-non-un-tutorial-su-vim)
- [3. Vim in Emacs: Evil Mode, l'emulatore per eccellenza](#3-vim-in-emacs-evil-mode-lemulatore-per-eccellenza)
- [4. Vim in Sublime Text](#4-vim-in-sublime-text)
- [5. Vim in Visual Studio Code](#5-vim-in-visual-studio-code)
- [6. Vim in Zed: il più giovane](#6-vim-in-zed-il-più-giovane)


# 1. Vim in cinque minuti

Vim non è  un semplice editor di testo, è un **linguaggio di editing** che  permette di dialogare con il testo attraverso combinazioni logiche di tasti.

La base del "linguaggio"  di Vim è costituito dal sistema "modale".

Le modalità principali sono le seguenti:

-   ****Normal Mode****: Il "centro di comando". Ogni tasto è un comando di movimento o modifica.
-   ****Insert Mode****: Dove si scrive effettivamente il testo.
-   ****Visual Mode****: Per selezionare blocchi di testo.

Questa separazione elimina la necessità di usare il tasto `Ctrl` o il mouse per ogni operazione, riducendo l'affaticamento della mano.

In Vim, le  mani, infatti, non lasciano mai la posizione centrale della tastiera. I movimenti base avvengono con `h`, `j`, `k`, `l`, ma la vera potenza risiede nei **salti semantici**:

-   **Parole**: `w` (salta all'inizio della parola successiva), `b` (torna indietro), `e` (fine parola).
-   **Ricerca rapida**: `f` seguito da un carattere (es. `ft`) porta il cursore istantaneamente alla prima 't' della riga.
-   **Inizio/Fine**: `0` per l'inizio riga, `$` per la fine, `gg` per l'inizio file, `G` per la fine.

Vim può "saltare" tra le parole  come se fosse un "Cavallo sulla scacchiera".

Gli "oggetti di testo" permettono di operare su strutture logiche (parole, frasi, paragrafi, blocchi di codice) indipendentemente dalla posizione del cursore.

La sintassi segue la logica: **[Azione] + [Ambito] + [Oggetto]**.

Immaginando di avere il cursore all'interno di una stringa tra virgolette: `print("Ciao Mondo")` ecco alcuni semplici esempi di "oggetti di testo":

-   `ci"` (**Change Inside "**): Cancella "Ciao Mondo" ed attiva l'Insert Mode per scrivere la nuova stringa.
-   `da(` (**Delete Around (**): Cancella l'intera parentesi, incluse le parentesi stesse.
-   `yiw` (**Yank Inner Word**): Copia (Yank) la parola sotto il cursore senza doverla selezionare.

**Tabella di Riferimento Rapido:**

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Comando</th>
<th scope="col" class="org-left">Traduzione Logica</th>
<th scope="col" class="org-left">Risultato</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left"><b>dip</b></td>
<td class="org-left">Delete Inside Paragraph</td>
<td class="org-left">Cancella l'intero paragrafo corrente.</td>
</tr>

<tr>
<td class="org-left"><b>ca{</b></td>
<td class="org-left">Change Around {}</td>
<td class="org-left">Sostituisce un intero blocco di codice tra graffe.</td>
</tr>

<tr>
<td class="org-left"><b>vit</b></td>
<td class="org-left">Visual Inside Tag</td>
<td class="org-left">Seleziona il contenuto di un tag HTML (es. tra div).</td>
</tr>
</tbody>
</table>

L'efficienza di Vim deriva anche dalla **componibilità** ovvero dalla possibilità di combinare i comandi tra loro per ottenere comandi composti.

L'unico problema? Non è possibile imparare Vim in cinque minuti. 


# 2. Non un tutorial su Vim

Diciamocelo chiaramente: la rete è satura di tutorial su come installare ed utilizzare Vim.

Questo **non** è uno di quei post. In questo articolo non si parla di Vim come software a sé stante, ma di **"Vim oltre Vim"**.

Come già in precedenza osservato, Vim  è un **sistema di editing modale**:, una vera e propria "filosofia" che trascende l'applicazione originale per "abitare" all'interno dei software di *editing* a linea di comando.

Pertanto è possibile emulare, ovvero ricreare la medesima "filosofia" di Vim, all'interno di altri sistemi di editing.

**L'emulazione di Vim permette di:**

1.  **Risparmiare tempo:** Le operazioni ripetitive diventano istantanee.
2.  **Proteggere la salute:** Ridurre l'uso del mouse aiuta a prevenire i rischi di traumi ai polsi (RSI).
3.  **Mantenere il focus:** Gestire ogni movimento con la sola tastiera, senza interrompere il flusso creativo.

Per scrivere questo articolo ho usato vari emulatori per scambiare le informazioni. Ogni volta ho ritrovato l'anima di Vim all'interno degli svariati Editor. 


# 3. Vim in Emacs: Evil Mode, l'emulatore per eccellenza

Nel mondo degli editor di testo, esiste una rivalità storica che rasenta la leggenda: ****Vim contro Emacs****.

Da un lato abbiamo la velocità dei comandi modali, dall'altro una flessibilità di estensione pressoché infinita.

È possibile unire il meglio dei due mondi?

Qui entra in gioco il plugin **Evil Mode**.

Gira da anni un detto ironico tra i programmatori:

> **"Emacs è un ottimo sistema operativo, a cui manca solo un buon editor."**

La potenza di Emacs come ambiente di calcolo e organizzazione è indiscussa, ma molti utenti trovano il suo sistema di inserimento testi originale (fatto di combinazioni di tasti spesso complesse) meno efficiente del sistema modale di Vim.

La ****Evil Mode**** (Extensible VI Layer) risolve esattamente questo "problema". Non è una semplice emulazione superficiale; è probabilmente l’implementazione di Vim più fedele, fluida e potente mai creata al di fuori del codice sorgente originale.

Il vero motivo per cui molti utenti decidono di fare il grande salto verso Emacs è uno solo: ****Org Mode****.

Lo confesso: è esattamente quello che è accaduto a me!

Org Mode è uno straordinario strumento per prendere appunti, gestire task, pianificare progetti e scrivere articoli complessi e strutturati. 

Ho cercato a lungo un plugin di Org Mode per Vim che fosse minimamente all'altezza delle sue funzionalità, ma la verità è una sola: ****non esiste****.

Ad oggi, la Evil Mode rappresenta il sistema migliore in assoluto per chi voglia utilizzare la potenza di Org Mode senza rinunciare alla "memoria muscolare" dei comandi Vim.

Uno dei grandi vantaggi di questo setup è la libertà di scelta. A differenza di altri ambienti, Emacs permette di ****attivare e disattivare la Evil Mode istantaneamente**** tramite una semplice scorciatoia da tastiera.

Il metodo più moderno ed efficiente per gestire i pacchetti in Emacs è usare *use-package*.

Anche per installare Evil Mode è possibile utilizzare il sistema *use-package*, occorre aggiungere il seguente frammento al file di configurazione (ad esempio `~/.emacs.d/init.el)`:

    (use-package evil
      :ensure t
      :init
      (setq evil-want-integration t) ;; Necessario per il supporto ad altri plugin
      (setq evil-want-keybinding nil)
      :config
      (evil-mode 1))

La *shortcut* predefinita per attivare/disattivare Evil al volo  è solitamente `C-z` (`Ctrl+z`), che passa dalla modalità "Vim" alla modalità "Emacs" nativa.

# 4. Vim in Sublime Text

Sublime Text (attualmente alla versione 4) sembra un po' "passato di moda", probabilmente perchè in un mondo di editor gratuiti rimane sostanzialmente una risorsa a pagamento.

In un ecosistema dominato da VS Code, Vim o Neovim e Zed — tutti gratuiti e *open source* — pagare per un editor di testo sembra una scelta controcorrente.

La "prova" è che alcuni plugin importanti, come LaTeXTools, non sono mai stati aggiornati per la versione 4 di Sublime. 

Tuttavia, c’è un motivo se molti professionisti non hanno mai smesso di versare quella quota: la performance.

Sublime Text offre ancora oggi un'esperienza di scrittura estremamente veloce e consuma una frazione della RAM rispetto ai suoi concorrenti più blasonati.

Non tutti sanno che Sublime Text nasconde un asso nella manica per gli amanti della velocità: *Vintage Mode*.

Pertanto Sublime Text **non ha bisogno di plugin per emulare Vim**: l'emulazione è già integrata nell'editor.

In altri termini: *Vintage Mode* è un pacchetto integrato che abilita l'editing modale di vi direttamente nell'editor.

Per attivare *Vintage Mode* basta andare nelle impostazioni utente e rimuovere "Vintage" dalla lista ignored<sub>packages</sub>.

In conclusione: Sublime Text non è affatto superato; è semplicemente diventato uno strumento per "intenditori" e con *Vintage* Mode, è probabilmente uno dei modi più eleganti per usare Vim oggi.

# 5. Vim in Visual Studio Code

Per emulare Vim in Visual Studio Code occorre utilizzare un *plugin* come VSCodeVim.

[VSCodeVim](https://github.com/VSCodeVim/Vim) è un emulatore Vim completo per Visual Studio Code. Permette di unire la flessibilità di VS Code con la velocità di editing tipica di Vim.

Il plugin è molto facilmente personalizzabile mediante il file *settings.json*.

Per aprire il file *settings.json* occorre premere   `Ctrl + Shift + P`, digitare "Open User Settings (JSON)".

Ad esempio: per uscire dalla modalità Inserimento (Insert Mode) digitando rapidamente jj, occorre aggiungere il seguente frammento all'interno del file *settings.json* (provato personalmente):

    "vim.insertModeKeyBindings": [
        {
            "before": ["j", "j"],
            "after": ["<Esc>"]
        }
    ]

Riporto anche l'esempio di configurazione ottimizzata, sempre nel file *settings.json*, tratto dalla descrizione del plugin:

    {
      "vim.easymotion": true,
      "vim.useSystemClipboard": true,
      "vim.leader": "<space>",
      "extensions.experimental.affinity": {
        "vscodevim.vim": 1
      }
    }

VSCodeVim integra, infatti,  alcuni *plugin* aggiuntivi molto utilizzati dalla  comunità Vim:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Plugin</th>
<th scope="col" class="org-left">Comando Chiave</th>
<th scope="col" class="org-left">Descrizione</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left"><b>vim-surround</b></td>
<td class="org-left"><code>cs</code>, <code>ds</code>, <code>ys</code></td>
<td class="org-left">Gestione di parentesi e tag</td>
</tr>

<tr>
<td class="org-left"><b>vim-easymotion</b></td>
<td class="org-left"><code>&lt;leader&gt;&lt;leader&gt;</code></td>
<td class="org-left">Salti rapidi nel documento</td>
</tr>

<tr>
<td class="org-left"><b>vim-commentary</b></td>
<td class="org-left"><code>gc</code></td>
<td class="org-left">Commento rapido del codice</td>
</tr>

<tr>
<td class="org-left"><b>vim-sneak</b></td>
<td class="org-left"><code>s&lt;char&gt;&lt;char&gt;</code></td>
<td class="org-left">Salto verso due caratteri</td>
</tr>

<tr>
<td class="org-left"><b>ReplaceWithRegister</b></td>
<td class="org-left"><code>gr</code></td>
<td class="org-left">Sostituzione testo con registro</td>
</tr>
</tbody>
</table>

La descrizione del plugin *VSCodeVim* menziona anche alcune funzioni speciali:

-   **gd**: Jump to definition (nativo VS Code).
-   **gb**: Aggiunge cursori multipli sulle parole corrispondenti.
-   **af**: Selezione visuale gerarchica (espande la selezione).
-   **gh**: Mostra l'hover (documentazione/tipi) senza usare il mouse.

Ho trovato particolarmente utile ed interessante la funzione **gb**.

Il plugin *VSCodeVim* può essere disattivato con il comando  ****toggleVim****:

1.  Aprire la ****Command Palette**** con Ctrl+Shift+P (o Cmd+Shift+P su Mac).
2.  Digitare ****"Vim: Toggle Vim Mode"**** e premere Invio.
3.  Nella barra di stato in basso apparirà la scritta `-- VIM: DISABLED --`.
4.  Per riattivare Vim rifare la stessa operazione.

Per avere un tasto di attivazione/disattivazione rapida, simile al *Ctrl+z* di  Emacs, occorre mappare manualmente il comando come segue:

1.  Aprire il file delle scorciatoie da tastiera (JSON) tramite la Command Palette: cercare ****"Preferenze: apri tasti di scelta rapida (JSON)"****, da non confondere con **"Preferenze: apri tasti di scelta rapida"** (senza JSON) in quanto in questo caso NON verrebbe aperto il file ma lista delle scorciatoie.
2.  Inserire uno snippet come quello seguente all'interno delle parentesi quadre `[]`:

    {
        "key": "ctrl+alt+v", 
        "command": "toggleVim"
    }

Ovviamente è possibile sostituire `ctrl+alt+v` con altre combinazioni di tasti che non siano già utilizzate dal sistema.


<a id="orgddfad8f"></a>

# 6. Vim in Zed: il più giovane

Zed è l'editor "più giovane" di questa piccola rassegna.

Lo ammetto, ancora non lo conosco bene e mi riservo di dedicare altri articoli a questo editor.

Però ho approfondito, per scrivere questo articolo, la parte relativa all'attivazione dell'emulatore di Vim. 

Scritto in Rust, Zed punta tutto sulle performance e questo obiettivo   si coniuga perfettamente con la filosofia di Vim.

Come già osservato per Sublime Text, in Zed  la "Vim Mode" non è  un plugin di terze parti ma il supporto a Vim è nativo.

Non c'è nulla da scaricare, occorre soltanto aprire le impostazioni ed attivare la modalità Vim.

Il modo più semplice per impostare l'emulazione Vim è quella di aprire il menù di configurazione in uno dei tre seguenti modi:

1.  Premere le tre linee orizzontali in alto a sinistra, scegliere la voce Open Settings, inserire "Vim" nella casella Search Settings, scegliere la voce Modal Editing ed attivare il pulsante Vim Mode.
2.  Premere `Ctrl + ,`  e seguire le stesse indicazioni sopra riportate.
3.  Aprire la *Command Palette* (Ctrl+Shift+P) e scegliere la voce *Zed: open settings* e proseguire come sopra riportato.

È possibile attivare l'emulazione direttamente dalle impostazioni globali del programma mediante aprendo il file di configurazione *settings.json* in uno dei seguenti modi:

1.  Premere le tre linee orizzontali in alto a sinistra, scegliere la voce Open Settings Filedt.
2.  Premere `Ctrl + Alt + ,`.
3.  Aprire la *Command Palette* (Ctrl+Shift+P) e scegliere la voce *Zed: open settings file*.

Dopo avere aperto il file di configurazione in uno dei tre modi sopra indicati basta inserire il seguente comando:

    {
      "vim_mode": true
    }

Ovviamente se fossero presenti altre configurazioni occorrerebbe aggiungere quella sopra indicata alle altre già presenti, ad es:

    {
      "vim_mode": true,
      "ui_font_size": 16,
      "buffer_font_size": 15,
      "theme": {
        "mode": "system",
        "light": "One Light",
        "dark": "One Dark",
      },
    }

Si vedrà l'indicatore della modalità (NORMAL, INSERT, etc.) nella barra di stato in basso a destra.

Zed implementa gran parte dei comandi standard di Vim, inclusi:

-   Movimenti: h, j, k, l, w, b, e, 0, $, G, gg.
-   Operatori: d, c, y, p, u.
-   Oggetti di testo: iw, it, i", ecc.
-   Comandi : :w, :q, :wa.

Possiamo effettuare la stessa personalizzazione sopra descritta per VSCode, ovvero utilizzare la scorciatoia di tastiera  jj per uscire dalla modalità Insert mediante configurazione in *keymap.json*.

Ecco il procedimento:  aprire la Command Palette, digitare "Zed: Open Keymap file" ed aggiungere la seguente configurazione:

    [
      {
        "context": "Editor && vim_mode == insert",
        "bindings": {
          "j j": "vim::NormalBefore"
        }
      }
    ]

Nota bene: nel file *keymap.json* originale di Zed è già preimpostato ma disattivato il comando `j k` che  ho modificato inserendo `j j`.

A questo punto basta eliminare le due barre oblique `//` per attivare la *shortcut*.

Grazie per l'attenzione.

