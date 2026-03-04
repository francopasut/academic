---
title: "Nano, the minimalist editor for quick and lightweight editing"
date: 2026-03-03
slug:  nano_editor
categories:
  - Blog
tags:
  - Nano
  - Vim
image:
  placement: 3
  preview_only: false 
  caption: 'Nano and Vim'
canonicalUrl: https://francopasut-en.blogspot.com/2026/03/nano-minimalist-editor-for-quick-and.html
---

- [1. Why Nano?](#1-why-nano)
- [2. Pasting from the clipboard](#2-pasting-from-the-clipboard)
- [3. Moving between lines](#3-moving-between-lines)
- [4. Plugins or no plugins?](#4-plugins-or-no-plugins)
- [5. Setting as the default editor](#5-setting-as-the-default-editor)
- [6. Why NOT Nano?](#6-why-not-nano)


# 1. Why Nano?

Nano is a command line text editor, known for being one of the simplest and most intuitive available in the GNU/Linux world.

It is found in most Linux distributions and is a tool that anyone can use “at first glance.”

At the bottom of the screen is a description of the most commonly used commands, where the symbol `^` represents the Ctrl key and the symbol “M” indicates the Alt key (which was once called Meta and is still called that in Emacs).

For example: `^O` means: press `Ctrl + O` to save the current document.

Another example: `M-U` means: press `Alt + U` to undo  the last command.

The `Ctrl + Enter` key activates the links contained within the documents opened in Nano.

Here is the “main menu” in English:

![img](./nano_menu_en.png)

The wider the terminal window, the more commands are displayed.

The basics are therefore extremely simple to manage, and the learning curve takes just a few minutes.

All you need to do is follow the instructions.

So just launch the editor and read the menu at the bottom of the page.

That's it!

So that's “why Nano.”

# 2. Pasting from the clipboard

A minor issue occurred when I attempted to paste a text fragment copied to the clipboard into Nano.

The `^U` command, indicated in the menu, did not function.

This minor problem stems from the fact that Nano's `^U` (Uncut) command searches for text that has been cut within Nano itself using `^K.`

The system clipboard, on the other hand, has not been cut within Nano but is the one used with `Ctrl+C` and `Ctrl+V` (or right mouse button + copy).

To solve this, use the Terminal shortcut: since Nano runs inside a terminal emulator, you need to use the terminal shortcuts, which usually add Shift to Ctrl + V: so type Ctrl + Shift + V.

Problem solved!

# 3. Moving between lines

Moving between lines is done very simply using the arrow keys
↑ ↓ ← →.

Alternatively, and this is particularly useful for those familiar with Emacs, you can use the following combinations:

-   `Ctrl + P` (P is for *Previous*) moves to the previous line
-   Ctrl + N (N is for Next) to move to the next line.

These are exactly the standard commands of the “old” Emacs, which I am using right now to write this article in Ord Mode.

# 4. Plugins or no plugins?

The Nano editor does not support extensions or plugins, unlike Vim (with its vast ecosystem of plugins via vim-plug or similar) or other advanced editors.

Nano is designed to be lightweight and simple, focusing on minimal configurations rather than an extensible plugin system.

Therefore, Nano only offers these basic options, which are suitable for quick edits but not for advanced workflows.

# 5. Setting as the default editor

To set Nano as the default editor in Linux, you need to use an environment variable called `$EDITOR`.

To make a temporary configuration, type the command `export EDITOR=‘/usr/bin/nano’` in the terminal.

In this case, the configuration will only be active until the terminal is closed.

To make the configuration permanent, you need to edit the *.bashrc* file, perhaps using Nano itself with the command `nano ~/.bashrc` and adding the following line at the bottom: `export EDITOR=‘usr/bin/nano’`.

To save, press `Ctrl+O,` and then `Ctrl+X` to exit.

To apply the change immediately without restarting: `source ~/.bashrc`.

For Debian-based distributions, you can also use the command `sudo update-alternatives --config editor`.

Of course, the process also applies to other editors.

# 6. Why NOT Nano?

So, Nano is great for quick configurations but has some limitations compared to other more complete, but also more demanding, editors.

In particular, it does not have a built-in “Copy to System Clipboard” key like modern editors.

Furthermore, it cannot be extended with plugins or various extensions.

Vim does everything Nano does and much more.

The problem with Vim is that, unlike Nano, you need to know how to use it, and the learning curve is quite steep.

I would like to point out that, as described in [one of  my articles](https://francopasut.netlify.app/post/vim_others/), Vim does not necessarily refer to the Vim application, but also to the various emulation modes illustrated in my article.

Thank you for your attention.
