---
title: "Using Vim to write scores in LilyPond"
date: 2022-01-28
slug: vim_write_lilypond
categories:
  - Editors
tags:
  - Vim
  - LilyPond
image:
  placement: 3
  preview_only: false
  caption: 'Vim and LilyPond for music'
---




## About LilyPond

[LilyPond](http://lilypond.org/) is a language for producing elegant musical scores, structurally similar to LaTeX  with which it can integrate to generate documents containing text and music (for the integration between LilyPond and LaTeX you can read to [this article of mine](https://francopasut.netlify.app/post/lilypond-lyluatex/).)

Also in LilyPond, as in LaTeX, you can write the content with various editors.

Very useful, especially to learn the syntax, is the editor called [Frescobaldi](https://www.frescobaldi.org/).

For those who have already learned the syntax, it may be useful to use the infinite potential of [Emacs](https://www.gnu.org/software/emacs/) and [Vim](https://www.vim.org/),

In the [LilyPond user manual (2.22 release)](https://lilypond.org/doc/v2.22/Documentation/usage/text-editor-support.html), are reported some synthetic indications for **Emacs mode** as well as for **Vim mode**. 

In this article I only add some technical and practical data **with regard to Vim** (I will dedicate a following article to Emacs).

Every step  have been tested on two Linux distributions: Ubuntu 21.10 and Arch.

## "Vim mode" item from the official LilyPond User's Guide

Here are the indications from the User's Manual, currently available at the link above, on the description and configuration of Vim for use as an *editor* in LilyPond:

> For [Vim](http://www.vim.org/), a filetype plugin, indent mode, and syntax-highlighting mode are available to use with LilyPond. To enable all of these features, create (or modify) your ‘$HOME/.vimrc’ to contain these three lines, in order:

```
filetype off
set runtimepath+=/usr/local/share/lilypond/current/vim/
filetype on
syntax on
```

> If LilyPond is not installed in the ‘/usr/local/’ directory, change the path appropriately. This topic is discussed in [Other sources of information](https://lilypond.org/doc/v2.22/Documentation/learning/other-sources-of-information).


## Observations on the configuration of Vim for Lilypond

Vim's functionality is contained in the *compiler*, *ftdetect*, *ftplugin*, *indent*, *syntax*.

Every folder contains a single file named `lilypond.vim`. 

They must be located within the *path* or in the user's *home* folder (in my case */home/franco/lilypond/usr/share/lilypond/current/vim/*) or in a shared library such as */usr/share/vim/vimfiles/* or */usr/share/lilypond/2.22.1/vim/* (obviously the number may change depending on the version of LilyPond you are using).

The script suggested in the LilyPond userg guide   is intended to include the five files in the *path*.

If they are not already in one of the above locations, otherwise no change is needed and Vim is ready to use in *LilyPond*.


Alternatively, you can try ad independent [*plugin*](https://github.com/sersorrel/vim-lilypond/blob/main/ftplugin/lilypond.vim) that allows the same functionality.

## Analysis of the configuration *files*

Here are some brief comments on the Vim configuration *files* for LilyPond:

* */compiler/lilypond.vim*: is responsible for compiling the document written in LilyPond, i.e. transforming the code into a score in PDF format.
* */ftdetect/lilypond.vim*: it is responsible for recognizing the *type* of document by the extension `ly` and attributing it to LilyPond.
* */ftplugin/lilypond.vim*: is the real *plugin* for LilyPond which contains the set function keys, namely:
  * `F4` to save, compile and run the midi version via the *timidity* software (which, of course, has to be installed separately);
  * F5` to save and compile (without running *timidity*);
  * `F6` to view the score in *pdf* with *ghostview*, also to be installed separately if not already present in the system;
  * `F7` to jump to the previous error;
  * `F8` to skip to the next error;
  * `F9` to compile;
  * `F10` to display a menu (generic, not LilyPond specific) on the bottom bar. To navigate the menu: `C-z` or `C-n` to move forward and `C-p` to move backward (combinations clearly derived from the Emacs world where the "n" stands for *next* and the "p" for *previous*), plus the arrow keys;
  * `F12` to *comment* on the selected region (note the *region* term typical of Emacs);
  * `S-F12` to remove the *comment* from the region;
  * C-n` to complete commands in Insert and Replace modes. Again, use the combinations `C-n` to move forward and `C-p` to move backwards in the alternatives window.
* */indent/lilypond.vim*: to indent documents in LilyPond.
* */syntax/lilypond.vim*: contains the list of LilyPond language commands used for completion using `Ctrl-n` described above.



## Considerations for using Vim for LilyPond

The Vim plugin does not offer a dedicated menu for Lilypond. The only list of commands is the one contained in the *ftplugin* file described in the previous paragraph.

The LilyPond language commands must, therefore, already be known. 

This means that using Vim for LilyPond can only be done by those who already have a good knowledge of the language and, of course, of Vim.

The completion with `C-n` is, in any case, very efficient.

The added value, compared to other *editors*, is Vim itself, with its infinite wealth of native and additional features.

As PDF reader for Vim I suggest [Zathura](https://pwmt.org/projects/zathura/): same essential and minimalist setting and same commands.

Thanks for your attention. 
