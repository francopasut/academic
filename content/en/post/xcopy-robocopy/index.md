---
title: "MS Windows:  xcopy and  robocopy with mentions of batch procedures and rsync."
date: 2025-05-23
canonicalUrl: https://francopasut-en.blogspot.com/2025/05/ms-windows-xcopy-and-robocopy-with.html
slug:  xcopy_robocopy_windowsv
categories:
  - Blog
tags:
  - Windows
  - Robocopy
image:
  placement: 3
  preview_only: false 
  caption: 'Windows and Robocopy'
canonicalUrl: https://francopasut-en.blogspot.com/2025/05/ms-windows-xcopy-and-robocopy-with.html
---


<p align="center">
INDEX
</p>

- [Copy and Paste: the universal method.](#copy-and-paste-the-universal-method)
- [A short introduction to the Command Line in MS Windows.](#a-short-introduction-to-the-command-line-in-ms-windows)
- [Two integrated command-line solutions: xcopy and robocopy.](#two-integrated-command-line-solutions-xcopy-and-robocopy)
- [Basic scheme and some options, among many, of the robocopy command.](#basic-scheme-and-some-options-among-many-of-the-robocopy-command)
- [Robocopy and batch procedures.](#robocopy-and-batch-procedures)
- [Robocopy and Rsync.](#robocopy-and-rsync)
- [FreeFileSync](#freefilesync)




<a id="orgd62dcd1"></a>

# Copy and Paste: the universal method.

To transfer files from one folder to another folder we usually use “copy and paste.”

The “universal method” is “copy and paste”: we all know how it works and it is certainly simple and straightforward.

But is it also the most efficient method?

If there were some documents already previously transferred and others to be transferred, it would be necessary to manually select those to be transferred before doing the “copy and paste,” and this operation could be particularly time-consuming.

In cases like these, more efficient solutions should be sought.

These solutions exist but are somewhat hidden as they work in the “Command Line” of the operating system.


<a id="org02fdb5c"></a>

# A short introduction to the Command Line in MS Windows.

What is the “command line” in MS Windows?

The first personal computers used a command-line only operating system: it was called “MS-DOS.”

All commands had to be typed in full on the keyboard.

Of course, it was necessary to know by heart the correct syntax of each command, at least the basic ones such as::

-   `DIR` To display the list of files and subdirectories in a directory.
-   `CD` To change the current directory.
-   `MD` or `MKDIR` To create a new directory.
-   `RD` or `RMDIR` To remove an empty folder.
-   `COPY` To copy one or more files from one location to another.
-   `DEL` To delete documents..

Commands could be typed in both upper and lower case.

From 1990, with Windows 3.0, the graphical user interface was introduced and there was a gradual shift from the command line to windows.

The command line, however, was never abandoned.

Until version 8.1 of MS Windows an emulator of DOS called **Command Prompt** remained usable.

From Windows 10 the command line was enhanced with the addition of **Windows Power Shell**, later renamed more simply **Terminal** in Windows 11, very similar in functionality and versatility to GNU/Linux's Terminal.

Warning: it should be considered that documents deleted in the MS Windows terminal, **are not moved to the recycle bin** and, consequently, cannot be restored contrary to what, on the other hand, happens with graphical operating systems.

In other words: operations performed with the command-line interface are irreversible.

Later in this article I will explain how to handle this problem.


<a id="orgc0e9341"></a>

# Two integrated command-line solutions: xcopy and robocopy.

After the brief introduction on the “command line,” let us return to the issue of document copying: MS Windows offers two native command-line solutions:.

-   `xcopy`
-   `robocopy`

The first solution, `xcopy`, was introduced from the remote days of MS-DOS and is, therefore, present since the origin of the MS Windows operating system.

The extensive description  of the `xcopy` command can be found at [this page](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/xcopy) from the manufacturer.

The second application, `robocopy` is more recent in that it was introduced in Windows NT 5.0-based operating systems, namely Windows 2000 and Windows XP.

With `robocopy` it is possible to carry out much more complex and intricate operations, including transferring data by filtering only those that have changed compared to similar earlier operations mentioned above.

It also allows you to make “mirror” copies, that is, copies that automatically delete from the destination folder the data no longer present in the source folder, creating, in effect, *mirror copies*.

The extensive description of `robocopy` can be found in [this page](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy) from the manufacturer.


<a id="org944f547"></a>

# Basic scheme and some options, among many, of the robocopy command.

The `robocopy` command has many options, as analytically described on the [manufacturer's page.](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy)

I will, therefore, just mention a few to get you started with using the command.

The basic scheme is as follows:

    robocopy source destination documents options

A notable convenience is that paths can also be inserted by dragging the mouse pointer.

The meaning of the basic pattern is self-descriptive but not all parts are necessary: the parts named *documents* and *options* are optional.

If the part named *documents* is missing, the parameter of *default* `*.*` is applied.

If, on the other hand, it is necessary to perform operations on specific documents it would be necessary to indicate them here in the command.

The options are. *optional* and are for targeted operations, such as those described below.

The `/E` option copies the entire contents of the folder in which the cursor is located and all subfolders, including empty ones.

As a mnemonic for such an option I use the word *Extend*.

Therefore, to copy all folders and subfolders with their contents from a source to a destination, the following command pattern must be used:

    robocopy source destination /E

For example: to copy the entire contents of the Documents folder from disk C: to a *backup* folder on disk D: you would write a formula similar to the following:

    robocopy “C:\Users\UserName\Documents” “D:\Backup\Documents” /E

The `robocopy` command automatically handles the creation of the target subfolders.

Documents are copied in alphabetical order but retain the creation/change date of the source folder.

The `robocopy` command does not transfer identical documents (same attributes, size, timestamp) by default.

`Robocopy` itself provides, without any specific option, to neutralize identical documents between the two folders by transferring only those that do not exist in the destination or that have been most recently modified in the source folder.

However, documents that have already been transferred in previous operations to the destination folder and that no longer exist in the source folder remain.

To perform “mirror cloning” between the two folders there is, however, the `/MIR` option, as in the following example diagram:

    robocopy “C:\source” “D:\destination” /MIR

The `/MIR` option, which clearly originates from the English term “MIRROR,” creates a mirror copy of the source directory structure, deleting documents in the destination if they were deleted in the source.

This option also handles subdirectories so there is no need to add the /E option as well. 

Keeping in mind what was mentioned above about the irreversibility of text commands, it is advisable to have the ability to simulate operations before making them effective.

To perform a simulation in Robocopy, simply use the `/L` option. 

For example: `robocopy C:\source D:\destinationt /L` shows the effect of the command without making any actual movement.

To actually proceed just send the same command again but without the `/L` option.

    robocopy “C:\source” “D:\destination” /MIR

The `/MIR` option, which clearly originates from the English term “MIRROR,” creates a mirror copy of the source directory structure, deleting documents in the destination if they were deleted in the source.

This option also handles subdirectories so there is no need to add the /E option as well. 

Considering what was mentioned above about the irreversibility of text commands, it is advisable to have the ability to simulate operations before making them effective.

To perform a simulation in Robo

To perform a simulation in Robocopy, simply use the `/L` option. 

For really: `robocopy C:\source D:\destination /L` shows the effect of the command without making any actual movement.

To actually proceed just send the same command again but without the `/L` option.


<a id="org0292d0e"></a>

# Robocopy and batch procedures.

Robocopy is perfectly usable within *batch* procedures in MS Windows, for example, to copy the contents of various source and target folders, perform parallel operations, or automate processes with advanced parameters.

Here is a small example of using in *batch* of Robocopy to perform multiple operations:

    @echo off
    robocopy "C:\SourcePath-1" "D:\DestinationPath-1" /E /MT:8
    robocopy "C:\SourcePath-2" "D:\DestinationPath-2" /E /MT:8
    robocopy "C:\SourcePath-3" "D:\DestinationPath-3" /E /MT:8
    echo All Done!
    pause

-   `SourcePath-1/2/3` indicate the folders on disk C of where the data is located before the command.
-   `DestinationPath-1/2/3` indicate the folders on disk D to which the data is to be transferred with the command.
-   The `/E` (Extend) option copies the subfolders. It should, of course, be omitted if there is no data in subfolders to be copied.
-   The `/MT:8` option creates *multithread* copies with “n” *threads*.  The default value is 8. Basically it is used to increase performance.
-   The command `echo All Done!` warns that the procedure is finished. The text can of course be customized as desired.
-   The `pause` command asks to press a key to exit the procedure.

“Batch” commands must have the extension `.bat` to be executable in Windows and can be run in either the (new) Terminal (Windows Power Shell) or the (old) Windows Prompt.

However, the Terminal, by security default, does not launch commands from the current path.

To overcome this setting, it is sufficient, as, moreover, is done in Linux's *bash*, to use the syntax `./command.bat`, i.e., make the actual command preceded by a dot and a slash, or to explicitly launch the command from another folder by reporting the full path.

Prompt, however, does not have this security setting, so it is sufficient to launch the .bat command without any prefix if you are in the same folder where the command is located.

In addition, the command can also be launched from File Explorer, i.e., from the MS Windows graphics manager: just right-click the *mouse* and select *Open* in the context menu.

To edit the contents of the .bat command, however, just press *Edit* in the context menu of File Explorer.


<a id="orgc2b14be"></a>

# Robocopy and Rsync.

It can be argued that `robocopy` in MS Windows works very similarly to GNU/Linux's `rsync`.

Both are powerful tools for copying and synchronizing files and folders, with many options for customizing copy behavior.

Here are some similarities:

-   Incremental copying: They copy only files that have been changed or added, improving efficiency.
-   Exclusion options: Allow specific files or directories to be excluded from copying.
-   Difference recognition: They recognize files that have not been modified and leave them intact in the destination.
-   Robustness: Both can handle large amounts of data and large files without problems.
-   Mirror copy: Robocopy's `/MIR` option, described in this article, is perfectly *specular* to Rsync's `--delete` option.


<a id="orgc8de4ff"></a>

# FreeFileSync

If I have not been able to convince you to use command-line programs and you would, therefore, like to use a graphical *open source* system I recommend [FreeFileSync](https://freefilesync.org/) which can be easily installed in MS Windows, GNU/Linux and macOS.

But that is another story&#x2026;.

Thank you for your attention.

