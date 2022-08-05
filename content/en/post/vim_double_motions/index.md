---
title: "What is intended by \"line\" in Vim? How to configure a dual alternate mode of movement between lines?"
date: 2022-08-05
slug: vim_double_motions
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: true 
  caption: 'Vim logo'
---

{{% toc %}}



## Why is the Vim line definition "special"?

In Vim a "line" is a set of characters that ends with a return
line. 

Is that all?

It seems obvious, but how does it differ from the definition of "line" in
other writing systems?

Simple: in other environments usually "lines" break at the right margin of the monitor. In Vim they don't.

Nothing changes for short lines, that is, lines that do not exceed the margin
right margin.

It changes, however, in the case of long lines that exceed that edge.

For Vim, therefore, *the line object* can be, in monitor, displayed on multiple visual lines.

## Movement between lines in Vim?

In the default configuration of Vim, vertical moves occur using the keys corresponding to the letters `j` and `k` or with the
arrow keys and take effect on *entire* lines, as defined above.

Vertical moves between lines exceeding the edge of the monitor, however, require the letter `g` before 
`j` and `k` motion operators: thus `gj` or `gk`.

The rule also applies to operations on *text objects*.

So to delete a line fragment from the
cursor point to the right edge of the monitor (as is, just
mind you, it happens with the `C-k` command in Emacs), you use the command
`dg$`, for the reverse operation (from the cursor point to the left edge) you type `dg0`.

## To remap or not to remap? That's the problem

It is very simple to remap the motion keys. A basic reconfiguration
base, to be reported in the *.vimrc* file, might be as follows:

``` vim
map j gj
map k gk
```

This solution, however, does not appeal to me because it compromises the overall movement speed of Vim.

An alternative solution is to remap only the arrow keys.

Obtaining this configuration is very simple and is the subject of the
next paragraph.

## How to remap the arrow keys.



To achieve such a configuration, just enter the following code in the
*.vimrc* configuration file:

    nnoremap <Down> gj
    nnoremap <Up> gk
    vnoremap <Down> gj
    vnoremap <Up> gk
    inoremap <Down> <C-o> gj
    inoremap <Up> <C-o>gk

The code is set to run in three modes: normal,
visual and insertion.

After restarting Vim, vertical arrow keys will be available for
infra-lines  movements as well as the *typical* `jk` keys for the *default* movements of Vim.

Thank you for your attention.
