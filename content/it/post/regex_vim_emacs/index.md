---
title: "Brevi animazioni introduttive sulle espressioni regolari in Vim ed Emacs"
date: 2021-07-13
slug: regex_vim_emacs
categories:
  - Editors
tags:
  - Vim
  - Emacs
  - Regexp
image:
  placement: 3
  caption: 'Vim ed Emacs insieme'
---

## Una non-prefazione a proposito delle "espressioni regolari"

Usando  Vim ed Emacs per scrivere in LaTeX ho avuto modo di apprezzare la straordinaria efficienza delle "Espressioni regolari", anche conosciute con il nome *regex* o *regexp*.

Vim and Emacs sono nativamente predisposti per la gestione delle *espressioni regolari*.

Ho predisposto alcuni brevi animazioni sull'utilizzo di base delle *espressioni regolari* in entrambi gli editori.

Le animazioni sono rivolte non agli sviluppatori, che le troveranno eccessivamente semplici, ma a chi usa Vim ed Emacs per scrivere articoli o documenti, con LaTeX o Markdown.

## Vim and regex

Per usare le "espressioni regolari" in Vim occorre attivare la linea di comando facendo seguito con uno schema del tipo seguente:

```vim
:(range)s/something/something_else/options
```

Di seguito trovate  una GIF con uno schema di base di "espressione regolare": nell'esempio sono presenti due istanze della parola *dolor* che vorrei trasformare in *gaudium*.

![Clip 1](/img/regex_vim_emacs_1.gif)

Ha funzionato, ma solo la prima istanza della parola *dolor* è stata modificata in *gaudium*!

Per ottenere la modifica di tutte le istanze occorre aggiungere l'opzione *g* al termine della stringa:

![Clip 2](/img/regex_vim_emacs_2.gif)

Ora entrambe le istanze sono state trasformate ed il risultato voluto è stato raggiunto!

## Le espressioni regolari in Emacs

Emacs può emulare il comportamento di Vim attraverso il pacchetto *Evil-mode* ed, in questo caso, l'utilizzo delle *espressioni regolari* è simile a quello sopra indicato.


Nella versione effettiva di Emacs, in ogni caso, per invocare le "espressioni regolari" occorre utilizzare il comando `M-x` seguito dalla funzione  `replace-regex`.

Lo schema di "espressione regolare" in Emacs è, per il caso già sopra utilizzato, il seguente: 

`M-x replace-regexp RET dolor RET gaudium RET`

Nella GIF seguente potete vedere il comando in azione:

![Clip 3](/img/regex_vim_emacs_3.gif)

In Emacs, tutte le istanze sono modificate in automatico.

Le animazioni sono state registrate con   *Peek* in  *Arch Linux*.

[Pubblicato in origine su Medium](https://medium.com/@francopasut/animated-gifs-about-basic-regex-in-vim-and-emacs-ecdac82499bf)
