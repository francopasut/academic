---
title: "Vim, Markdown, Snippets, UltiSnips: how to get a well-formatted link with a single command"
date: 2021-09-21
slug: vim_markdown_snippet_url
categories:
  - Editors
tags:
  - Vim
  - Markdown
image:
  placement: 3
  preview_only: true 
  caption: 'Vim and Markdown together'
---

{{% toc %}}

## Objective of this post

The objective of this post is to get a  correctly formatted link in Markdown by merging in a single command a fragment of text and an Internet address previously saved in the Vim clipboard.

Of course I assume that everybody that's reading this post knows how to create a *well formatted link* in Markdown, i.e. text in square brackets and URL in round brackets.

Why did I ask myself this question?

Very simple: I noticed that in *"the-other-side-of-the-moon-called-Emacs "* the link construction from a *region* (i. e. a selected text) is immediately available (markdown-mode, `C-c C-l`) whereas in the [honza](https://github.com/honza/vim-snippets/blob/master/snippets/markdown.snippets) list, which is used by Vim [UltiSnips](https://github.com/SirVer/ultisnips) plugin, the same function is not among the presets.

## An interesting solution found on the net

To be honest, the work is not all mine: I found an interesting proposal for a solution on [this page](https://brendandawes.com/blog/ultisnips-auto-markdown-link), which I report below:

```vim
snippet link
[${0:${VISUAL}}](${1:`!v getreg("*") `})
endsnippet
```

Thank you very much to the author of the solution: I would not have been able to develop my personal solution without it.

But I found some details that I decided to develop in my own way.

1. I noticed that  the use of the `"*"` register simply replicated the selected text in both square and round brackets.

2. Another detail was that after the link had been created, the jump to the next field did not work with successive presses of the expansion trigger key (`Tab`, for me).

3. Finally: I needed a shorter launch command that was closer to the standard ones, e.g.  `[l`.


## My solution

1. I considered that when copying a text string to the system clipboard, Vim inserts it into two registers: `"*"` and `"+"`. But when the first register was overwritten by the trigger (`Tab` in my configuration), the previous text fragment still remained on the second register. So I simply changed the register from `"*"` to `"+"`. That modification solved the first point.


2. If you compare the suggested snipped code with the standards snippets you'll notice that the first part is numbered with "0" instead of "1" and the second part is numbered "1" instead of "2".  So I simply renumbered the two parts by inserting the numbers 1 and 2 instead of 0 and 1 and the second point was solved too.

3. The third point was the simplest: we simply changed the name of the activation string from `link` to `[l` (or whatever you want).

In consideration of the above observations, **I have developed my own version of the code**,  shown below:

```vim
[${1:${VISUAL}}](${2:`!v getreg("+")`})
```
It works great!

Obviously the snippet has been loaded into the markdown.snippets file and therefore only works in that mode of our editor.  

## A simple animation

Here is a simple animation illustrating how the code works.

The clip was recorded with Peek.  

Remember that I used the `Tab` key as a trigger and the `[l` combination to launch the replacement.

![Vim Markdown link snippet](vim_markdown_link_snippet.gif "My code is working!")

Thank You for your attention.
