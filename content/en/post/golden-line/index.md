---
title: "The \"evolution line\" across Ed, Vi and Vim" 
date: 2021-03-25 
canonical_url: "https://medium.com/@francopasut/the-golden-line-across-ed-vi-and-vim-fa7b69b2089" 
slug: golden_line 
categories:
 - Editors 
tags:
 - Vim 
image: 
  placement: 3 
  preview_only: true 
  caption: 'Ed code'
---



## A little preface about Ed, Vi and Vim

Have you ever heard of **Ed** and **Vi**? Maybe you've heard of **Vim**.

They are command line text editors.

**Ed** was created in 1969 and it was one of the first components of Unix O.S.

**Vi** dates from 1976 and it was the "*de facto"* standard editor for Unix until the arrival, in 1984, of Emacs.

**Vim** was born in 1991 and it's actually the *fastest editor in the univers*!

If you are using a Unix-based operating system, such as a Linux distribution or macOS, you may have them all available (even if Vi as an option inside Vim) or, at least, installable (in Arch Linux: `pacman -S ed vim`).

There's a *evolution line* amoung them. This is the topic of this brief article.

## Let's write a file with Ed

Ed is an essential line editor: even if the basics are very simple, in 1969 it was a little revolution in writing.

This editor has been built by using some characters as commands to activate specific functions for writing text.

It was not yet a *modal editor* but an editor with specific input commands.

Let's see a simple example (remember that after every command you must click the Return key).

Type `ed` (+ Ret) in your terminal and see what happens: almost nothing but a cursor in a blank line. Where's the editor? You an inside it!

Welcome into your first *buffer* in Ed!

Now let's write inside: press `a` to *append* your text and start writing something. When you have finished, type a dot + Ret.

Now you have a buffer (text stored in temporary environment) but not yet a file.

To transform you buffer in a file you have to save it with the command `w` (write).

So if you decide to name your file as *test.txt* you must press `w test.txt`.

Now you've a local file named *text.txt* created from the previous buffer.

If you want to *change* some line you can prepend the `c` (change) command. At the end you can exit from Ed by pressing `q` (quit).

Here's my first document written with Ed (in Arch Linux environment):

![My first Ed document](ed_document.png)

Below, a small summary of the commands used in our *test.txt* Ed document:

* `a` to *append* some text
* `.` to stop writing
* `w` to save (*write*) the content in a file
* `q` to *quit* from Ed
* `c` to *change* a line

Hey *Vimmers*: do you recognise any Vim commands? What about the keys *a, w, q, c*?

For those who don't know Vim we'll see those commands right below.

## Let's take a look to the traditional Vi

Vim stands for "*Improved Vi*". Vi is the *father* of Vim.

Actually, if you press `vi` on Unix-based systems, Vim will be launched instead.

If you want to take a look to the *traditional Vi* you can, however, launch Vim with the following command: `vim -u NONE filename` and welcome back to 1976. No configuration file, no plugin, only *classic Vi*.

Instead of use letters as command Vi introduced the modal system: Normal mode, Insert mode, Command mode and so on.

Each mode corresponds to a different behaviour of the editor ad is activated by a letter.

But which letter to use to switch modes? The solution was to take inspiration right from Ed.

This means that to switch mode from *normal* to *insert* you press `i`(insert), to *add* text you press `a`(append), to *change* you press `c`(change), to *save* you press `w`(write) and to *exit* you press `q`(quit).

It is reasonable to assume that those who created Vi were inspired by Ed's commands.

## From Vi to Vim

Vim was created from a clone of Vi called Stevie, written for the [Atari ST](https://en.wikipedia.org/wiki/Atari_ST) in 1987, by adding new functions and making it retro-compatible.

In fact the first definition of Vim was "*Vi Imitation*" then changed to "*Vi Improved*".

Vim uses the same command letters as Vi. The same structure already described for Vi also applies to Vim.

Vim has added an infinite number of functions and configurations but the bases are the same as in Vi and, therefore, those derived from the old, but still present, Ed from 1969.

Thank you for your attention.

[Originally published ad Medium](https://medium.com/@francopasut/the-golden-line-across-ed-vi-and-vim-fa7b69b2089)
