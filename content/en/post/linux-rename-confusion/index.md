---
title: "Linux: rename, rename.ul, prename, perl-rename: what a confusion!"
date: 2023-10-22
slug:  linux-rename-confusion
categories:
  - Blog
tags:
  - Linux
image:
  placement: 3
  preview_only: false 
  caption: 'Linux names confusion'
---




## Summary of this article.

In this article I report some observations on how to rename documents in GNU/Linux using text commands, clarifying some differences between various distributions.

The `rename` command does not, in fact, have unique behavior in distributions derived from Debian versus those derived from Fedora and Arch.

I will try to clarify the content of different commands and the different behavior of commands that have the same name.

All steps were personally tried during the writing of the article.

If you find inaccuracies or errors, please let me know.


## One for all: *mv*.

To rename a document using the command line in GNU/Linux one generally uses the `mv` command, or *move* and this command has a unique behavior in all distributions.

Basically, the `mv` command *moves* the document from the old name to the new name, and this operation is performed uniformly across distributions.

The syntax is very simple: `mv old-name new-name`.

But it is not the only command for this operation.

There are other commands starting with `rename`.

## The *rename* command: this is where the problems begin!

In many distributions there is a `rename` command available that extends the functionality of renaming documents using templates.

The behavior of that command, however, is not unique.

In versions of Ubuntu prior to  #22 there was a command called `rename-ul` installed with the `util-linux` package. That command was not compatible with *regular expressions*.

The  current version of the `rename` command in Ubuntu and Debian is, however, compatible with *regular expressions* and installs with `sudo apt install rename`.

Thus: **in Debian, Ubuntu and derived distributions, the `rename` command allows the use of `regular expressions`**.

A command with the same name is also present in the installation archives of Fedora and Arch but it has a **different behavior as it is not compatible with "regular expressions "**.

Basically, the `rename` command found in Fedora and Arch has a behavior similar to the *old* `rename-ul` once found in Debian and Ubuntu.

In order to have a regular expression compatible command, you need to install the `prename` command in Fedora and `perl-rename` in Arch Linux.


So, to summarize:
- In Debian and Ubuntu, installed a few years ago and updated from time to time, you may still find the `rename-ul` command installed that is not compatible with regular expressions
- The current `rename` command in Debian and Ubuntu is, however, compatible with *regular expressions*.  
- The `rename` command in Fedora and Arch **is not** compatible with *regular expressions*.
- The equivalent regular expression compatible command is `prename` for Fedora and `perl-rename` for Arch.


## How does the `rename` command behave that is NOT compatible with regular expressions?

The `rename` command found in Fedora and Arch, which, then, is the same at the time named `rename-ul` found in Debian and Ubuntu, allows operations to be performed on multiple document bases through the use of "templates" but without the use of *regular expressions*.

The basic syntactic pattern is as follows:

```bash
rename [options] <pattern> <replacement> <file(s)>
```

For example: to replace the .txt extension with the .bak extension on all text documents, the following formulation is used:

```bash
rename .txt .bak *.txt
```

Therefore `rename` is, already, very versatile but, in Fedora and Arch version, it does not support the power of *regular expressions*, i.e., the *meta-language* of excellence for operating on text strings.


## The `regular expressions` compatible commands.

In various distributions there are *Perl* regular expression compatible commands variously named: in *Debian* and *Ubuntu* the command is `rename`; in *Arch* Linux it is `perl-rename`; in *Fedora* it is `prename`.

Installation is very simple for each distribution:
- For Debian and Ubuntu: `sudo apt install rename`.
- For Fedora: `sudo dnf install prename`.
- For Arch: `sudo pacman -S perl-rename` or, for those who use it, `yay -S perl-rename`.


Compatibility with *regular expressions* is done with reference to the Linux `sed` command.

## The "*sed*" command in GNU/Linux.

The *sed* (*stream editor*) command in GNU/Linux is used for replacing text strings within documents.

The command operates not on the name of documents but within them.

A typical *sed* formula is as follows:

```bash
$sed 's/old_name/new_name/' file_object
```

The result is presented in the command line and can, of course, be redirected to a separate document with the `>` operator of the Linux command line.

The same procedure can be used for document names but the operator cannot be the ` sed` command but rather a command expressly dedicated to editing at the name level and not the content level.

The `rename` commands in Debian and Ubuntu, `prename` in Fedora and `perl-rename` in Arch use, precisely, a *sed-like* structure.


## Using regular expression compatible commands.



The basic pattern of `rename` in Debian and Ubuntu, `prename` in Fedora and `perl-rename` in Arch is as follows:

```bash
command-name 's/old_name/new_name/' file(s)
```

For example, to replace the *.txt* extension with the *.bak* extension on all text documents, the following *regular expression* is used (depending on the various distributions):

```bash
- rename 's/\.txt$/.bak/' *.txt
- prename 's/\.txt$/.bak/' *.txt
- perl-rename 's/\.txt$/.bak/' *.txt
```


I hope I have cleared up this potential confusion between commands for renaming documents in different GNU/Linux distributions.

Thank you for your attention.
