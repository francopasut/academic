---
title: "Using Emacs to write scores in LilyPond"
date: 2022-02-09
slug: emacs_write_lilypond
categories:
  - Editors
tags:
  - Emacs
  - LilyPond
image:
  placement: 3
  preview_only: false
  caption: 'Emacs and LilyPond for music'
---

{{% toc %}}

## About LilyPond

[LilyPond](http://lilypond.org/) is a language for producing elegant musical scores, structurally similar to LaTeX  with which it can integrate to generate documents containing text and music (for the integration between LilyPond and LaTeX you can read to [this article of mine](https://francopasut.netlify.app/post/lilypond-lyluatex/).)

Also in LilyPond, as in LaTeX, you can write the content with various editors.

Very useful, especially to learn the syntax, is the editor called [Frescobaldi](https://www.frescobaldi.org/).

For those who have already learned the syntax, it may be useful, instead,  to use the endless potential of [Emacs](https://www.gnu.org/software/emacs/) and [Vim](https://www.vim.org/),

This article is dedicated to Emacs. A similar article dedicated to Vim is [published here](https://francopasut.netlify.app/post/vim_write_lilypond/).

In the LilyPond user manual, currently at version 2.22, there are some specific indications for [use with Emacs](https://lilypond.org/doc/v2.22/Documentation/usage/text-editor-support.html) (see next paragraph).

Here you will find some additional information about the configuration and interface of Emacs dedicated to LilyPond.

All steps have been tested on two Linux distributions: Ubuntu 21.10 and Arch.

## The official LilyPond User's Guide contains the "Emacs Mode" item

I report the indications taken from the User Manual, at the link above, regarding the use of Emacs in LilyPond:

> Emacs has a `lilypond-mode`, which provides keyword autocompletion, indentation, LilyPond specific parenthesis matching and syntax coloring, handy compile short-cuts and reading LilyPond manuals using Info. If `lilypond-mode` is not installed on your platform, see below.

> An Emacs mode for entering music and running LilyPond is contained in the source archive in the ‘elisp’ directory. Do make install to install it to elispdir. The file `lilypond-init.el` should be placed to *load-path* `/site-start.d/` or appended to your `~/.emacs` or  `~/.emacs.el`.

> As a user, you may want add your source path (e.g. `~/site-lisp/`) to your load-path by appending the following line (as modified) to your `~/.emacs` 

```
(setq load-path (append (list (expand-file-name "~/site-lisp")) load-path)) 
```

## Configuring Emacs for LilyPond

The *Lilypond-mode*, mentioned in the manual, is not a separate package in the [Melpa archive](https://melpa.org/#/) (in which there is currently only the [flycheck-lilypond](https://melpa.org/#/flycheck-lilypond) package dedicated to this language) but is a natively integrated package in Emacs.

However, the functions **must be enabled** in the configuration *file* (usually `~/.emacs`).

In this regard [find a full description on this page](http://www.geoffhorton.com/lilymacs.html).

The lines to be included in the configuration file are as follows:


```
(autoload 'LilyPond-mode "lilypond-mode")
(setq auto-mode-alist
      (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))

(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))
```

With this configuration,  Emacs activates dedicated functions when a document with the *.ly* extension is loaded.

If this does not happen (i.e., if the functions are not activated when opening a file with the *.ly* extension), some additional steps are required.

First of all you need to look for the path to the *lilypond-mode* package using the command `locate lilypond-mode.el` (you may need to install the *mlocate* package using the procedures for different distributions, e.g. `sudo pacman -S mlocate` in Arch) or another similar command.

Once you have found the path (for example: `~/lilypond/usr/share/emacs/site-lisp`), you need to premise the following line, as indicated in the LilyPond manual:

```
(setq load-path (append (list (expand-file-name "~/lilypond/usr/share/emacs/site-lisp")) load-path))
```
In my case I had to integrate the code only in Ubuntu with the following path: `~/lilypond/usr/share/emacs/site-lisp`)


## Using Emacs for LilyPond ##

When you load in Emacs a document with *.ly* extension some very interesting dedicated features are made available.

First, a menu item named explicitly *LilyPond* is created, contrary to Vim, as shown in the video below:

![Emacs Lilypond Menu](video_menu_lilypond.gif)

Also in the *Command* menu you can find the key combination for compiling code written in LilyPond and generating PDF scores, i.e. `C-c C-l` , as documented in the image below:

![Emacs Command Menu](menu_command.png)

Otherwise it's... Emacs with all its writing potential.

To read PDF documents I recommend Zathura, minimalist with *vim-like* commands, or Okular, which has a graphically more extensive structure.

Thank you for your attention.
