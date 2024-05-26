---
title: "Extract a list of files from a folder and paste it into a document, in MS Windows, GNU/Linux and macOS."
date: 2024-05-26
slug:  dos_copy_list
categories:
  - Blog
tags:
  - Windows
  - Linux
  - macOS
image:
  placement: 3
  preview_only: false 
  caption: 'DOS and Linux'
---


<p align="center">
ABSTRACT
</p>

Article on how to copy a list of files in a folder and paste the list into an open document. The operation is performed only with resources internal to the tested operating systems, which are MS Windows, GNU/Linux (Arch, Fedora and Ubuntu) and macOS, although in the last one, only in command-line mode.

- [1. Topic of this article.](#1-topic-of-this-article)
- [2. Command line solution in MS Windows.](#2-command-line-solution-in-ms-windows)
- [3. Command-line solution in GNU/Linux and macOS.](#3-command-line-solution-in-gnulinux-and-macos)
- [4. Graphical solution in Windows with File Explorer.](#4-graphical-solution-in-windows-with-file-explorer)
- [5. Graphical solution in Linux with File Manager.](#5-graphical-solution-in-linux-with-file-manager)


## 1. Topic of this article.

Have you ever had a folder on your computer full of files and need to insert the list of those files in a page you are editing?

It happens to me often for file  lists to be inserted at the end of court documents.

In this article, I describe a couple of solutions that I have personally tried,  in the **MS Windows** environment and in various **UNIX**-derived operating systems, i.e., some **GNU/Linux** distributions, particularly **Arch**, **Ubuntu** and **Fedora**, as well as **macOS**.

All by using only the original resources of the various operating systems. Thus, no additional applications.

There are essentially two solutions: 
- Command-line solution
- Graphical manager solution.

## 2. Command line solution in MS Windows.

A bit of computer history: before Windows there was, for IBM-compatible personal computers, a command-line operating system called DOS.

DOS was the most widely used *commercial* operating system from early 1979 until mid-1990.
In those days the terminal was the only system for managing documents.

After the advent of Windows, DOS was maintained as an application, in the **command prompt**.

From Windows 10, in addition to the classic *prompt*, the **Windows PowerShell** was added, an enhanced version later renamed simply **Terminal** in Windows 11.

The **command prompt** and the **Windows PowerShell** are two separate applications, both available in Windows 10 and 11.

For the purpose of this article I will use the old "*prompt*,"  to demonstrate the extreme simplicity of the operation and also because it is more similar to *old* DOS.

To launch the *command prompt* you press the key with a logo to the left of the space bar, which is the *Windows* key, also called the *Start* key or the *Logo* key, along with the letter *r*: basically `Start + r`.

In the window that appears you type `cmd` followed by the *Enter* key.

Basically:

1. `Start + r`
2. `cmd`
3. *Enter*

You can also launch the *Command Prompt* from the Application Menu.

To navigate between folders you use the `cd` (*Change Directory*) command.  For example, to navigate to the users' folder you use:

```bash
cd C:\Users
```

Note and remember the backslash for addresses, `\`, we will come back to that detail later.

To generate the list of documents contained in a directory, the command `dir` (*Directory*) is used.

With that command, however, you also get additional information about the documents, and that information may be troublesome to delete.

By adding the "/b" option, then with the `dir /b` command, you get, on the other hand, the list of only the names of the documents without any other data.

To save the result in a document, the `>` (major) operator is used. This operator allows saving the *output* of a command in a text file instead of displaying it directly on the screen.

Therefore, to export the document list to *output.txt* the command is:

```bash
dir /b > output.txt
```


That command generates a document called, in fact, "*output.txt*" containing the list of documents in the folder.

Since this is a "plain text" document, it is editable with any word processing program, even with simple *Note Pad*.

## 3. Command-line solution in GNU/Linux and macOS.

In the GNU/Linux world, the command-line terminal has always been, and still is, one of the most widely used methods of document management in the operating system.

Even **macOS** has a terminal that is very similar to that of Linux. 

Both operating systems have the same origin from *UNIX* and, therefore, share many common features in the terminal.

In particular, macOS uses **Bash** as the default *shell*, which is the same *shell* environment used by many Linux distributions.

The *shell* is the software layer that interprets user commands and turns them into actions by the operating system.

In  UNIX world there are also other *shells* for managing the terminal:
*Fish*,  
*Zsh*, 
*Dash*, 
*Ksh*.

However, also for Linux, we will refer to the simplest “shell” solution, i.e. **Bash**, “*Bourne Again SHell*”, which is also the most common.

The terminal in Linux launches like any other application depending on the Desktop Manager used (ex. Plasma, Gnome, Cinnamon, etc.).

To launch the terminal in *macOS*, one of these methods is used:

Via *Launchpad* (by typing “Terminal” in the search field); 
Via *Finder*, by opening 
the `/Applications/Utilities` folder; 
Via *Spotlight*.

Also in the Linux/macOS terminal to move between folders the `cd` command is used, but the syntax is a little different than in the Windows *prompt*.

For example: to move to the user's Documents folder you use the command

```bash
cd ~/Documents
```

Note that in Linux/macOS  are used the *slash* instead of *backslash*.

To list the contents of folders, the `ls` (*list*) command is used, corresponding to the `dir` of the *prompt*.

Also in Linux/macOS there is an option to filter the list by document names only: `-f` similar `/b` of Windows/DOS, as mentioned above.

The redirection operator is, however, similar: `>`.

So to save to disk in *output.txt* the list of contents of the Home/Documents folder, the following command is used (where the *tilde*, `~`, is the shortcut for starting from Home):

```bash
ls -f ~/Documents > Documents/output.txt
```

## 4. Graphical solution in Windows with File Explorer.

The same result can be achieved in graphical mode, using the respective applications found in each operating system, with a few little differences between them.

In MS Windows you have to open File Explorer by selecting it on the taskbar or in the Start menu or by pressing the combination `WINDOWS + e` on the keyboard; you select the *files* to be copied; you hold down the SHIFT key and press the right button of the *mouse* selecting the item such as “*Copy as path*”.

That item is present from Windows 7, but only while holding down the *Shift* key.

The result can be, then, pasted into an open document and will contain the various *files* with their respective paths enclosed in quotation marks.

Small “trick”: to get the correct sequence of the list you must place the cursor on the *first file* selected, otherwise the copy may start from a later document in the list.

For example: if we had a list with documents DOC1, DOC2, DOC3 and placed the cursor on DOC2, copying would take place in the following sequence: DOC2, DOC3, DOC1.

To respect the correct sequence, therefore, we must place the cursor on DOC1 before giving the command to *Copy as path*.

## 5. Graphical solution in Linux with File Manager.

With Linux, however, simply select documents from the File Manager, copy the list and paste it into the document.

The path is presented without the quotation marks.

Tried with Arch Linux, Fedora and Ubuntu.

Therefore, in GNU/Linux the operation is slightly easier than in Windows because  you do not need to hold down the SHIFT key to get the paths copied.

Linux automatically recognizes the destination of the copy/paste operation and presents the path in case that destination consists of a document being processed.

What about in macOS? Unfortunately, in macOS this method does not work. If you copy a list of documents from the Finder and try to paste that list into an open document, you will get the **contents** of the documents and not their names.

The solution in this case is through dedicated applications or Automator, but that is another story.

Thank you for your attention.

