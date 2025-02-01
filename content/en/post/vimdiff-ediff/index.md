---
title: "Notes on resolving differences between two documents with the built-in resources of Vim and Emacs"
date: 2023-05-07
slug:  vimdiff-ediff
categories:
  - Blog
tags:
  - Emacs
  - Vim
image:
  placement: 3
  preview_only: true 
  caption: 'Vim and Emacs'
---





## What are we talking about?

In this article, I report my practical experience on how to use the built-in resources of Vim and Emacs to resolve and undo differences between two documents.

In fact, I've occasionally  updated two documents in such a "messy" way that I could no longer remember which updates to keep on one and the other.

Both Vim and Emacs offer very simple and effective built-in tools for checking and resolving such differences.

All operations were performed in a GNU/Linux environment, specifically Ubuntu and Arch.

I do not mention any additional plugins in the article, although they exist, and I do not address the issue of version control with `git`.

There is no "merit opinion" on the two writing systems, just a concise exposition of their respective methods.

## The test documents. ##

For the operations, I used two very simple documents with partially different content between them.


- *test1.txt*

> Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
>  <br>
> Aenean massa.
>  <br>
> Cum sociis natoque penatibus et

- *test2.txt*

> Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
>  <br>
> Aenean commodo ligula eget dolor.
>  <br>
> Aenean massa.

## Vim and the `vimdiff` function.

The `vimdiff` command is a utility that is installed with text editor *Vim*.

The easiest way to launch the utility is from the command line.

Using the names of the two documents above, the command is as follows: `$ vimdiff test1.txt test2.txt`.

The function, however, can also be run starting from an already open document (suppose *test1.txt*) with one of the following commands:

- `:diffsplit test2.txt` to get the horizontal split.
- `:vert diffsplit test2.txt` to have the vertical split.

The differences between the documents being compared are highlighted in different colors so that it is easy to identify the elements that do not match, as in the following image:

![vim vimdiff](vim_vimdiff-frame.png)

You can then use Vim's commands to move between different sections of the file, merge the different versions, or decide which version to keep.

The essential commands are as follows:

- `dp` aka `diffput` to bring back the version the cursor is in from the other document being compared.
- `do` aka `diffget`: ("or" is the mnemonic for "*obtain*") to carry over the version of the other document being compared to the one in which the cursor is located.
- `]c` to jump to the next point of difference.
- `[c` to jump to the previous point of difference.


## The "vimdiff" interface.

The command-line version of *Vim* does not offer any visual, "menu" type help on the commands to use.

So one either has to know the commands by heart or use Vim's built-in help functions with `:help vimdiff`.

In contrast, *GVim*, i.e., the graphical mode version of Vim, offers concise menu support consisting of:

1. Menu item "*File*" - sub-item "*Split Diff With...*" to enable comparison between an already loaded document and one to be loaded.
2. Menu item "*Tools*", subitem "*Diff*", options "*Update*" / "*Get Block*" (equivalent to `do`) / "*Put Block*", (equivalent to `dp`).

Below are the two screens described above:

![gvim file diff](gvim_file_diff-frame.png)

![gvim tools diff](gvim_tools_diff-frame.png)

## Emacs and the "ediff" function.

Emacs, to compare and merge two or more documents, has a built-in function called *ediff*.

As with *vimdiff*, differences between files are highlighted in different colors to make it easier to identify items that do not match.

Also *ediff* offers a number of conflict management tools, such as the ability to merge the different versions, decide which version to keep, or even directly edit the file contents.

## How do you use *ediff*? 

Basically:

- I open Emacs
- I launch `ediff` with `M-x ediff`.
- I follow the directions by loading *test1.txt* as document *A* and *test2.txt* as document *B*
- The following screen appears:

![emacs ediff test](emacs_ediff_test-frame.png)

At this point in the "Ediff Panel" (see next section for further explanation of the Panel) I press:
- `n` or `p` to jump to the next ("next") or previous ("previous") difference
- `a` to apply the line from document A to document B making them, therefore, equal or
- `b` to apply the line from document B to document A making them, therefore, equal.

And so on until the comparison is complete.

Having reached this point, simply save the documents and close.


## The "ediff" Interface.

*Ediff* is based on the `diff` function found in Unix and derived operating systems.

In the various GNU/Linux distributions and in macOS, the function is normally preinstalled and, therefore, poses no problem of use.

In MS Windows, however, this function is not present and it is, therefore, necessary to provide it with separate installation (not the subject of this article).

The *help* function of *ediff*, which appears immediately after loading the two documents to be compared, also serves as a real *control panel* ("Ediff Control Panel") from which operations are performed on the documents being compared.

It is necessary to use a window external to the compared documents since Emacs is not modal, like Vim, and, therefore, every keystroke directly in the documents results in their modification.

The *help* can be opened or minimized with the `?` key.

Here are the "Control Panel" and "Menu" screens in Emacs:

![ediff help](ediff-help-frame.png)

![ediff menu](ediff-menu-frame.png)

## Summary table.

Here is a simple summary table of essential commands for the two writing systems:

<style>
table {
    border-collapse: collapse;
}
table, th, td {
   border: 1px solid black;
}
blockquote {
    border-left: solid blue;
    padding-left: 10px;
}
</style>

| Operation | Vim | Emacs |
| ------------- | :-------------: | :-------: |
| Jump to next | `]c` | `n` |
| Skip to previous | `]c` | `p` |
| Export changes from this document to the other | `dp` | `a`|
| Import changes from the other document to this one | `dg` | `b` | 


Thank you for your attention
