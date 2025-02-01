---
title: "Vim: some modalities to open single or multiple documents"
date: 2021-10-09
slug: vim_several_modalities
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: true 
  caption: 'Vim b/w logo'
---



## Synthesis table

Some Vim commands we'll talk about:

| I write                       | To get                                                                           |
| -------------                 | -------------                                                                    |
| `vim document_name`           | To run Vim and open a document                                                   |
| `gvim document_name`          | To run Graphical Vim and open a document                                         |
| `vim file-1 file-2 file-n`    | To run Vim and open multiple documents                                           |
| `vim -p file-1 file-2 file-n` | To run Vim and open multiple documents in tabs                                   |
| `vim -o file-1 file-2 file-n` | To run Vim and open multiple documents in separate windows with horizontal rows |
| `vim -O file-1 file-2 file-n` | To run Vim and open multiple documents in separate windows with  vertical  rows |
| `sp doc_name`                 | To split a new file while Vim is running                                          |
| `vs doc_name`                 | To vertical split a new file while Vim is running                                 |
| `tabe doc_name`               | To open a new file in a dedicated tab while Vim is running                        |


Vim   offers a lot of options to open or create single or multiple files from the command line or while the application is running.

Here is a brief review, with a few video clips,  of the commands I use most frequently, under no pretence of completeness.

## If Vim is not running: how to open documents from the command line

When you need to run Vim and open a document at the same time, you type the composite command `vim document_name` in a text terminal. 

If you prefer the graphical editor (end, obviously,  you've already installed) you can type `gvim document_name` instead.

To open many files with a single text command, you can add more file names to the string: `vim file-1 file-2 file-n`.

With this command the files  are effectively opened at the same time but only the first of them is displayed in the editing window.

To add new documents once Vim is open you type `:n filename`.

You can see the list of opened, although not displayed, files by typing `:list` or `:ls`.

To split all documents into separate tabs add the `-p` option: `vim -p file-1 file-2 file-n`. To browse the tabs you use the `gt` command in normal mode (watch the following video).


![Open with p option](vim-open-multiple-p.gif)


To split documents into separate windows, use the `-o` (lowercase "o" letter) option, i.e.  `vim -o file-1 file-2 file-n` and, then,  to switch between splitted windows use the `Ctrl-w` command.

![Open with o option](vim-open-multiple-o.gif)


To get the vertical separation you use `-O` (capital "O" letter), i.e. `vim -O file-1 file-2 file-n`) if you want a vertical split.

![Open with O option](vim_open_multiple_O.gif)

If the files named in the commands do not exist, Vim creates empty files for each name.

In every above commands you will get another result: the generation of an *arguments list* with the names of every document opened or created when you launched the *vim* command.

You can see the arguments list by typing `:args`.

The *list of arguments* can  be used for later actions.

## If Vim is already running: the commands "*e, sp, vs, tabe*"

In every beginners' tutorial you'll read that the command to open document is `:e`  followed by a file name or a path to a file.

It's the simplest command to open documents when Vim is already running.

But it's not the only command available while Vim is running.

You can *SPlit* another document above to an already open one with `:sp doc_name`.

The following video clips are recorded by separating the  opening operation of a first document,  named *file-1*,  with the `:e` command, from the addition of a second document, named *file-2*,  with the various commands `sp`, `vs` and `tabe`.

![Split another document](vim-split.gif)

You also can Vertical Split a document next to an existing one with `:vs doc_name`.

![Vertical split](vim-vsplit.gif)

To add, instead,  another other document in a separate *tab* you have to type `:tabe doc_name`.

![Tab another doc](vim-tabe.gif)


## Explore before open

Sometimes I don't know the names of the documents to open.

Vim has a built-in function to list the contents of folders. 

By typing the command `:Ex` (with a capital E) you can navigate and press the Enter key to open the desired document.

## To be continued

This article could continue with other great Vim options on the same subject that I haven't discovered yet.

But for now these are enough.

Thank you for your attention and if you find any error in the article send me a message.
