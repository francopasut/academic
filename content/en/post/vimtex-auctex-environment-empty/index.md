---
title: "Vim - VimTex, Emacs - AucTeX: create environments in empty fields"
date: 2022-12-10
slug:  vimtex_auctex_ambienti_vuoti
categories:
  - Editors
tags:
  - Vim
  - Emacs
image:
  placement: 3
  preview_only: false 
  caption: 'Vim and Emacs al last together'
---

{{% toc %}}



## Subject of this post

This post is a follow-up to my previous one named "[Vim, VimTex:
environments and commands in
LaTeX](https://francopasut.netlify.app/post/vim_vimtex_surround/)" in
which I described the creation of environment tags in the LaTeX language
through Vim's "surround.vim" plugin.

Specifically, I described how to add environment tags to *words* and
*lines* objects **non-empty**, that is, starting from already existing
text.

If you need a reminder about the concept of "line" in Vim, you can refer
to this article of mine: ["What is intended by "line" in Vim? How to
configure a dual alternate mode of movement between
lines?](https://francopasut.netlify.app/post/vim_double_motions/)"

Here I will add some considerations about tags for environments in LaTeX
by using Vim, but now in **empty objects**, that is, virtual objects
that will be filled with text only after the tags are created.

## Add environment tags in LaTeX to empty objects using Vim

To add environment tags in LaTeX to empty objects in Vim you use the
same command as the real base objects, that is, the "word" and "line"
objects.

In short, you use references to virtual "word" or "line" objects.

Therefore, the possible combinations are (in the operating system
GNU/Linux) as follows:

- `yswe environment-tag` to create an environment around a "virtual word
  object".

- `ysse environment-tag` to create an environment around a "virtual line
  object".


The result between the two versions should be the same, but in fact it
  is not quite so (at least in Linux): with the first command the
  environment tags are attached to each other (with no blank lines
  between them) while with the second command the tags are separated by
  two blank lines.

  Here are two examples with the `center` tag: the first created with `yswe` and the second with `ysse`:

- First example:

  ``` latex
  \begin{center}
  \end{center}
  ```

- Second example:

  ``` latex
  \begin{center}


  \end{center}
  ```

  
In the former case, therefore, you need to add a blank line under the
  first tag before you start writing, while in the latter case you can
  start writing right away.

  Running Vim in MS Windows, as I (necessarily) do for my job, the
  latter combination does not work and the former combination creates a
  blank line between the tags.

## Add environment tags in LaTeX to empty text using Emacs and AucTeX

I cannot, at this point, not mention the parallel world of Emacs with
the AucTeX package dedicated to LaTeX language.

In AucTeX almost everything is integrated within the package.

To a create a new couple of environment tag you must use the command
`C-c C-e` followed the *Environment type*.

The minibuffer proposes a default choice, same of the last one used or
"itemize" for the first time.

In addition, AucTeX already sets up the cursor in the row within the of
the newly created environment

## Vim vs Emacs, or VimTeX vs AucTeX

There is no absolute best solution.

Vim is virtually unbeatable in its natural operatin system, GNU.

The author of VimTeX explicitly stated that the programming was not
designed for MS Windows.

Indeed, under Windows Vim loses some of its effectiveness.

Emacs, on the other hand, functions with the same effectiveness in both
operating systems.

The approach of the AucTeX package, which tends to have all the
functions for LaTeX within it, can be very comfortable.

The choice is yours.

Thank you for your attention.
