---
title: "Comparison of Vim and Emacs for a substitution operation using regular expressions"
date: 2022-09-12
slug: vim_emacs_blank_regex
categories:
  - Editors
tags:
  - Vim
  - Emacs
  - RegEx
image:
  placement: 3
  preview_only: true 
  caption: 'Vim and Emacs'
---



<style>
table {
    border-collapse: collapse;
}
table, th, td {
   border: 1px solid black;
}
blockquote {
    border-left: solid blue;
    padding-left: 10px;
}
</style>

## Preface

This article is a summary of two previous posts that you can read at these pages:

- ["Vim: Study on constructing Regular Expressions to delete or reduce blank lines with Global Command"](https://francopasut.netlify.app/post/vim_regex_blank_lines/)
- ["Emacs: Study on constructing Regular Expressions to delete or reduce blank lines"](https://francopasut.netlify.app/post/emacs_regex_blank_lines/)
    
The topic of "regular expressions" in Vim and Emacs is well suited for a functional comparison across the four different scenarios covered in the above articles to which I refer for a description of the syntax. 

## Comparation Table

| Target                             | Vim                | Emacs                                                              |
|------------------------------------|--------------------|--------------------------------------------------------------------|
| Delete "pure" blank lines          | `:g/^$/d`          | `M-x flush-lines <RET> ^$ <RET>`                                   |
| Delete blank lines with whitespace | `:g/^\s*$/d`       | `M-x flush-lines <RET> ^\s-*$ <RET>`                               |
| Reduce "pure" blank lines          | `:g/^$\n^$/d`      | `M-x query-replace-regexp <RET>  ^C-qC-j\{2,\} <RET> C-qC-j <RET>` |
| Reduce blank lines with whitespace | `g/^\s*$\n^\s*$/d` | `^\(^C-q<SPC>*C-qC-j\)\{2,\} <RET> C-qC-j <RET>`                   |

## Emacs: what you type is not what you see

As explained in the article on Emacs, *what you type is not what you see*.

Below is a brief summary table for the operation of "reducing"
blank lines,  the third and fourth formulas in the above table, by distinguishing the keys pressed from the characters
displayed.

| Type                                            | Visualize                     |
|-------------------------------------------------|-------------------------|
| `^C-qC-j\{2,\} <RET> C-qC-j <RET>`              | `^^J\{2,\} → ^J`        |
| `^\(^C-q<SPC>*C-qC-j\)\{2,\}<RET> C-qC-j <RET>` | `^\(^ *^J\)\{2,\} → ^J` |

## Short summary


The subject of regular expressions in Vim and Emacs shows several differences between the two editors.

I am unable to determine which implementation is the best one.

It is necessary, in any case, to consider that Emacs has a very good emulator of Vim, called *Evil*,  that allows one to use the same regular expression language as the source editor.

Thank you for your attention.


