---
title: "Confronto tra Vim ed Emacs per un'operazione di sostituzione tramite espressioni regolari"
date: 2022-09-12
slug: vim_emacs_blank_regex
categories:
  - Editors
tags:
  - Vim
  - Emacs
  - RegEx
image:
  placement: 3
  preview_only: true 
  caption: 'Vim and Emacs'
---

{{% toc %}}

<style>
table {
    border-collapse: collapse;
}
table, th, td {
   border: 1px solid black;
}
blockquote {
    border-left: solid blue;
    padding-left: 10px;
}
</style>

## Prefazione

Questo è un articolo riassuntivo di due precedenti post che potete leggere a queste pagine:

- ["Vim: Studio sulla costruzione di Espressioni Regolari per cancellare o ridurre righe vuote con il Comando Globale"](https://francopasut.netlify.app/it/post/vim_regex_blank_lines/)
- ["Emacs: Studio sulla costruzione di espressioni regolari per eliminare o ridurre le righe vuote"](https://francopasut.netlify.app/it/post/emacs_regex_blank_lines/)
    
L'argomento delle "espressioni regolari" in Vim ed Emacs si presta bene a un confronto funzionale tra i quattro diversi scenari trattati negli articoli sopra menzionati ai quali rimando per la descrizione della sintassi.

## Tabella Comparativa

| Obiettivo                             | Vim                | Emacs                                                              |
|------------------------------------|--------------------|--------------------------------------------------------------------|
| Eliminare le righe vuote "pure" | `:g/^$/d`          | `M-x flush-lines <RET> ^$ <RET>`                                   |
| Eliminare le righe vuote con spazi bianchi | `:g/^\s*$/d`       | `M-x flush-lines <RET> ^\s-*$ <RET>`                               |
| Ridurre le righe vuote "pure"          | `:g/^$\n^$/d`      | `M-x query-replace-regexp <RET>  ^C-qC-j\{2,\} <RET> C-qC-j <RET>` |
| Ridurre le righe vuote con spazi bianchi | `g/^\s*$\n^\s*$/d` | `^\(^C-q<SPC>*C-qC-j\)\{2,\} <RET> C-qC-j <RET>`                   |

## Emacs: ciò che digiti  non è ciò che vedi

Come illustrato nell'articolo dedicato ad Emacs, *ciò che digiti non è giò che vedi*.

Di seguito una breve tabella riassuntiva per le operazione di "riduzione" delle righe bianche, la terza e quarta formula della tabella precedente,  distinguendo i tasti premuti dai caratteri visualizzati.

| Premi                                            | Visualizzi                     |
|-------------------------------------------------|-------------------------|
| `^C-qC-j\{2,\} <RET> C-qC-j <RET>`              | `^^J\{2,\} → ^J`        |
| `^\(^C-q<SPC>*C-qC-j\)\{2,\}<RET> C-qC-j <RET>` | `^\(^ *^J\)\{2,\} → ^J` |

## Breve sintesi



L'argomento delle espressioni regolari in Vim ed Emacs mostra diverse differenze tra i due editor.

Non sono in grado di stabilire quale sia l'implementazione migliore.

È necessario, in ogni caso, considerare che Emacs ha un ottimo emulatore di Vim, *Evil*, che permette di utilizzare lo stesso linguaggio di espressioni regolari dell'editor di origine.

Grazie per l'attenzione.

