---
title: "From Text Objects in Vim to Text Blocks in Gutenberg for WordPress."
date: 2023-11-27
slug:  vim-vs-gutenberg
categories:
  - Blog
tags:
  - Vim
  - WordPress
  - Gutenberg
image:
  placement: 3
  preview_only: false 
  caption: 'Vim vs WordPress'
---

{{% toc %}}
## About *Vim* and *Gutenberg*.

Vim is a command-line *editor*. Gutenberg for WordPress is a visual editor.

Vim was created in 1987, as an evolution from the earlier Vi. Gutenberg has become the default editor for WordPress since version 5.0 of the CMS, released on **November 27, 2018**.

They are chronologically and structurally very distant writing tools.

But despite the differences, there are also some similarities.

Vim allows writing by treating text as an "object." Gutenberg allows writing by treating text as a "block."

Vim's "text objects" can be edited or moved "in bulk." The same happens, of course, with Gutenberg's "text blocks."

The principle of "block writing" has origins far back in time: Vim is the first example. Gutenberg the last.

## Examples of "text objects" in Vim.

*Text objects* can be words, sentences, paragraphs, or other combinations (in LaTeX, for example, "environments" and "commands" are also text objects).

I covered the topic of `text objects` in [this article](https://francopasut.netlify.app/post/vim_delete_sentences/), to which I refer for details.

The `ip` construct, in particular, activates text within a paragraph. The actual operations are performed by premising the text objects with specific commands.

Adding the `d` command deletes all characters in the text object. With the command `c` they are both deleted and immediately put back into writing mode. With the command `y` the text is simply copied.

Without further elaborating on the details of Vim syntax, for which I refer to the above article, I give as an example the complete command `dip` which deletes all content within the *text object* "paragraph."

In each case the *text object*, which in the previous case was represented by the "paragraph", is handled as an autonomous block distinct from the rest of the document context and regardless of its length.

Another example: in Vim you use the copy command (`yy`) to copy a line of text and paste it to another location (`p`).

In Vim, you can also use the `ddp` command to swap the position of two lines.


## Examples of text blocks in Gutenberg.

Gutenberg is based on "block writing" which is the "modern" version of Vim's text objects.

Below is an example of a delete operation applied to a Gutenberg "text block" (reference should be made to the pointer at the bottom of the menu item column):

![delete block](delete_block.png)

Another example: in Gutenberg you can copy the entire block of text with the ***Copy block*** command you find  in the previous image. 

Swapping blocks positions, in Gutenberg, is done by dragging and dropping blocks of text.


## Vim and Gutenberg together.

Both text objects in Vim and text block writing with Gutenberg in WordPress, therefore, offer a structured way to manipulate text and organize it into desired formats.




Both Vim and Gutenberg rely on a modular structure to organize text.

In Vim, you can use specific commands to manipulate blocks of text, such as moving, copying or deleting lines.

In Gutenberg, on the other hand, you can use stand-alone text blocks to create the structure of content, such as paragraphs, headings, images or quotations.


The use of text blocks in Gutenberg presents itself, then, as a "visual" evolution (or involution, depending on your point of view) of Vim's text objects.



## In conclusion.

The similarities between text objects in Vim and text block writing with Gutenberg in WordPress are remarkable, and the above examples are only a summary.

It seems, therefore, that there is a "red line" connecting the "legendary" Vim with the "modern" Gutenberg.

Thank you for your attention.
