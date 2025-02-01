---
title: "Vim: replace text in all opened buffers with only one command"
date: 2022-09-20
slug: vim_substitution_buffers
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: false 
  caption: 'Vim Is Magic'
---



## Vim: do you need to replace some text in all opened buffers? ##

Do You need to perform a substitution between two words or text fragments in all opened buffers?

The first option is to open all the buffers and perform a search with substitution in each of them.

The search and replace string will look like the one below, where `foo` will be the data element to be replaced and `bar` will be the replaced data element.

```vim
%s/foo/bar/g
```



The letter `g` at the end of the string determines the **g**lobal substitution avoiding the acceptance for each replaced element.



## Vim: is it possible to perform the operation with a single command? ##

The one previously illustrated is already a good system, but you can do better: you can replace **all items  in all documents** opened in Vim with a **single command**.

The command is as follows:

```vim
:bufdo %s/foo/bar/g | w
```

Basically, the `bufdo` command extends the operation  to all open buffers. The name itself is mnemonic from: *buffer do*, meaning *to do in every buffer*.

The vertical bar visible at the end of the formula constitutes a *command argument* that launches,  after each buffer has completed the substitutions, the command placed to the right of the bar.

In this situation, the command placed to the right is the letter `w` which writes (**w**rite), i.e., saves, the respective *buffers*.

If the vertical bar were not present, only the last buffer processed would be saved.

Thank you for your attention
