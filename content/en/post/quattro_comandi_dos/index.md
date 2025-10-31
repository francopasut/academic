---
title: "Four text commands in GNU/Linux, MS Windows, and, with a bit of nostalgia, MS-DOS."
date: 2025-10-26
slug:  quattro_comandi_dos
categories:
  - Blog
tags:
  - Linux
  - MS-DOS
  - MS Windows
image:
  placement: 3
  preview_only: false 
  caption: 'Comandi di testo'
canonicalUrl: https://francopasut-en.blogspot.com/2025/10/four-text-commands-in-gnulinux-ms.html
---


- [1. Does it still make sense to perform operations via the command line?](#1-does-it-still-make-sense-to-perform-operations-via-the-command-line)
- [2. How do you open a command terminal?](#2-how-do-you-open-a-command-terminal)
- [3. The “cd” command.](#3-the-cd-command)
- [4. The “ls” and “dir” commands.](#4-the-ls-and-dir-commands)
- [5. The “cp” command.](#5-the-cp-command)
- [6. The “rm” command.](#6-the-rm-command)
- [7. In conclusion.](#7-in-conclusion)


# 1. Does it still make sense to perform operations via the command line?

Talking about the command line in today's operating systems might seem a bit vintage, as if the topic were a historical remnant of the first personal computers of the 1980s.

In reality, even today, the command line is an extraordinarily efficient resource, despite the most modern graphical interfaces.

MS-DOS was my first operating system back when “windows” had not yet been invented.

To write this article, I recovered from my paper library an old book published in 1989 dedicated to MS-DOS, in which I found my underlinings from that time.

Graphical systems have made everything easier but **not faster**.

The advantage of text commands over their graphical counterparts  is still, today, their greater **speed of execution**.

The “small” disadvantage, on the other hand, is the need to memorize the functions and syntax of the most useful commands.

However, this article is not specifically dedicated to the  Command Line.

I have already addressed the topic of the Command Line in [a previous article of mine on this platform](https://francopasut.netlify.app/post/xcopy_robocopy_windowsv/#a-short-introduction-to-the-command-line-in-ms-windows) to which I refer for the introduction.

In this article, I will focus only on a few commands with some functional and historical notes.

I used Emacs Org Mode with the Evil plugin to emulate Vim.

# 2. How do you open a command terminal?

To use text commands, you need to open a terminal and type in the commands: it's very simple!

A terminal is basically an application that you launch like any other using the operating system's search window.

In GNU/Linux, various versions of terminals may appear depending on the distribution or graphical environment used: Terminal, GNOME Console, Konsole, Xfce Terminal.

Windows 11 also has a Terminal: if you enter the string “terminal” in the application search bar and press Enter, Windows PowerShell is launched.

Alongside the “new” Terminal command, the historic Command Prompt can be used in every version of MS Windows, even very old ones.

Until a few years ago, the term “prompt” was practically unknown to those who did not use text commands in MS Windows.

In essence, the “prompt,” in the classic sense, referred to the terminal emulator present in all versions of Windows containing the “MS-DOS” command set.

Today, the word “prompt” is, as we all know, associated with Artificial Intelligence systems&hellip; but that's another story.

In this article, the term “prompt” is used in its historical meaning.

By the way: if you want to try the “old” DOS, you can also use an [online terminal emulator](https://www.101computing.net/msdos/).

# 3. The “cd” command.

The first command in this brief overview is `cd`, or  *change directory*, one of the simplest and most useful commands and one of the first to learn for those starting from scratch.

As the name suggests, it is used to change the working folder, i.e., to navigate between the folders of the operating system.

The command was already present in the MS-DOS operating system in the early 1980s and was derived from a similar command in Unix from 1969.

So it is certainly one of the “oldest” commands in the history of computing. 

The basic structure is very simple: *command+folder<sub>name</sub>*.

The use of the “cd” command has some differences between the two Windows 11 applications (Prompt and Power Shell) and the Linux bash version.

In the following list, you will find two specific terms: “shell,” which indicates the command line interface, and “home,” which indicates the main personal folder of the operating system.

-   By typing the command `cd` in the Linux shell and pressing Enter from anywhere in the folder tree, you are immediately directed to the home directory.
-   By typing the same command `cd` in Windows PowerShell, however, you are NOT directed to the home directory, but the current folder is replicated.
-   In this context, to jump to the “home” folder, you must type “=cd ~=”.
-   If you use the old “Command Prompt” in Windows 11, as in every previous version of Windows and in the historical DOS, not only does the “automatic” return to the “home” directory with the ‘cd’ command NOT work, but typing the command “=cd ~=” returns the message: “The specified path cannot be found.”

In summary: the Windows PowerShell “cd” command is closer to the equivalent Linux command than the historical Command Prompt, but it does not emulate it completely. 

The “approximation” consists of recognizing the tilde character (i.e., “~”) as a substitute for the personal home folder.

In Linux, however, the “cd” command also has an additional feature that is completely absent in Windows: the use of the “-” character to  go directly to the previously visited working folder.

In short: typing “~cd -~” in the Linux shell takes you directly to the previous working directory. In Windows, both with PowerShell and with the Command Prompt, this version of the command causes the error “The specified path could not be found.”

This initial examination reveals a series of minor differences between the various terminal implementations.

# 4. The “ls” and “dir” commands.

Another very useful and widely used Linux command is `ls`, short for “list.”

As the name suggests, the command provides a list of the items in a folder.

The historical peculiarity of this command, compared to the one examined above, is that it did not exist under that name in the MS-DOS operating system.

If you try to type the command in the Windows command prompt or in an online DOS emulator, you will get the result “Illegal command: ls.”

The reason is very simple: in MS DOS, the command `dir` (derived from the name *directory*) was used instead of `ls`.

Today, the `ls` command is available not only in all GNU/Linux distributions, but also in Windows 10 and later, having been implemented in *Power Sell*, i.e., the new Windows Terminal.

Is there a difference between the “old” `dir` and the current `ls`?

Absolutely: the “old” command has a more limited and “uncomfortable” syntax compared to the new one.

The most common options for `dir` are as follows:

-   /P: Displays the list of files and folders one screen at a time, pausing until a key is pressed.
-   /W: Displays the list in wide format, showing up to five files or directories per line.
-   /S: Lists the files within the specified directory and all its subdirectories.
-   /A: Allows you to view files with specific attributes (e.g., hidden, system).
-   /O: Sorts the output according to specific criteria such as name, size, extension, date.
-   /Q: Shows the owner of the file.

The `dir` options can be combined with each other, but only by repeating the slash: for example, `dir /O/W`.

The `ls` options, on the other hand, can be combined with each other by simply placing them side by side.

In other words: it is not necessary to replicate the prefix for each command, which in this case is **-** instead of **/**.

The list of options for the `ls` command is easily found online.

Here is a summary of the options I use most frequently:

-   `-l` for “long”: used to display the list with detailed information.
-   `-a` for “all”: used to display hidden items as well
-   `-t` for “time”: used to display the list sorted by modification date.
-   `-R` (with a capital letter to distinguish it from the “-r” option for ‘reverse’) as “recursively”: displays the contents of folders at lower levels than the current one.

As mentioned above, to combine options, simply add the relevant letters one after the other.

For example: this is one of the most useful combinations: `ls -lat`, I will explain its meaning below.

To combine the effects of the various options, it is therefore not necessary to repeat the prefix “-”.

Example: to combine the first three options, you don't need to type `ls -l -a -t`, even though this syntax is correct. Instead, you can simply type the simpler combination `ls -lat`.

However, while working on this article, I noticed that the `ls` command in Windows Terminal, or Windows PowerShell, does not accept the optional parameters listed above.

After a quick search, I discovered the reason: the `ls` command in Windows PowerShell is an *alias*, i.e., a short command that launches a longer command.

The actual long command launched by `ls` is `Get-ChildItem`.

The system therefore works differently from the original `ls` command in Linux.

The optional parameters are, in this case, those of the long command, i.e., those of `Get-ChildItem`, which are different from those of `ls` in Linux.

The list of `Get-ChildItem` parameters can easily be found online. 

# 5. The “cp” command.

The `cp` command, short for “copy,” allows you to copy and paste contents from one folder to another in a single operation.

Remember that with the graphical mode (e.g., Windows Explorer), **two separate operations are required: one to copy and one to paste**. You also need to move the pointer from the source folder to the destination folder.

Have you ever wondered how much time you waste on these operations?

The basic syntax of the command is very simple: `cp folder/filename folder/filename`.

Clearly, if the *filename* is located in the current folder,  the first reference to  *folder* can be omitted.

The same rule applies to the destination folder: if the *filename* to be pasted is located in the current folder, the second reference to *folder* could also be omitted.

If, on the other hand, we were to copy/paste a document into another folder without changing the document name, then we could omit the reference to the second *filename*.

In short: with a little practice, the command allows you to perform similar operations **much more quickly** than with the graphical resources of Windows Explorer or similar programs.

Only by trying out the speed of text commands, particularly this one, can you realize how much time is wasted copying and pasting with windows!

For example, you can copy/paste from any folder and to any folder without leaving the current folder.

A very useful option of the `ls` command is `-r`, which is used to copy entire folders with their subfolders.

The basic pattern is as follows: `cp -r source/ destination/`

Without the `-r` option, the command would only copy any documents in the source folder, but not the subfolders. 

An additional feature of the `-r` option is as follows:

-   If the destination folder does not exist, one is created with the name specified in the command and at the same level.
-   If the destination folder exists, a subfolder is created with the name of the source folder.

The `-r` option also exists and works in a similar way in Windows PowerShell.

In the “old” MS-DOS, the `cp` command did not exist, but instead there was the `copy` command, even more explicit in its name, which had a similar but not identical syntax.

The question I asked myself was: did the `copy` command in the “old” MS-DOS have an option similar to `-r` in the Linux cp command, i.e., one that allowed subfolders to be copied as well?

Strangely enough, NO! The COPY command in the old MS-DOS did not have an option that allowed it to recursively copy subfolders, as the -r option of cp in Linux does. The COPY command was therefore limited to copying files within a single directory.

To copy entire directories and subdirectories in MS-DOS, you had to use a separate command called XCOPY (eXtended COPY), which was specifically designed for this purpose.

The XCOPY command is mentioned in my article “[MS Windows: xcopy and robocopy with references to batch procedures and rsync](https://francopasut.netlify.app/post/xcopy_robocopy_windowsv/)”.

# 6. The “rm” command.

The name of the command `rm` is short for *remove*, and the command is equivalent to the DELETE key on graphical operating systems. 

The syntax is very simple: `rm [options] filename`, which is also very simple!

The command in its pure and simple form has the effect of deleting documents but not folders.

To delete folders as well, you need to use the `-r` option, which can be the initial letter of the word *recursive*.

So the command to delete documents, folders, and subfolders is as follows: `rm -r foldername`.

What if there is a write-protected folder?

No problem, just add the `-f` option and  the complete command would be `rm -rf foldername`. 

Of course, you can use wildcards, i.e., asterisks (\*) for any sequence of characters of any length and question marks for any single character.

Was this command also present in the “old MS-DOS”?

In the old MS-DOS, there were actually TWO commands with similar functions: ERASE and DEL.

I used DEL more often than ERASE because it was quicker to type. But the effect was the same.

Both worked with file names and wildcards but with a notable feature for the time: the use of pure and simple wildcards required confirmation of the operation.

In other words: the command `DEL *.txt*` to delete, for example, all text documents in a folder was executed immediately, while the command `DEL *` required confirmation before execution.

Since these commands have an irreversible effect, this created a protective barrier against potentially dangerous operations.

The commands can still be executed in MS Windows, both in Prompt and in Power Shell, but with one small difference: in Prompt, the original protective barrier is maintained and, therefore, the use of the character `*` as the only content of the command requires the confirmation described above, whereas the same operation in Power Shell is performed without any confirmation.

In the latter case, therefore, the “protection” has not been maintained.

# 7. In conclusion.

This article is far from being a comprehensive review of text commands in various operating systems.

Nor does it claim to be exhaustive on the four text commands analyzed. 

Instead, it is an invitation to use text commands to appreciate the extraordinary speed of execution that we have lost with graphical solutions. 

If even one reader feels tempted to try the “old” text commands and,  perhaps, let me know how they found them, I would be really happy!

Thank you for your attention. 

