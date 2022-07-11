---
title: "Jumping between matching pairs of characters in Vim and Emacs"
date: 2022-07-12
slug: jump_vim_emacs
categories:
  - Editors
tags:
  - Vim
  - Emacs
image:
  placement: 3
  preview_only: true 
  caption: 'Vim and Emacs together'
---

{{% toc %}}

It is very useful to jump through corresponding pairs of characters, such as parentheses or quotation marks or even tags, when coding or writing in a markup language such as HTML, Markdown or LaTeX.

Both Vim and Emacs have dedicated commands for this purpose.

## To jump between matching pairs using [Vim](https://www.vim.org/)

Vim uses a "single character" command to jump to the nearest pairs of corresponding characters and to place the cursor into the closing one: `%`.


For instance: let's assume that the cursor is placed at the beginning of the following sentence:

> If you want to write your own use the contents of [syntax-ppss (point)]

When you press `%` your cursor jumps to the corresponding closing square bracket.

If you press `%` another time the cursor jumps back to the opening corresponding square bracket.

If you place the cursor everywhere inside the square brackets and press `%` it jumps to the closing round bracket.

Naturally, if you press another time the `%` command the cursor jumps to the opening corresponding round bracket.

The same behavior applies for environment tags in some markup languages, such the `quote` one in LaTeX with [VimTeX](https://github.com/lervag/vimtex) plugin (about the "quote" environment in LaTeX you can read [this article of mine](https://francopasut-en.blogspot.com/2016/07/quote-quotation-quoting-in-latex.html)):

```
\begin{quote}
Some text inside `quote` environment.
\end{quote}
```

If you randomly place the cursor inside the `\begin{quote}` tag and press `%` the cursor jumps to the last character of the `\end{quote}` tag (i.e. the closing corresponding one).

If you press another time the `%` or press it randomly inside the `\end{quote}` tag, the cursor jumps on the first character of the `\begin{quote}` tag.

Therefore, Vim, uses a single character for various corresponding pairs.

## To jump between matching pairs using [GNU/Emacs](https://www.gnu.org/software/emacs/)

GNU/Emacs uses a slighly different solution,

Let's assume that you've the cursor pointed in the beginning of the same previous sentence:

> If you want to write your own use the contents of [syntax-ppss (point)]

With the cursor on the opening square bracket, you have to press `C-M-f` (which corresponds to the `forward-sexp` function) to jump to the closing corresponding square bracket.

If you, now, press `C-M-b` (which corresponds to the function `backward-sexp `) the cursor jumps back the corresponding opening square bracket.

The same happens with round brackets and other pairing characters.

You have, however, place the cursor just above the corresponding opening or closing character.

So: the standard keyboard shortcuts for jumping through corresponding pairs in Emacs are: `C-M-f` forward and `C-M-b` backward.

But if you use [AUCTeX](https://www.gnu.org/software/auctex/), a *Sophisticated document creation* for LaTeX documents, and you need to move between corresponding environment tags, you need to know two other shortcuts.

The following sentence is from pag. 32 of the actual AUCTeX.pdf handbook:

> AUCTEX offers keyboard shortcuts for moving point to the beginning and to the end of the current environment.

At page n. 28 you'll find the shortcuts:

> [Command] LaTeX-find-matching-begin (C-M-a) Move point to the ‘\\begin’ of the current environment.

> [Command] LaTeX-find-matching-end (C-M-e) Move point to the ‘\\end’ of the current environment.

But pay attention: you must place the cursor **inside the environment tags** to make the AucTeX shortcuts work. If the cursor is out of the tags or even on the backslash of the opening tag, the command `C-M-e` will give an unexpected result.

Thus, in AucTeX you can use the standard shortcuts for parentheses and other coupling characters and other shortcuts for additional environments.


## Summary for Vim and Emacs

We can report, therefore, a brief summary:

* **Vim** uses, normally, only one command for every opening or closing pairing elements or tags.
* **GNU/Emacs** uses two different standard shortcuts for opening and closing corresponding characters, as well as other shortcuts depending on the working environment.

Than you for your attention.
