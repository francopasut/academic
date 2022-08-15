---
title: "Vim: Study on constructing Regular Expressions to delete or reduce blank lines  with Global Command"
date: 2022-08-15
slug: vim_regex_blank_lines
categories:
  - Editors
tags:
  - Vim
  - RegEx
image:
  placement: 3
  preview_only: true 
  caption: 'Vim e RegEx'
---

{{% toc %}}

## Preface

On the topic of this article you may find interesting the following one: ["Vim and Regular Expressions for removing redundant whitespace"](https://francopasut.netlify.app/post/vim_regex_white_spaces/).

Unlike the previous article, here the presence of whitespace causes different solutions than blank lines regardless of the number of their occurrences.

The study in this article is focused on both the analysis of "*regular expressions*" and Vim's global command.

## Vim and the Global Command

The Global Command in Vim is the `g` key.

It's useful for a lot of purposes.

In Normal Mode it can be used to compose multi-letter commands, such as the following ones:

* `guw`: lower case next word
* `gUw`: upper case next word
* `gU2w`: upper case next two word
* `gUe`: upper case until the end of the word
* `gu$`: lower case until the end of the line
* `ge`: move to the end of the previous word (simple `e` moves to the end of the next word)

... and so on.

The `g` Command can also be a *motion operator*, as described in [this article of mine](https://francopasut.netlify.app/post/vim_double_motions/).

The same global command can still be used as an *"ex command"*, and this is exactly what is needed for this article.

## The Global Command  as "*ex command*"

An "*ex command*" is a Vim command that, from normal mode, is activated with the colon and is followed by a specific command.

The Global Command `:g` of Vim as *"ex command"* has a composite structure, listed as follows:

* Activation is done by pressing the colon from Normal Mode followed by the letter `g`
* A search *pattern*
* A command applied to the pattern.

Each segment is separed by a slash `/`.

Thus, by joining the segments, here's the basic structure:

```
:g/pattern/command
```

The *pattern* could be a string of text but also a *regular expression*.

Like every Vim  *ex command* it can perform operations in a range of lines or in every line of a document.

## Use the Global Command to delete all completely empty lines

The solution is, for this purpose, a really basic *ex command* readily available online:

```
:g/^$/d 
```

Let me analyze every atom of such a command, considering the structure mentioned above (`:g/pattern/command`):

* `:g` is the *trigger* of the Global Command.
* `/` is the separator slash between the first and the second part of the structure.
* `^$` is the *search pattern* in an elementary *RegEx*.
* `^$` is the *search pattern* in an elementary *RegEx* to select rows beginning (`^`) and ending (`$`) without any characters or whitespace inside.
* Follows another separator slash (`/`) between the second and the third part of the structure.
* The letter `d` is the real command applied to  the *search pattern* and the command is: *delete*.

Translated in human natural language: *find every blank line in the document and delete it.*

## Use of the Global Command to delete all lines containing white spaces 

The formula for deleting blank lines in which there are white spaces is almost the same, but not quite the same, with the previous one.

Here it is:

```
:g/^\s*$/d
```

By comparing the two formulas, it is possible to extract the part that does not match:

* First formula: `g/^$/d`
* Second formula: `g/^\s*$/d`
* Part that does not match: `\s*`

The difference between the first and the second formula is the fragment `\s*`\: what does it mean?

* `\s` is the sign for "*whitespace character*"
* `*` is the quantifier for "*zero or more times*"

Resuming the summary at the end of the previous paragraph we can translate in human language as follows: *find the blank lines and the lines with one or more white spaces and delete them all*.

## And now: reduce the consecutive blank lines to one

The first two formulas are easily found on the Web. Now, however, let us construct two more formulas based on the previous ones.

But now it raises the bar of difficulty with a useful formula for those writing code or markup languages, such as LaTeX or Markdown, in which only one blank line is enough to separate the text lines and, therefore, additional lines are useless.

The new goal is, therefore,  reduce blank lines between written lines and delete all blank lines after the last written line.

The search pattern is related to the presence of at least two empty rows.

Here is the formula:

```
:g/^$\n^$/d
```

Since the third formula relates to blank rows, it is necessary to compare this with the first one, rather than the second one in which is also processed whitespace:

* First formula: `g/^$/d`
* Second formula: `g/^\s*$/d`
* Third formula: `g/^$\n^$/d`
* Parte that does not match: `\n`

What's the meaning of that little piece of formula?

Very simple: the `\n` command corresponds to a *line feed* and allows you to find all the empty lines next to an empty line feed and to delete all occurrences of this search.

Since the operation reaches the point where between two written rows there is NO longer two consecutive empty rows but only a single empty row, this row is NOT deleted.

We have, therefore, achieved the goal with a simple duplication of the first search formula.

## More and more difficult: reduce all consecutive lines,  in which whitespace is present,  to one

But now that I have built a new formula based on the first one, I try to build a new formula based on the second one.

The fourth formula must match for a pattern in which there are at least two blank rows or rows with whitespace and reduce it to one until there are no more duplicate lines to match.

Here is the fourth formula:

```
g/^\s*$\n^\s*$/d
```
Here is all the four formulas:

* First formula: `g/^$/d`
* Second formula: `g/^\s*$/d`
* Third formula: `g/^$\n^$/d`
* Fourth formula: `g/^\s*$\n^\s*$/d`
* Parte that does not match: `\n`

The fourth formula doubles the pattern  of the second one by attaching the _line feed_  command I already mentioned  above (`\n`).

The last formula cleans up the document by removing any redundant lines with no text characters leaving only one of them between the lines of text.

## Short closing comments

This study allowed me to verify the extraordinary versatility of regular expressions that can be combined with each other and with Vim's Global Command to perform very complex operations automatically.

It reminds me of an early construction game I used to play as a child, many years ago.

Thank for you attention.
