---
title: 'Emacs, portable self-installing configuration with "use-package" and "straight"'
date: 2023-04-25
slug:  emacs_portable_use-package_straight
categories:
  - Blog
tags:
  - Emacs
image:
  placement: 3
  preview_only: true 
  caption: 'Emacs, use-package and straight'
---

{{% toc %}}

## Emacs, use-package and straight in short.

Emacs uses the GNU ELPA (Emacs Lisp Package Archive) for updating installed packages. 

MELPA (Milkypostman's Emacs Lisp Package Archive) is, on the other hand, an unofficial manager with numerous other packages and must be installed by following the [directions on this page](https://melpa.org/#/getting-started).

The original methods for installing packages are as follows:

- `M-x package-install <RET> package-name <RET>`
- `M-x package-list-packages <RET>` followed by `i` on the desired packages and `x` for the actual installation of the selected packages.

To update packages you open the *package-list* above and press `U` followed by `x`.

All very simple and efficient.

There is only one small problem: **the configuration is not exportable**.

## What is configuration exportability?

Anyone who uses Vim are well aware of the concept of *configuration exportability*: just write the configuration in *.vimrc* and you automatically have the  system update through your *plugin-manager*.

In "native" Emacs it doesn't work that way, but you can achieve a similar result through  *use-package*: a package that simplifies the configuration of other packages.

In summary: instead of having to write the configuration for each package explicitly, you can use the "use-package" syntax to declare the packages you want to use and their configuration. 

The "use-package" method ensures that ELPA or MELPA packages are installed, if they are not already, and allows you to specify their configuration clearly and concisely.

In summary: ELPA and MELPA are the package managers, and "use-package" is a package that simplifies the handling of packages from those managers.

## Beyond exportability: "straight".

At this point we can take one more step: change the package manager to *straight*.

Unlike other package managers, such as "package.el" or "el-get," "straight" uses a directory structure dedicated to packages, rather than installing them in the Emacs system directory.

This makes it easier to manage dependencies and provides greater system stability and allows, via GIT, the installation of packages not found in ELPA or MELPA.

Below is the configuration of Emacs to use "*use-package*" and "*straight*".



## Configuring "straight".

Here is the configuration code to install "straight" in Emacs:

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

## Configuration of "use-package".

The following code includes "use-package" in the configuration:

```elisp
(straight-use-package 'use-package)
```

Lastly: code to "force" *use-package* to use *straight.el* as package manager:

``` elisp
(use-package straight
  :custom
  (straight-use-package-by-default t))
```

The above code ensures that "use-package" is always installed using "straight", **even without the string *straight t***, and enables the use of "use-package" for package configuration.



## Little example with little analysis.

For example, to install the "magit" package, the configuration can be written as follows:

```elisp
(use-package magit
  :bind (("C-x g" . magit-status)))
```

In this example, ""use-package" declares the package "magit". Also, a quick bind is configured for opening "magit-status" with the `C-x g` key combination.

As anticipated, it is not necessary to enter the code `:straight t` having previously "forced" *use-package* to use such a *default* handler.



## List of applications in my configuration file.

After the above configuration part, I add a selection of self-installing applications with the above technique (tested in GNU/Linux distributions Ubuntu, Debian, EndeavourOS):

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

## And now?

Thus, with the same syntax, it is possible to add a virtually infinite set of applications and export the current configuration  in a self-installing way  simply by copying the related code.

Thank you for your attention.
