---
title: "Da Org Mode a WordPress: scrivere gli articoli in HTML pulito eliminando il codice superfluo"
date: 2026-11-07
slug:  html_org_wordpress
categories:
  - Blog
tags:
  - HTML
  - Org Mode
  - WordPress
image:
  placement: 3
  preview_only: false 
  caption: 'Org Mode e WordPress'
canonicalUrl: https://francopasut.blogspot.com/2026/11/da-org-mode-wordpress-scrivere-gli.html
---

- [1. Vantaggi del flusso da Org Mode a HTML per gli articoli in WordPress](#1-vantaggi-del-flusso-da-org-mode-a-html-per-gli-articoli-in-wordpress)
- [2. Efficienza e velocità di scrittura grazie ad Org Mode](#2-efficienza-e-velocità-di-scrittura-grazie-ad-org-mode)
- [3. Gestione del blocco "HTML personalizzato" vs Editor in modalità Codice](#3-gestione-del-blocco-html-personalizzato-vs-editor-in-modalità-codice)
- [4. Gestione avanzata di Indice (TOC) e Struttura](#4-gestione-avanzata-di-indice-toc-e-struttura)
- [5. Configurazione delle opzioni di esportazione: Indice e Numerazione](#5-configurazione-delle-opzioni-di-esportazione-indice-e-numerazione)
- [6. Modalità di inserimento: Editor in versione Codice vs Visuale](#6-modalità-di-inserimento-editor-in-versione-codice-vs-visuale)
- [7. Conclusione](#7-conclusione)


# 1. Vantaggi del flusso da Org Mode a HTML per gli articoli in WordPress

In breve: controllo totale sul markup.

In dettaglio:

-   Nessun tag superfluo o *div* nidificati generati automaticamente dall'editor a blocchi (Gutenberg). Gli editor visuali (come Gutenberg in WordPress) e i *page builder* inseriscono moltissimi *wrapper* e contenitori invisibili necessari per la gestione grafica dei blocchi, trasformando un semplice titolo o paragrafo in una struttura complessa e profonda.
-   Separazione netta tra contenuto strutturato e stilizzazione CSS gestita dal tema WordPress.
-   Il codice ridondante aumenta il peso delle pagine, rende la manutenzione del CSS più complessa, peggiora l'accessibilità (screen reader) e può penalizzare la leggibilità del codice sorgente da parte dei motori di ricerca.
-   Il sorgente in formato `.org` resta un formato di testo puro, come tale editabile con qualsiasi editor di testo.

Scrivere in Org Mode e convertire direttamente in HTML permette di mantenere un markup pulito, leggero e strettamente aderente alla struttura logica del testo.

# 2. Efficienza e velocità di scrittura grazie ad Org Mode

La scrittura in Org Mode offre una serie di vantaggi ulteriori:

-   Utilizzo di scorciatoie da tastiera avanzate per la strutturazione del testo (head, liste, tabelle).
-   Esportazione diretta in HTML tramite le funzioni native di Org (`C-c C-e h h` oppure `C-c C-e h o`).
-   Possibilità di gestire metadati, categorie, tag e custom CSS direttamente dalle opzioni di intestazione del file.

# 3. Gestione del blocco "HTML personalizzato" vs Editor in modalità Codice

-   Inserimento dell'HTML esportato all'interno di un unico blocco *HTML personalizzato* per evitare che l'editor visuale alteri la formattazione o elimini tag specifici.
-   Disattivazione o attenzione alle funzioni di auto-formatting di WordPress (es. inserimento automatico di tag `<p>` o `<br>` indesiderati).

# 4. Gestione avanzata di Indice (TOC) e Struttura

Per quanto riguarda l'indice (TOC) osservo:

-   Con la scrittura a blocchi occorre prima pubblicare l'articolo e poi scegliere il blocco dell'indice.
-   Con Org Mode l'indice è generato automaticamente durante la conversione in HTML.

Riporto un confronto pratico:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Funzionalità</th>
<th scope="col" class="org-left">Editor a blocchi (Gutenberg)</th>
<th scope="col" class="org-left">Org Mode / HTML</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">Generazione TOC</td>
<td class="org-left">Tramite plugin o blocco dedicato post-pubbl.</td>
<td class="org-left">Automatica all'esportazione con configurazione</td>
</tr>

<tr>
<td class="org-left">Gestione anchor links</td>
<td class="org-left">Manuale per ogni blocco/titolo</td>
<td class="org-left">Generata in automatico basandosi sulla gerarchia</td>
</tr>

<tr>
<td class="org-left">Pulizia del codice</td>
<td class="org-left">Inclusione di commenti e attributi di blocco</td>
<td class="org-left">Codice HTML5 essenziale e pulito</td>
</tr>
</tbody>
</table>

# 5. Configurazione delle opzioni di esportazione: Indice e Numerazione

Per adattare l'output HTML alle esigenze di un articolo per WordPress, è possibile controllare fin nei minimi dettagli il comportamento dell'esportatore tramite le direttive di configurazione inserite nell'intestazione del file (header).

In particolare, aggiungendo la riga `#+OPTIONS` è possibile gestire la generazione dell'indice e la numerazione dei titoli:

    #+OPTIONS: toc:2 num:nil tags:nil

Ecco cosa fanno nello specifico questi parametri:

-   `toc:2` (Table of Contents): Determina la presenza e la profondità dell'indice automatico. Impostandolo su `2`, Org Mode genererà un indice che include i titoli fino al secondo livello (es. intestazioni di livello 1 e 2), posizionandolo automaticamente nel punto desiderato del documento. È possibile disattivarlo completamente impostandolo su `nil` (`toc:nil`).
-   `num:nil` (Numerazione dei titoli): Disabilita la numerazione automatica delle intestazioni (1, 1.1, 2, ecc.). Per un articolo di un blog o una pagina web, i titoli non numerati offrono un impatto visivo più pulito e moderno, lasciando al foglio di stile CSS del tema WordPress il compito di formattarli graficamente.
-   `tags:nil` (Tags): In questo modo, i *tag* rimarranno visibili nel file sorgente di Org Mode ma verranno omessi nell'HTML generato. Questa opzione è **molto importante** in quanto consente di mantenere il metodo di ricerca per *tag* in Org Agenda senza ritrovarseli, poi, nella versione generata per la pubblicazione sul web.

Queste direttive, affiancate a metadati come `#+TITLE` e `#+LANGUAGE: it`, permettono di automatizzare completamente la preparazione del codice HTML prima ancora di esportarlo verso la piattaforma.

# 6. Modalità di inserimento: Editor in versione Codice vs Visuale

Quando si incolla l'HTML esportato da Org Mode all'interno di WordPress, è fondamentale passare all'editor di testo in modalità **Codice** (o inserire il testo all'interno di un blocco **HTML personalizzato**). 

L'utilizzo dell'editor **Visuale** va tassativamente evitato in questo flusso: interpretando l'HTML come testo semplice, l'editor visuale applicherebbe l'escape dei tag (convertendo ad esempio i caratteri \`<\` e \`>\` in entità HTML) o inserirebbe formattazioni e paragrafi automatici indesiderati, invalidando la struttura pulita generata da Org Mode.

# 7. Conclusione

Scrivere in HTML, ovvero in testo puro, su WordPress permette un controllo capillare sulla pulizia del codice e, conseguentemente, sui contenuti dell'articolo.

Generare l'HTML da Org Mode consente di ottenere in totale automatismo l'indice ed i collegamenti interni ed esterni che vengono generati direttamente in sede di esportazione da Org Mode.

Vale la pena quindi dare una *chance* a un sistema di scrittura degli articoli basato su Emacs, Org Mode e HTML, utilizzabile su WordPress o qualsiasi altro ambiente analogo.

Grazie per l'attenzione.

