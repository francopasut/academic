---
title: "Vim: copy text directly to the operating system clipboard"
date: 2022-02-26
slug: vim_direct_clipboard
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: true
  caption: 'Vim'
---



## Cut and copy in Vim: introduction

As an introduction to the topic regarding the Cut, Copy and Paste functions in Vim you can read [a previous article of mine](https://francopasut.netlify.app/post/vim_cut_copy_paste_clipboard/).

The subject of the current article is, instead, a Vim functionality I discovered while reading [this page](https://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard#11489440) and which is closely related to the previous topic.

Vim can directly redirect cut and copy operations performed on texts to the system memory register (*clipboard*).

Therefore, it is not necessary to select the text first,  in order to copy it into the clipboard, as is the experience with other writing systems on digital devices.

In short: you simply *direct* the operation (the same as normally used for the specific command) to the operating system memory (*clipboard*) (or, to be more precise to the `+` register).

This feature saves you time when exchanging data from Vim to other applications in the operating system.

## Vim: examples of direct sending to system memory (*clipboard*) 

A few examples can make it clear.

- First example: to copy into the clipboard of the operating system a complete paragraph just use the command `"+yy`. 
	- Explanation of the example: record (`"`) in the clipboard (`+`) a copy the whole paragraph (`yy`, *yank yank*) in which the cursor is located.
- Another example: given the following string (including the quotes) *"Lorem ipsum dolor sit amet"* I would like to extract and send to the clipboard the part of text inside the quotes.
	- The solution is `"+yi"` with the following explanation: register (`"`) in the system memory (`+`) a copy of the text (`y` *yank*) inside (`i`) the quotes (`"`).
	- The solution, on the other hand, to include quotation marks in the copy is `"+ya"` which means:  record (`"`) in system memory (`+`) a copy of the text (`y` *yank*) around (`a` *around*) the quotation marks (`"`),  including the quotation marks themselves.

Pay attention to the double presence of quotation marks both at the beginning and at the end of the string: they have a totally different function.

The first quotation marks are the "trigger" that activate the memory registers; the second quotation marks, instead, are the delimiter of the area copied in the register (we asked, remember, to copy all the text delimited between two quotation marks).

- Derived example: same string but delimited by two parentheses (round brackets) *(Lorem ipsum dolor sit amet)*.
	- Solution `"+yi)` i.e.: record (`"`) in system memory (`+`) a copy of the text (`y` *yank*) inside (`i`) the round brackets (`)`).
	- Solution for copying parentheses as well `"+ya)` i.e.: register (`"`) in the system memory (`+`) a copy of the text (`y` *yank*) around (`a` *around*) the round brackets (`)`).

Based on the previous examples, it is possible to continue endessly:

- To copy two words to the *clipboard* you use `"+y2w` i.e.:  record (`"`) in the system memory (`+`) a copy of the text (`y` *yank*) of two words (`2w` *two words*). By the way, to copy the same two words to the normal Vim register you would use: `y2w`.
- To copy a text fragment from the cursor position to the next point (if it exists in the sentence, of course): `"+yt.` i.e.: record (`"`) in the system memory (`+`) a copy of the text (`y` *yank*) to (`t`*till*) the point (`.`).
- To copy a *sentence* (in Vim technical terminology) inside a period, you can place the cursor anywhere within the sentence and type `"+yis`, that is: record (`"`) in the clipboard  (`+`) a copy of the text (`y` *yank*) inside (`i`) the sentence (`s` as *sentence*).

And so on...

## Epilogue

In short: all is extremely *logical and efficient*,  in typical "*Vim style*". 

Vim is a continuous challenge for your mind and your memory but the advantage in terms of writing speed and efficiency compensates any learning effort, as well as being a great memory training.

Thank you for your attention.

