---
title: "LaTeX with  Sublime Text and LaTeXools."
date: 2024-09-13
slug:  latex-sublime-text
categories:
  - Blog
tags:
  - Sublime Text
  - LaTeX
image:
  placement: 3
  preview_only: false 
  caption: 'Court Acts in LaTeX'
---

<p align="center">
ABSTRACT
</p>

An article illustrating the use of Sublime Text for creating complex documents, with a focus on legal briefs written in LaTeX.

<p align="center">
INDEX
</p>

- [1. This article is about LaTeX and Sublime Text.](#1-this-article-is-about-latex-and-sublime-text)
- [2. The bad news: LaTeXTools is out of date.](#2-the-bad-news-latextools-is-out-of-date)
- [3. Placeholders and Variables.](#3-placeholders-and-variables)
- [4. Multiple cursors.](#4-multiple-cursors)
- [5. Paste lists of documents copied from folders.](#5-paste-lists-of-documents-copied-from-folders)
- [6. Create and use bookmarks.](#6-create-and-use-bookmarks)
- [7. Persistence of open documents.](#7-persistence-of-open-documents)
- [8. Snippet for the creation of Sections.](#8-snippet-for-the-creation-of-sections)
- [9. A useful little “script”.](#9-a-useful-little-script)
- [10. Compilation, viewers and other commands.](#10-compilation-viewers-and-other-commands)
- [11. Conclusion.](#11-conclusion)

## 1. This article is about LaTeX and Sublime Text.

The outstanding typographic quality of LaTeX cannot be doubted.

To manage complex documents in LaTeX, however, one needs to use *editors* that allow one to quickly perform a number of operations including:

- Quickly jumping between the titles of the various levels of sections. 
- Quickly compile variables and other related data by jumping between preset bookmarks,
- Quickly compile source code by getting the PDF.
- Jump directly from source code to the compiled PDF and vice versa.
- Having the documents being edited always ready without wasting time reloading them each time.
- Persistence of open documents when closing the editor.

To edit court documents in LaTeX I have, for about ten years, almost always used *Vim* (for about 75% of my writings) or *Emacs* (for about at 25% of my writings), after a brief initial period with *TeXstudio*.

I recently did some testing with [*Sublime Text*](https://www.sublimetext.com/), versions **3 and 4**.

It did not impress me at first but, after a few months, I have reevaluated it, despite a fundamental problem that I will mention in the next section.

In this article I do not describe the installation and configuration steps, for which ample documentation can be found on the net, but I cover useful solutions for using *Sublime Text* to write documents in LaTeX, with the *plugin* *LaTeXTools*.

## 2. The bad news: LaTeXTools is out of date.

The best known *Sublime Text* *plugin* for LaTeX is *LaTeXTools*.

The bad news is that *LaTeXTools* has not been updated for about **six years**!

The [SublimeText/LaTeXTools page on GitHub](https://github.com/SublimeText/LaTeXTools/) contains the following warning: *Latest revision: v3.15.1 (2018-04-23)*.

The same page states, also, that the latest version available is compatible with *Sublime Text **2 and 3** and not, therefore, with **version 4**.

However, according to my knowledge, the *plugin* still works fine, even in **version 4** of *Sublime Text*.

## 3. Placeholders and Variables.

The first operation to be performed in preparing a court document is to fill in the data of the subjects and the proceedings.

In a “zero” version it is, of course, possible to enter everything simply by hand without any “system.”

In a more advanced version, however, an approach is possible that automatically jumps to the various key points of the document and also allows, as well, to replicate the data anywhere else in the document **without repeating proper names**.

This drastically reduces time and avoids the risk of errors.

A good solution is the use of variables and placeholders to be inserted at “strategic” points in basic templates to be prepared for various acts, e.g., for citations, pleadings, appeals, or, more generally, for any other document.

Regarding variables I recall [this previous article of mine](https://francopasut.netlify.app/post/latex_variables/).

So: variables are *commands* that allow the use of text strings that are replaced, at compile time, by the actual data.

Variables must be created in the “preamble” of documents.

Placeholders, on the other hand, are snippets of text scattered throughout documents that allow you to quickly jump between points to be filled with actual data.

To use placeholders in LaTeX via *Sublime Text* you must, first, think of a text string that cannot be used as the actual content of the document.

An excellent string to use as a “placeholder” is `<++>`.

If placeholders were associated with variables they should, of course, also be placed in the preamble, as in the following example:

```tex
\newcommand{\name}{<++>}
\newcommand{\reg}{<++>}
\newcommand{\trib}{<++>}
\newcommand{\where}{<++>}
```

The creation of variables allows the actual data to be replicated within the document, as discussed in my article above.

If, on the other hand, the placeholders were not associated with variables they would have to be “scattered” throughout the document, that is, between the `\begin{document}` and `\end{document}` tags at the places where you want to “jump” with the cursor to insert other the actual data.

Filling is done by “jumping” between the various placeholders by inserting, only the first time, the string `<++>` in the *Search* field that can be activated with `Ctrl-f`, enhancing the first placeholder with the actual data, also by “copy and paste,” repeating the operation with `F3` (`Shift-F3`, in case it is necessary to go backwards), jumping, as you go, to all the placeholders “pre-positioned” in the document.

In this way the initial compilation is very fast and the proper name replication is done using NOT the actual data but variables **avoiding the risk of typing error**.

## 4. Multiple cursors.

The *multiple cursors* feature was introduced by Sublime Text 2 in 2011 and allows multiple cursors to be placed in the text to edit multiple document locations simultaneously.

The typical example is witness or document lists, which in LaTeX are placed in the `\begin{enumerate} ... \end{enumerate}` or `\begin{itemize} ... \end{itemize}` and which, therefore, must be completed by inserting the `\item` tag at the beginning of each list item.

Think about having to insert the text string "*\\item*" into a list containing tens or hundreds of elements: the “lost” time could be very high, as well as the risk of making typing errors resulting in errors reported during the compilation phase and further wasted time searching for blocking errors!

Multiple cursors make it possible to override any “wasted time” regardless of the number of items in the lists and eliminate the risk of errors.

For this specific topic I wrote a dedicated article that you can find at this address: [Vim, Sublime Text, Visual Studio Code and multiple cursors](https://francopasut.netlify.app/post/vim_sublime_vsc_multicursors/).

In summary, regarding *Sublime Text*:

- `Ctrl+Mouse_Click` for creating multiple cursors at pointer locations.
- `Ctrl+shift+l` to add a multiple cursor in each row of a highlighted area.
- `Ctrl+Shift+Space` to expand a region within a pair of parentheses.
- `Ctrl+d` to replicate the expansion, useful for quickly changing environment tags (e.g., to switch from `enumerate` to `itemize`).
- `Home` **pressed twice** to return all cursors to the beginning of rows with carriage returns.
- `End` **pressed twice** to return all cursors to the end of rows with carriage returns.
- `Esc` **pressed once or twice** or *click* with the *mouse* anywhere in the document without `Ctrl` to exit multiple mode.

A similar built-in system exists in Vim, `Ctrl+v`, `I`, write, `Esc`, and it is possible to install a *plugin* that provides a very similar solution to the one described above.

## 5. Paste lists of documents copied from folders.

A very frequent operation of judicial acts is to import lists of documents stored within a folder to create the list of documents produced at the bottom of the act.

For example: we have a set of documents (doc 01, doc 02, doc ..) in a folder and we need to import the list of documents inside the deed.

In Vim there is a built-in function: assuming that the list to be imported is in *Document*, the Vim command is as follows `:r! ls Document`.

In *Sublime Text* there is no such command, but the same result can be achieved using two simple solutions.

A first solution is through the Linux terminal, (Prompt or Windows Power Shell).

You proceed as follows: you open a terminal,  navigate to the desired folder and use the command `ls -1 > list.txt` in Linux or `dir / > list.txt` in Windows to generate the list of files.

You can also drag the destination folder from File Explorer to get the full path in the *prompt* without having to type it in manually.

The `-1` and `/b` options eliminate, in Linux and Windows, paths and thus save time after importing lists.

The `>` option redirects the output you generate the *file* with the list.

Now just open the *file* with *Sublime Text*, copy and paste the contents into the document being processed.

It works, but it is not the fastest solution.

The better solution, in my opinion, is to take advantage of a somewhat “hidden” feature of Windows and Linux operating systems (I have not tested on macOS).

From Windows 7 and on, it is possible to copy *file* lists into a folder instead of the *files* themselves.

To save **not** the *files* but the **path** of the *files*, including one's own name, one simply needs to select them by holding down the *Shift*-Shift key and, in the right-click context menu of the *mouse* choose “*Copy as path*.”

The path can, of course, be pasted into any document being processed, even if using *editing* systems other than *Sublime Text* or *Vim*.

In GNU/Linux, however, simply select documents from the *File Manager*, copy the list from the right-click context menu of the *mouse*, and paste it into the document.

Basically, in Linux you do not need to hold down the *Shift-Shift key*.

After pasting the path into an open document simply delete the excess fragments, perhaps using the “multiple cursors” function described above, and **the list is ready**!

## 6. Create and use bookmarks.

Sometimes it is necessary to fix a specific point in an open document in order to return quickly to that point after performing operations elsewhere.

This is the role of *bookmarks*, not to be confused with the *placeholders* mentioned above.

Again, *Sublime Text* is very efficient: just fix the *bookmark* by pressing the combination `Ctrl+f2` and then return to that point with `f2` or `Shift+f2` (if bookmarking was backwards from the current point).

To delete the bookmark you still press `Ctrl+f2` when the cursor is placed exactly over the bookmark (that is, after reaching the bookmark with `f2`.

If only one bookmark were present in the document, then pressing the `f2` function key would bring it exactly to that point.

If, on the other hand, multiple bookmarks were present, then the command `f2` (forward) or `Ctrl+f2` (backward) would cyclically jump from bookmark to bookmark until reaching the desired one.

## 7. Persistence of open documents.

A feature that was innovative at the time and later became *standard* on other editors, such as Visual Studio Code, is the persistence of open pages **even without the need to save** when closing the editor.

In other words, it is enough to leave documents open when you close *Sublime Text* to find them ready to type when you restart the editor.

This allows you to open various drafts of documents, work progressively through open documents, navigating between them with the *go to everywhere* command, i.e. `Ctrl+p` of *Sublime Text* and find everything again at the point where you left it **without the need to save on exit**.

For those familiar with Vim, a similar function is that of saving with `:mksession` and restoring with `:source`.

In the case of *Sublime Text*, however, no additional operations need to be performed other than simply closing and reopening the editor.

## 8. Snippet for the creation of Sections.

With the *LateXTools* plugin, it is also available the guided creation of Sections and other subordinate layers.

For activation of the relevant *snippets* you just enter the first three or four letters of the *tags* without the leading slash.

Then you enter the text string `sec` (without initial slash) and press the *Tab* key to have the completion with the sanction title and also the label (optional).

For subsections you use the string `sub` and for sub-subsections `subs`.

## 9. A useful little “script”.

I found a *script* on the net that allows you to enhance cursor movement between paragraphs separated by blank lines.

It basically extends the movements by emulating the operation of the `{` and `}` commands of *Vim* and `Alt+a` and `Alt+e` of *Emacs*.

It also works to select the relevant regions of text.

The *script* can be found described in [this page](https://superuser.com/questions/1407180/in-sublime-text-how-can-i-jump-and-select-to-the-next-empty-line-between-paragr).

It greatly reduces the time it takes to move between paragraphs separated by blank lines, which is the standard for LaTeX to wrap.

## 10. Compilation, viewers and other commands.

We have now reached the final stage, which is to compile the document in LaTeX and preview it on a PDF reader connected to the editor.

Before launching the compilation we need to check that the *Build System*, in the *Tools* menu, is on “Automatic” or on “LaTeX”, as per the following image:

![build_system](sublime-text-build-system.png)

Compilation is very simple: just press the key combination `Ctrl+b`.

Immediately after compilation, unless errors occur, the PDF viewer connected to the editor is launched.

For configuration and use of the various PDF viewers supported by *Sublime Text* I refer to [LaTeXTool's dedicated page](https://github.com/SublimeText/LaTeXTools/blob/master/docs/available-viewers.md).

Under Windows the ideal viewer is Sumatra. Under Linux, excluding Zathura which lives in `symbiosis` with Vim, I recommend Okular.

To delete accessory files: `Ctrl+l backspace`.

Finally: for more LaTeXTools commands I refer to [this page](https://latextools.readthedocs.io/en/latest/keybindings/).

## 11. Conclusion.

These are some small tips that can help you write documents in LaTeX with Sublime Text.

There are many more but these are the basics.

Therefore:  *Sublime Text* instead of *Vim* for writing documents in LaTeX?

*Vim* is like Ferrari: simply unbeatable.

*Sublime Text* is, in any case, a very good solution for writing documents in LaTeX, with a small problem related to updating some *plug-ins*, including just the one needed to write in LaTeX, as described in this article.

It should also be considered that *Sublime Text*, unlike *Vim*, *Visual Studio Code* and *Emacs*, is not free and, therefore, in case of frequent use requires payment of the license.

I wrote this article with Vim and Visual Studio Code that are my favourite editors for the Markdown language. 

Thank you for your attention.
