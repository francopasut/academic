---
title: "Markdown with Vim, Emacs, Sublime Text 4 and Visual Studio Code"
date: 2024-04-12
slug:  markdown-vim-emacs-sublime-vscode
categories:
  - Blog
tags:
  - Markdown
  - Emacs
  - Vim
  - Sublime Text
  - Visual Studio Code
image:
  placement: 3
  preview_only: false 
  caption: 'Editors for Markdown'
---


<p align="center">
  <i>Abstract:</i>
</p>

How are four *generalist* editors, i.e., designed to be used with a wide range of programming languages and text files, performing when writing documents in Markdown language? This is the subject of this article based on my personal experiences in using Vim, Emacs, Sublime Text 4 and Visual Studio Code both directly and with extensions dedicated  to the above mentioned markup  language.

- [1. Introduction.](#1-introduction)
- [2. Vim and Markdown.](#2-vim-and-markdown)
  - [2.1. Vim without *plugin*.](#21-vim-without-plugin)
  - [2.2. Vim with the *plugin* vim-markdown.](#22-vim-with-the-plugin-vim-markdown)
  - [2.3. Vim with the *plugin* UltiSnips.](#23-vim-with-the-plugin-ultisnips)
  - [2.4. Vim and Markdown preview.](#24-vim-and-markdown-preview)
- [3. Emacs and Markdown.](#3-emacs-and-markdown)
  - [3.1. Emacs without *plugins*.](#31-emacs-without-plugins)
  - [3.2. Emacs with *markdown-mode*.](#32-emacs-with-markdown-mode)
  - [3.3. Emacs and preview in Markdown.](#33-emacs-and-preview-in-markdown)
- [4. Sublime Text 4 and Markdown.](#4-sublime-text-4-and-markdown)
  - [4.1. Sublime Text 4 without *plugin*.](#41-sublime-text-4-without-plugin)
  - [4.2. Sublime Text 4 with the *plugin* "MarkdownEditing".](#42-sublime-text-4-with-the-plugin-markdownediting)
  - [4.3. Sublime Text 4 and preview in Markdown.](#43-sublime-text-4-and-preview-in-markdown)
- [5. Visual Studio Code and Markdown.](#5-visual-studio-code-and-markdown)
  - [5.1. VSCode without *plugin*](#51-vscode-without-plugin)
  - [5.2. VSCode with the *plugin* "Markdown All in One".](#52-vscode-with-the-plugin-markdown-all-in-one)
- [6. In summary.](#6-in-summary)

## 1. Introduction.

Markdown is a simple markup language that is within anyone's reach, compatible with HTML, and allows very elegant, well-formatted text to be written for both web and print publication.

This article, however, is not about the language itself, which, moreover, has been described extensively on the Web, but about how various command-line *editors* allow one to write in Markdown.

A feature of both markdown and programming languages is, in fact, the usability of any plain-text *editor* to write related code.

The article in based on my personal experience with *Vim*, *Emacs*, *Sublime Text* and *Visual Studio Code*, on three main points:

1. Editor behavior without *plugins* or extensions installed.
1. Behavior with Markdown language-specific plugins or extensions.
1. Preview handling.



## 2. Vim and Markdown.

Vim can be a powerful writing tool for Markdown as well, as for any other language, provided the initial hurdle of the learning phase is passed.

### 2.1. Vim without *plugin*.

Without *plugin* the *.md* files are handled as  simple text documents without any dedicated function.


In practice: the "added value" of Vim  is **Vim itself**, with its own original *modal* writing.

The Vim user community has, however, developed some very useful extensions for writing in Markdown, including *"[vim-markdown](https://github.com/preservim/vim-markdown) "* and *"[UltiSnips](https://github.com/SirVer/ultisnips) "*.

### 2.2. Vim with the *plugin* vim-markdown.

The *plugin* [vim-markdown](https://github.com/preservim/vim-markdown) is useful for many functions including: *folding*, *concealing*, moving between section names, TOC (Table Of Contents).

In the [programmer's page](https://github.com/preservim/vim-markdown) the features made available by the *plugin* are analytically described.

I report, in this article, only the part related to TOC:

>:Toc: create a quickfix vertical window navigable table of contents with the headers.
>
>Hit <Enter> on a line to jump to the corresponding line of the markdown file.
>
>:Toch: Same as :Toc but in an horizontal window.
>
>:Toct: Same as :Toc but in a new tab.
>
>:Tocv: Same as :Toc for symmetry with :Toch and :Tocv.
>
>:InsertToc: Insert table of contents at the current line. 

### 2.3. Vim with the *plugin* UltiSnips.

An excellent *plugin* for Vim is [UltiSnips](https://github.com/SirVer/ultisnips). 

Collections of *snippets* dedicated to that *plugin* can be found at [honza/vim-snippets](https://github.com/honza/vim-snippets/tree/master/UltiSnips).

On the subject I refer to my following two articles:

- ["Vim, UltiSnips and Honza vim-snippets: difference and management of snippets and UltiSnips folders"](https://francopasut.netlify.app/post/vim_honza_snippets_ultisnips/)
- ["Vim, Markdown, Snippets, UltiSnips: how to get a well-formatted link with a single command."](https://francopasut.netlify.app/post/vim_markdown_snippet_url/)

The first article is on handling snippets in Vim with the *UnltiSnip*  while the second contains a custom *snippet* that I find very useful for creating hyperlinks when descriptive text is already present in documents.

### 2.4. Vim and Markdown preview. 

Regarding preview handling I recall two others of mine:

- ["Vim and Preview in Markdown"](https://francopasut.netlify.app/post/vim_markdown_preview_plugin/),
- ["Markdown in Firefox"](https://francopasut.netlify.app/post/markdown_firefox/).


## 3. Emacs and Markdown.

Emacs is another highly customizable and extensible editor with a very large base of additional programs.

### 3.1. Emacs without *plugins*.

Opening a ".md" file with Emacs without additional packages activates the "Fundamental" mode, that is, the basic mode of the editor.

In this mode there is no dedicated Markdown functionality and you can use the editor with its native features as if for any text document.


### 3.2. Emacs with *markdown-mode*.

To add specific functionality to documents written in Markdown, the [markdown-mode](https://jblevins.org/projects/markdown-mode/) package must be installed.

I reproduce the screenshot taken from the actual start page of the *plugin*:

![markdown_mode](markdown_mode.png)

The installation string with the Melpa library is as follows: `M-x package-install RET markdown-mode RET `.

For *Straight* with *use-package*, which is my current configuration, the following configuration needs to be entered in *.emacs*:

```elisp
(use-package markdown-mode
  :straight t
  :mode ("README\.md\" . gfm-mode)
  :init (setq markdown-command "markdown"))
```
A remark: on the net you can find the `use-package` configuration associated with the *multimarkdown* command. I preferred to modify that configuration and associate it with the *markdown* command for ease of installation.

The *multimarkdown* command, in fact, must be compiled from source, as indicated on the [dedicated page on GitHub](https://fletcher.github.io/MultiMarkdown-5/installation).


With the *markdown-mode* package, a menu indicating the main operations is also installed in the top bar:

![Emacs Markdown-Mode Menu](emacs_markdown_mode_menu.png)

The menu is very useful for having at your hand the main key combinations of the *plugin*.


By using this package, document structuring management is similar to  *Org-mode*, with  `Tab` key  to expand or collapse single headings  and  `Shift-Tab` to expand or collapse all headings simultaneously.

Also the basic commands for moving between paragraphs are the same as in *Org-mode*:

- `C-c C-n` to jump to the next header of any level.
- `C-c C-p` to jump to the previous header of any level.
- `C-c C-f` to jump to the next header of the same level.
- `C-c C-b` to jump to the previous header of the same level.
- `C-c C-u` to move up a level.

These combinations, like many others, are also given in the menu dedicated to Markdown.

You can also find che analytical description of the commands  at [package page](https://jblevins.org/projects/markdown-mode/).

### 3.3. Emacs and preview in Markdown.

Among the commands added by the *plugin* there is also, as can be seen in the previous image, the *Preview & Export* item to launch both the preview on *browser* (`C-c C-c p`) and the *Live Export* (`C-c C-c l`) on separate Emacs window.

Emacs uses its own configuration for the preview *browser*, independent of the "default" operating system *browser*.  

In the following examples, the customization allows Opera to be launched instead of Firefox.

To change the configuration with Melpa package system, the following snippet in `.emacs` is used:

```elisp
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "opera")
```

With the  `use-package` system   with `straight.el` you can add a fragment to the configuration already given above.

The fragment dedicated to the browser starts from the line containing the `:config` command:


```elisp
(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "markdown")
  :config
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "opera"))
```


## 4. Sublime Text 4 and Markdown.
One of the main new features introduced by *Sublime Text* compared to previous editors is the *Command  Palette*.

Thanks to the *Command  Palette* you only need to remember one key combination, typically `ctrl + shift + p` (Windows, Linux) or `⌘ + ⇧ + p` (on Mac), for all commands.

This makes it much easier to memorize specific combinations, which can also be typed directly to avoid the intermediate step of the Command Palette itself.

### 4.1. Sublime Text 4 without *plugin*.

In basic mode, Sublime Text 4 has a very interesting behavior: even natively, the editor recognizes the language from the extension of the document name and inserts the label "*Markdown*" in the lower right corner, with activation  the `Ctrl-r` key combination to jump between paragraphs.

### 4.2. Sublime Text 4 with the *plugin* "MarkdownEditing".

A great plugin is [Markdown Editing](https://sublimetext-markdown.github.io/MarkdownEditing/).

![markdown_editing](markdown_editing.png).

After the *plugin* is installed, you can activate its functions via the Palette.

It is enough, therefore, to open the *Command Palette* with `ctrl + shift + p` (Windows, Linux) or `⌘ + ⇧ + p` (on Mac) and press the required command, e.g. *fold* or *link*, and run the command that results next to the name *MarkdownEditing*.

![sublime fold palette](sublime_fold_palette.png)

Typing in the *Command Palette* the string *MarkdownEditing:* will give you the full list of commands available with the *plugin*.

### 4.3. Sublime Text 4 and preview in Markdown.

For previewing you can install the "Markdown Preview" plugin, activate the command list with ` ctrl + shift + p`, run the command `Markdown Preview: Preview in browser` and select *markdown*.

![sublime preview](sublime_preview_palette.png)

## 5. Visual Studio Code and Markdown.

Finally: *Visual Studio Code*, hereafter VSCode for short.

It is the most recent*editor* of those mentioned in this article.

VSCode also has the *Command Palette*, already described for Sublime Text, which can be activated with the `Ctrl + Shift + P` command.

### 5.1. VSCode without *plugin*

Even without any additions, VSCode allows you to view the  preview for documents written in Markdown.

The built-in preview must be activated by the combination `Ctr+K V` to open a side-by-side window or `Ctrl+Shift V` to open it a separate *tab*.

A very useful feature: the preview *automatically follows* the position of the cursor in the document and automatically responds to mouse *scrolling*.

Another built-in feature is the lateral Outline  based on the paragraph header at the various levels. It is located in the *Explorer* window on the left side of the screen.

The Outline can also be generated with the `Ctrl+Shift O` command to quickly jump to any paragraph in the document.

In addition, VSCode has some *snippets*  to quickly insert various language elements. The *snippets* are activated with the `Ctrl+Space` command.

Thus, VSCode has a very advanced native set of functions dedicated to the Markdown language.

### 5.2. VSCode with the *plugin* "[Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)".

Of course, there are various *plugins* that extend  of VSCode for Markdown.

My favorite at this time is *Markdown All In One* which allows, among other features, to create an automatic Table Of Contents (TOC) anywhere in the document and to add paragraph numbering.

For TOC creation, simply start at the *Command Palette* and type "*table*" to get commands for both creating and updating the *table of contents*.

For automatic headers numbering you again start from the *Command Palette* by typing the word "numbers", even partially, to get the command to create/update or remove the numbering.

It is also possible to generate an HTML document exported from the Markdown document, by typing  the word "html" in the *Command Palette*.



## 6. In summary.

What program do I use to write in Markdown?

I try to use all of them.

However, I prefer Vim when I want to do some *mental training* and *Visual Studio Code* when I want to write "quietly" by automatically getting a preview view, table of contents and paragraph numbering.

Thank you for your attention.
