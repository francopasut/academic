---
title: "Using Visual Studio Code to write scores in LilyPond."
date: 2024-02-11
slug:  vscode-lilypond
categories:
  - Blog
tags:
  - VSCode
  - LilyPond
image:
  placement: 3
  preview_only: false 
  caption: 'LilyPond and Visual Studio Code'
---



Abstract: *Visual Studio Code* is an excellent integrated environment for writing programming codes, but can it also be used as an editor for the LilyPond language dedicated to writing music?

- [1. Previous articles on editors for LilyPond.](#1-previous-articles-on-editors-for-lilypond)
- [2. Original Visual Studio Code or Code - OSS?](#2-original-visual-studio-code-or-code---oss)
- [3. Installation of the VSLilyPond extension.](#3-installation-of-the-vslilypond-extension)
- [4. Using VSCode with the VSLilyPond plugin as an IDE for LilyPond.](#4-using-vscode-with-the-vslilypond-plugin-as-an-ide-for-lilypond)
- [5. Concluding remarks on VSCode as an IDE For LilyPond.](#5-concluding-remarks-on-vscode-as-an-ide-for-lilypond)


## 1. Previous articles on editors for LilyPond.

On the subject of writing musical scores using LilyPond, a markup language equivalent to LaTeX for lyrics, I recall my previous articles devoted to *Emacs* and *Vim*, respectively:
- [Using Emacs to write scores in LilyPond](https://francopasut.netlify.app/post/emacs_write_lilypond/)
- [Using Vim to write scores in LilyPond](https://francopasut.netlify.app/post/vim_write_lilypond/)

In this short article I report a series of tests dedicated to *Visual Studio Code* for the same reason: writing scores via LilyPond.

## 2. Original Visual Studio Code or Code - OSS?

Visual Studio Code, *VSCode* for short, is a cross-platform code editor developed by Microsoft and launched into production since 2015.

It is currently one of the most widely used integrated editors by programmers.

The original version is distributed by Microsoft under a proprietary license.

In addition to the original version, an *open source* version, *Code - OSS* for short, is available in various platforms.


However, *VSCode* and the *open source* version are not entirely overlapping in terms of available extensions.

In particular, as far as this article is concerned, *VSCode* and *Code - OSS* have a notable difference in behavior, as of the date of this article, regarding precisely the extensions for *Lilypond*.


To demonstrate the above, I report the result of searching for extensions with the name *"lilypond "* in *VSCode*:

![lilypond_vscode](vscode_lilypond_extensions.png)

I report, then, the outcome of identical search in *Code - OSS*:

![lilypond_codeoss](code_oss_lilypond_extensions.png)

For clarity I report, one after the other, the version information:

![vscode-release](vscode-relase.png)

![codeoss-release](codeoss-release.png)

It appears, therefore, that there is a significant difference in the number of LilyPond extensions available:

- in *VSCode* eight are available.
- in *Code - OSS* only one is available.

The tests were conducted out, therefore, with Visual Studio Code in the original version in GNU/Linux operating systems, specifically *Arch*, *Fedora* and *Ubuntu*.

In *Arch* and *Fedora* the *VSCode* software can be installed from the *Software Center* via [Flatpak](https://flatpak.org).

In *Ubuntu* it is installed through the *App Center*.

## 3. Installation of the VSLilyPond extension.

In order to have the features dedicated to *LilyPond* I installed the [*VSLilyPond*](https://www.mutopiaproject.org/index.html) extension, which is only available in *VSCode*, i.e., in the original version of the *editor*.

Installing the extension via *Software Center* in Arch and Fedora, in the *Gnome* desktop environment, and *App Center* in Ubuntu was no problem and was automatically completed with  
 ancillary extensions, including *LilyPond PDF Preview*.

However **after** installing the extension in ***Arch Linux*** the *VSLilyPond* plugin **did not recognize the *lilypond* command installed with the package of the same name via *pacman***, the package manager for that operating system.

In order to make the *lilypond* command *visible* in *Arch Linux*, it was necessary to manually download and install the **generic version** of the music notation software from [lilypond.org](https://lilypond.org/download.html), unzip it into a folder in the *home* and change the settings of *VSCode* by manually entering the absolute path in the *home*.

I reproduce the screenshot of the configuration:

![lilypond path](path_to_lilypond.png)

In *Fedora* and in *Ubuntu*, on the other hand, the installation immediately integrated seamlessly into the operating systems, and the *lilypond* command was, in both cases, accomplished without any changes to the *plugin* configuration.

## 4. Using VSCode with the VSLilyPond plugin as an IDE for LilyPond.

The *VSLilyPond* plugin allows you to use *VSCode* as an IDE for LilyPond by taking advantage of the power of *IntelliSense* to write related source code.

The PDF opened, as instructed, with the *LilyPond Pdf Preview* plugin allows direct and reverse synchronization with the source document.

I reproduce below a source in LilyPond side by side with the relative preview displayed with the *plugin* above:

![lilypond and preview](vslilypond-pdf_preview-bach.png)

However, there is an **annoying problem**: the preview, opened by following the directions given on the [VSLilyPond-PDF-preview](https://github.com/lhl2617/VSLilyPond-PDF-preview) extension page, **does not update** in case of changes in the score.

Basically: changes added to the score after opening the preview, **will not be displayed**.

The problem has been dealt with online in [this discussion](https://github.com/lhl2617/VSLilyPond-PDF-preview/issues/115) and, to date, I am not aware that it has been resolved.

Currently, one has to close and reopen the PDF each time one needs to view changes in the score.

You could, of course, use a different *editor*, such as [Zathura](https://pwmt.org/projects/zathura/) but you would lose the bidirectional pointing between source code and PDF document, which I describe below.

*VSLilyPond-PDF-preview* works, however, very well for direct and reverse pointing operations between source and PDF (*Point and Click*).

For **direct pointing from source to PDF** you place the cursor to the left of the note to be viewed, open the *Command Palette* (`Ctrl + Shift + p`) and activate the `LilyPond PDF Preview: Go to PDF location from Cursor` command.

For **reverse PDF location to source** just *click* on any element of the PDF score.

## 5. Concluding remarks on VSCode as an IDE For LilyPond.


*VSCode* with the *VSLilypond* extension and related additional extensions can, therefore, be used as an IDE for LilyPond.

It offers syntax control with color evidence and dedicated language formatting, as well as autocomplete functions, thanks to the *IntelliSense* engine, which is its *strength point* compared to other solutions.

The system is, therefore, overall very attractive.

To date, however, there remains the obstacle of the lack of preview updating.

This is a fairly annoying problem such that I doubt that I have made any configuration error, despite the fact that [I am] not the only one to have encountered it](https://github.com/lhl2617/VSLilyPond-PDF-preview/issues/115).

If anyone knows the solution for the preview I would ask them to let me know.

For that reason I believe that, despite the advanced features of VSCode, I will continue to use, until that little problem is solved, an *editor designed and made exclusively for *LilyPond*, such as 
[Frescobaldi](https://www.frescobaldi.org), or *Vim* or *Emacs*, as explained in the articles mentioned in paragraph #1.

Thank you for your attention.