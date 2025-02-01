---
title: "Emacs, Expand-region and LaTeX"
date: 2021-09-11
slug: emacs_expand_region
categories:
  - Editors
tags:
  - Emacs
image:
  placement: 3
  preview_only: true 
  caption: 'Emacs logo'
---




## Emacs and *text objects*

In composite documents there are often text fragments within well-defined semantic elements: parentheses of various kinds, single or double inverted commas, trailing commas, etc.

In some text editors (Vim, in particular) they're called "*text objects*".

Emacs can handle these text blocks with a package called [Expand-region](https://github.com/magnars/expand-region.el) that "*increases the selected region by semantic units* (original definition from the programmer's GitHub page): parenthesis, brackets, quotes, sentences and other *objects*".
 
To install the package, please read the [programmer's instructions](https://github.com/magnars/expand-region.el#installationw).

Although the package also works in generic text documents, it must be used, for optimal performance,  inside one of the [language modes listed](https://github.com/magnars/expand-region.el#language-support) in the  GitHub page.

LaTeX is one of them.

## Expand-region and LaTeX

Using the package is very simple: you only need to remember some key sequences (*shots*), like the following ones:

| What Keys Sequence | What is the effect? |
|--------------------|---------------------|
| `Ctrl+=`           | Expand Region       |
| `Ctrl+- Ctrl+=`    | Reduce Region       |
| `Ctrl+0 Ctrl+=`    | Reset Region        |

In the next paragraph I will show you some video clips about this useful package.

A little specification: in this article I use the *plus* sign convention: `Ctrl+=` means that you must press the Control key and the key that corresponds to the equal sign together.

In other contexts the same combinations could be indicated with the *minus* sign (example:`Ctrl-=`) but the result is similar.

## Video clips about LaTeX and *expand-region*

In the first clip the cursor starts into a Section with a nested Subsection and I press `Ctrl+=`\` four times to select four progressive objects:

![First clip](emacs-expand-region1.gif)

1. The first shot selects a word
2. The second shot selects the corresponding paragraph without the end-of-line character
3. The third shot selects the paragraph including the end-of-line character
4. The fourth shot selects the whole Section including its Subsection.

In the other  clip I get the same result by pressing the Emacs multiplier: `Ctrl+4 Ctrl+=`. A full sequence of four keys by using only one command!

![Second clip](emacs-expand-region2.gif)

In the third clip  the starting position of the cursor is inside the Subsection and the same sequence determines the selection of the Subsection itself but not the superior Section level.

![Third clip](emacs-expand-region3.gif)

In the following clip you can see two sequences in opposite directions: in the first sequence I type some  *Expand Region* shots to select text until the *Begin/End{document}* level of tags; in the other one I ty[e some *Reduce Region*  shots (`Ctrl+- Ctrl+=`) to return back to the beginning of the process.

![Fourth clip](emacs-expand-region4.gif)

At any time in any sequence you can instantly jump back to the original position of the cursor by pressing `Ctrl+0 Ctrl+=`.

Obviously, each assignment of key combinations to the package functions can be modified and customised at your own discretion.

## Evil: i.e. Vim within Emacs

Emacs can simulate the behaviour of Vim very well using the *Evil* package.

In this emulated environment you can also manage the *text objects* as you were in the original Vim.

You can read [this article](https://francopasut.netlify.app/post/vim_delete_sentences/) about the use of *test objects* to delete paragraphs and sentences.

Thank you for your attention.
