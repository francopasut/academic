---
title: "Animated GIFs about basic regex in Vim and Emacs"
date: 2021-07-13
canonical_url: "https://francopasut.github.io/editors/vim-easymotion/"
slug: regex_vim_emacs
categories:
  - Editors
tags:
  - Vim
  - Emacs
  - Regexp
image:
  placement: 3
  caption: 'Vim and Emacs together'
---

{{% toc %}}

## A non-preface about regex

In my little experience as a LaTeX writer using Vim and Emacs, I sometimes use the extraordinary efficiency of *regex*, also known as *regexp* or "*Regular Expressions*".

Vim and Emacs, provide built-in support for *regex.*

I'll show you in the following clips some elementary uses of r*egex* in both editors.

The software developer community will smile, but the following animated GIFs are intended for writers, not computer programmers.

## Vim and regex

You can use *regex* in Vim by invoking the command line followed by a pattern like this one:

```vim 
:(range)s/something/something_else/options
```

Here's a GIF with a regex basic pattern: in the following example in which you can see a phrase containing two words *dolor*. I'm going to replace both *dolor* in *gaudium.*

![Clip 1](regex_vim_emacs_1.gif)

It worked, but only the first *dolor* was changed into *gaudium*!

To obtain the modification of all occurrences, add the *g* option at the end:

![Clip 2](regex_vim_emacs_2.gif)

Now every *dolor* is changed into *gaudium*: target reached.

## Emacs and regex(p)

Emacs can emulate Vim flavor by using the *Evil-mode*.

In this scenario also *regex* searches are similar to those of original Vim.

In the real Emacs, however, you can invoke *regex* by typing `M-x`{.markup--code .markup--p-code} followed by the function`replace-regex`{.markup--code .markup--p-code}.

The *regex* pattern for Emacs, in the same previous situation, is the following one:

`M-x replace-regexp RET dolor RET gaudium RET`{.markup--code .markup--p-code}

In the GIF below you can see a running example of the same regex as above seen with Vim:

![Clip 3](regex_vim_emacs_3.gif)

In Emacs, all the occurrences are changed by default.

Soon, perhaps, other GIFs animations (GIFs recorded by *Peek* running under *Arch Linux*).

[Originally published at Medium](https://medium.com/@francopasut/animated-gifs-about-basic-regex-in-vim-and-emacs-ecdac82499bf)
