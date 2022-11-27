---
title: "Vim, VimTex: environments and commands in LaTeX"
date: 2022-11-26
slug:  vim_vimtex_surround
categories:
  - Editors
tags:
  - Vim
  - LaTeX
image:
  placement: 3
  preview_only: false 
  caption: 'Vim and LaTeX'
---

{{% toc %}}

## A smart system for writing

[Vim](https://www.vim.org/) is a great editing tool.

[LaTeX](https://www.latex-project.org/) is a "State of the Art"
typesetting system.

Vim and LaTeX together make a powerful writing system, but an add-on is
needed to relate them.

[VimTex](https://github.com/lervag/vimtex) provides exactly that target by
relating Vim to LaTeX, and it does its job very well.

So Vim and VimTex is a smart system for every kind of writer in LaTeX.

The topic is vast and certainly cannot be contained in a short post like
this one.

In this article, I simply cover functions for managing environments and
commands.

## VimTex Built-in functions for environments and commands

I assume that those who use LaTeX already know the difference between
commands and environments.

VimTeX has some built-in functions for managing commands and
environments, but only to **delete** or **change** them.

The summary table of built-in surround functions is the following:

| Function                       | Keystrokes |
|--------------------------------|:----------:|
| Delete Surrounding Command     |   `dsc`    |
| Delete Surrounding Environment |   `dse`    |
| Change Surrounding Command     |   `csc`    |
| Change Surrounding Environment |   `cse`    |

As you can see, the key combinations match the initials of the related
functions.

For example: D(elete) S(surrounding) C(command) = `dsc` or C(hange)
S(urroundig) E(nvironment) = `cse` and so on.

This makes it easier to remember the sequence of keys.

Then with the built-in surround functions of VimTex you can *delete* or
*change* environment or command tags.

For example:

- if you are inside an *itemize* environment, you can delete the
  `\begin{itemize} ... \end{itemize}` tags surrounding the text by
  pressing the key combination `dse`.
- if you are inside an *itemize* environment, you can change the
  `\begin{itemize} ... \end{itemize}` tags into
  `\begin{enumerate} ... \end{enumerate}` by pressing: `cse enumerate`.
- if you are inside a *textit* command, you can delete the command
  surrounding the text by pressing the key combination `dsc`.
- if you are inside a *textit* command, you can change it to *textbf* by
  pressing `csc textbf`.

But the question is: can you **add** environments or commands with the
VimTex built-in functions?

The answer is no, but…

It's possible to create a custom function that performs this operation.

Two solutions are offered by VimTex programmer itself, Karl Yngve Lervåg
whom I thank for the excellent work, currently at lines 5776 et seq. of
[his vimtex.txt
file](https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt),
chapter **vimtex-faq-surround**.

I find that the first solution fits perfectly with context.

## Create a surround function in VimTex based upon *surround.vim* plugin

For this purpose, you need to install another plugin, ***surround.vim***
and make a small change in your configuration file.

As above described, you must insert a small additional text string in
the vim configuration file, i.e. in `.vimrc` (for Linux/macOS) or
`_vimrc` (for Windows).

The purpose is to extend the *surround.vim* functions by adding the
`ys(object)c` and `ys(object)e` key-combinations for creating commands
and environments in LaTeX.

Here is the code:

    augroup latexSurround
    autocmd!
    autocmd FileType tex call s:latexSurround()
    augroup END

    function! s:latexSurround()
    let b:surround_{char2nr("e")}
    \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
    let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
    endfunction

Now you have the following two new resources in your Vim "swiss-knife"
for LaTeX:

| Function                       |  keystrokes   |
|--------------------------------|:-------------:|
| Create Surrounding Command     | `ys(object)c` |
| Create Surrounding Environment | `ys(object)e` |
|                                |               |

Obviously, you need to insert the usual motion markers or text objects:
for example:

- `yswe center` to surround a word by the *center* environment,
- `yssc textbf` to surround an entire line by the *textbf* command,
- `ysiwe comment` to surround a word with the cursor anywhere within it
  by the *comment* environment
- `ysiwc section` to surround a word with the cursor anywhere within it
  by the *section* command.

Thank You for your attention.
