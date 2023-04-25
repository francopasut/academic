---
title: 'Emacs, configurazione portabile con "use-package" e "straight"'
date: 2023-04-25
slug:  emacs_portable_use-package_straight
categories:
  - Blog
tags:
  - Emacs
image:
  placement: 3
  preview_only: true 
  caption: 'Emacs, use-package e straight'
---

{{% toc %}}

## Emacs,  use-package e straight in breve.

Emacs utilizza l'archivio  GNU ELPA (Emacs Lisp Package Archive) per l'aggiornamento dei pacchetti installati. 

MELPA  (Milkypostman’s Emacs Lisp Package Archive) è, invece, un gestore non ufficiale con numerosi altri pacchetti e deve essere installato seguendo le [indicazioni di questa pagina](https://melpa.org/#/getting-started).

I metodi originali per l'installazione dei pacchetti sono i seguenti:

- `M-x package-install <RET> package-name <RET>`
- `M-x package-list-packages <RET>` seguito da `i` sui pacchetti desiderati e `x` per l'installazione effettiva dei pacchetti selezionati.

Per aggiornare i pacchetti si apre la *package-list* sopra indicata e si preme il tasto `U` seguito da `x`.

Tutto molto semplice ed efficiente.

C'è solo un piccolo problema:  **la configurazione non è esportabile**.

## Cos'è l'esportabilità della configurazione?

Chi usa Vim ha ben presente il concetto di *esportabilità della configurazione*: basta scrivere la configurazione  in *.vimrc* per avere automaticamente l'aggiornamento del  sistema attraverso il proprio *plugin-manager*.

In Emacs "nativo" non funziona così,   ma è possibile ottenere un risultato analogo tramite  *use-package*:  un pacchetto che semplifica la configurazione degli altri pacchetti.

Invece di dover scrivere la configurazione per ciascun pacchetto in modo esplicito, è possibile utilizzare la sintassi di "use-package" per dichiarare i pacchetti che si desidera utilizzare e la loro configurazione. 

Il metodo "use-package" garantisce che i pacchetti di ELPA o MELPA vengano installati, se non lo siano già, e consente di specificare la loro configurazione in modo chiaro e conciso.

In sintesi: ELPA e MELPA sono i gestori dei pacchetti e "use-package" è un pacchetto che semplifica la gestione dei pacchetti di quei gestori.

## Oltre l'esportabilità: "straight".

A questo punto possiamo fare un passo in più: modificare il gestore di pacchetti passando a *straight*.

A differenza di altri gestori di pacchetti, come "package.el" o "el-get", "straight" utilizza una struttura di directory dedicata ai pacchetti, anziché installarli nella directory di sistema di Emacs. 

Ciò rende più facile la gestione delle dipendenze e garantisce una maggiore stabilità del sistema e consente, tramite GIT,  l'installazione  di pacchetti non presenti in ELPA o MELPA.

Di seguito riporto la configurazione di  Emacs per utilizzare "*use-package*" e "*straight*".

## Configurazione di "straight".

Ecco il codice di configurazione per  installare "straight"  in  Emacs:

```elisp
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
```

## Configurazione di use-package.

Il seguente codice include "use-package" nella configurazione:

```elisp
(straight-use-package 'use-package)
```

Infine: codice per "obbligare"  *use-package* ad usare *straight.el* come gestore di pacchetti:

``` elisp
(use-package straight
  :custom
  (straight-use-package-by-default t))
```

Il codice precedente garantisce che "use-package" sia sempre installato utilizzando "straight", **anche senza la stringa *straight t***,  e abilita l'uso di "use-package" per la configurazione dei pacchetti.



## Piccolo esempio e piccola analisi.

Ad esempio, per installare il pacchetto "magit", la configurazione può essere scritta come segue:

```elisp
(use-package magit
  :bind (("C-x g" . magit-status)))
```

In questo esempio, "use-package" dichiara il pacchetto "magit". Inoltre, viene configurato un collegamento rapido per l'apertura di "magit-status" con la combinazione di tasti `C-x g`.

Come anticipato, non è necessario inserire il codice `:straight t` avendo precedente "obbligato" *use-package* ad utilizzare tale gestore di *default*.



## Lista di applicazione nel mio documento di configurazione.

Dopo la parte di configurazione sopra riportata, aggiungo una selezione di  applicazioni autoinstallanti con la tecnica sopra descritta (provate nelle distribuzioni  GNU/Linux  Ubuntu, Debian, EndeavourOS):

```elisp
(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package htmlize
)

(use-package evil
  :bind (("<escape>" . keyboard-escape-quit))
  :config
 (evil-mode 1)
 (setq evil-default-state 'emacs)
 )

(use-package evil-surround
:config
(global-evil-surround-mode 1)
)

(use-package switch-window
;;  :straight t
  :bind 
  ("C-x o" . switch-window)
  ("C-x 1" . switch-window-then-maximize)
  ("C-x 2" . switch-window-then-split-below)
  ("C-x 3" . switch-window-then-split-right)
  ("C-x 0" . switch-window-then-delete)
  ("C-x 4 d" . switch-window-then-dired)
  ("C-x 4 f" . switch-window-then-find-file)
  ("C-x 4 m" . switch-window-then-compose-mail)
  ("C-x 4 r" . switch-window-then-find-file-read-only)
  ("C-x 4 C-f" . switch-window-then-find-file)
  ("C-x 4 C-o" . switch-window-then-display-buffer)
  ("C-x 4 0" . switch-window-then-kill-buffer)
)

(use-package avy
  :bind
    ("C-;" . avy-goto-char)
    ("C-c C-;" . avy-goto-char-2)
    ("M-g w" . avy-goto-word-1)
)


(use-package org
:init
(setq org-log-done t)
(setq org-agenda-files '("~/org"))
:bind
("\C-cl" . org-store-link)
("\C-ca" . org-agenda)
)

(global-set-key (kbd "C-x C-b") 'ibuffer)
```
## A adesso?

Con la stessa sintassi è possibile, quindi, aggiungere una serie virtualmente infinita di applicazioni ed esportare la configurazione in ogni ambiente semplicemente copiando la configurazione.

Grazie per l'attenzione.
