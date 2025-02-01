---
title: "Vim: Cut, Copy and Paste to and from the System Clipboard"
date: 2021-09-01
canonical_url: "https://francopasut-en.blogspot.com/2019/08/vim-cut-copy-and-paste-to-and-from.html"
slug: vim_cut_copy_paste_clipboard
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: true 
  caption: 'Vim logo'
---



## Cut, Copy and Paste using the computer keyboard 

Everybody knows how to use the keyboard combinations `Ctrl-c`, `Ctrl-x` and `Ctrl-v` in Windows and Linux (or `Cmd-c`, `Cmd-x` and `Cmd-v` in macOS) to copy, cut and paste text across applications.

Many think that those combinations are universal and work with any application. But it's not true.

Vim uses another system to exchange information with other applications.

For example, in Vim under GNU/Linux, the key combination `Ctrl-v` corresponds to the *visual block* function and does not affect the pasting text.

I wrote this article to remind me, as a non-programmer, the key combinations to be used in the Vim world to share text with other applications.

## Vim and the *clipboard* 

Vim uses an original resource to exchange text with other applications.

If you press the Vim (or gVim, the graphic version of Vim) `:reg` command, you can notice a list of items beginning with a *double quotation mark* (") followed by a *symbol*, a *letter* or a *number*: these are the *registers*.

Vim uses a specific register to interact with the *system clipboard* and, consequently, with other applications.

This specific clipboard register is identified with the mathematical *plus symbol* (`+`).

There's also another symbol for the clipboard: the asterisk (`*`) that produces almost the same results of the *plus* symbol but in GNU/Linux OS it saves information specifically for the middle mouse button.

##  From Vim to the Clipboard 

If you need to transfer information from Vim to other applications you must use the key combination `​"+y` to **copy** the text and `​"+x` to **cut** it from the original document.

As shown in the official menu in gVim:

![cutocopyconverted.png](cutocopyconverted.png "Cut vs Copy")



Pay attention to the following table:

| Key  | What is?                        |
| ---- | ----------                     |
| `"`   | The registers symbol            |
| `+`   | The *clipboard register* symbol |
| `x`    | The letter to **cut** the text  |
| `y`    | The letter to **copy** the text |

Then, to complete the operation,  you have to press three keys in sequence:

1.  `"`
2.  `+`
3.  `x` *or* `y`

In both cases, the *cut* or *copied* text is sent also to the clipboard and can be pasted outside Vim using the usual `Ctrl-v` command, in Windows and Linux, or `Cmd-v` in macOS.

##  From the Clipboard to Vim 

The reverse operation is also quite simple. 

You can transfer your text copied from the clipboard using the string `"+gP`.

![pastevimconverted](pastevimconverted.png "Paste text string")


Let's analyze every single component of the string:

- "`P`" means *paste **before** the current position*.
- The "`g`" key puts the cursor after the pasted text.

Then "`gP`" command produces the following result: *Paste before the current position, placing the cursor after the pasted text.*

If you don't use `g` the cursor will be placed on the last letter of the pasted text and you'll *waste time* to advance the cursor by one character.

In *Vim philosophy* everything must be optimized, also the single movements of the cursor!

##  Some key shortcuts in gVim 

In some cases, it's also possible to use key shortcuts in gVim.

They mainly work in MS Windows but some of them work also in several Linux distributions. 

I can directly confirm the working in Mint, Fedora, Ubuntu, Antergos for the *pasting* shortcut (see list below) but not the same for the others.

The following is the list of shortcuts:

| Shortcut         | What happens?                                        |
| ---------------- | -----------------------------------------------      |
| `Shift+Delete`   | Cut text and copy it in the clipboard                |
| `Ctrl+Insert`    | Copy text in the clipboard                           |
| `Shift+Insert`   | Paste text from the clipboard into a document |

Thank You for Your attention.

