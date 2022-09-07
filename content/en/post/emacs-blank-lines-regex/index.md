---
title: "Emacs: Study on constructing Regular Expressions to delete or reduce blank lines"
date: 2022-09-05
slug: emacs_regex_blank_lines
categories:
  - Editors
tags:
  - Emacs
  - RegEx
image:
  placement: 3
  preview_only: true 
  caption: 'Emacs Logo'
---

{{% toc %}}

After writing an article focusing on ["Vim: Study on constructing Regular Expressions to delete or reduce blank lines with Global Command"](https://francopasut.netlify.app/post/vim_regex_blank_lines/) I tried to match with a similar operation with Emacs.

The goal is to study the differences in syntax related to "regular expressions" between two writing systems.

The following is the result of my attempts after various searches on the net.

## Removing blank lines in Emacs using RegExp ##

First of all, it may be useful to display the blank lines in the document.

To preview blank lines, you can use the *whitespace-mode* function (`M-x whitespace-mode <RET>`): blank lines will be marked with dollar signs, i.e., lines in which there is no character, not even white space.

At this point you can select a region or operate on the entire document from the cursor point with the `flush-lines` function, or the alias `delete-matching-lines`,  to remove  lines that respond to a 



``` 
M-x flush-lines <RET> ^$ <RET>
```

The formula's meaning is as follows: remove all lines *beginning with an end of line* (`$`), that is, *all blank lines*.

## Removing blank lines and lines with whitespace ##

Starting from  the above function you can  add a small piece of "regular expression"  to delete even lines with whitespace.

The new piece is the following one: `\s-*` and it's composed by two differen segments:

  * `\s-` indicating the white space
  * `*` indicating that the previous character can be repeated zero or more times

The complete code is as follows: 

``` 
M-x flush-lines <RET> ^\s-*$ <RET>
```

## Reducing blank lines to one line only using RegExp ##

But now let's raise the difficulty level  with a useful formula for those writing code or markup languages, such as LaTeX or Markdown, in which only one blank line is enough to separate the text lines and, therefore, additional blank lines are useless.

The new goal is, therefore,  reduce blank lines between written lines.

The model points to the search for at least two blank.

But at this point the Emacs language diverges from typical "regular expressions" because the editor warns me that to insert a new line you cannot use the `\n` command, as I would have done in Vim,  but the `C-q C-j` combination.

What's this? I found a clear explanation in [this page](http://xahlee.info/emacs/emacs/keystroke_rep.html): 

> `C-q` is a notation for the keyboard shortcut `Ctrl+q`. The command invoked by that shortcut is `quoted-insert`. The `quoted-insert` command lets you insert a character and suppress the corresponding key's normal function. 

> The `C-j` in `C-q C-j` is for inputing ASCII Line Feed char (used in unix as newline char), which does not have a corresponding key on the keyboard. The reason that `C-j` is for Line Feed is because it's a notation from the ASCII standard. That is, the non-printables are represented by a Control followed by a letter, regardless whether there is a corresponding key on the keyboard. Line feed is the 10th ASCII char, and j is the 10th letter, so Line Feed is C-j. 

I had some trouble understanding how that  combination worked because every time I put it in the minibuffer I got a real line feed  and not a code.

But after a while I understood the solution! Continuing with the <RET> key emacs translates the entry into `^J`  which is what is needed for our purpose.

It is also necessary to use another funciont than the one previously used:   the `query-replace-regexp` function.

At this point, it is enough to complete the *search*  formula by "duplicating" the lines to be searched for with `{2,}` which, with escape characters (`\`), becomes `\{2,\}` and, finally, prepend  the typical Regexp character indicating  the beginning of the line  `^`.



Now simply add the *replacement* command, which, of course, consists of a single new line `C-q C-j`, displayed as `^J`.

Summarizing:

- Type `M-x query-replace-regexp <RET>`
- Type: `^C-qC-j\{2,\}`
- You get, after pressing the <RET> key: `^^J\{2,\}`
- Then type: `C-qC-j`
- Then get, after pressing the <RET> key: `^J`

To make the command work type `!`.

The function  searches the lines from cursor point forward for all double blank lines and replaces them with a single blank line until the search fails.

You can use it also inside a *region*.

After the command is launched, only one line will remain, which is the desired target.

## Reducing blank lines including whitespace to one blank line only ##

Even more difficult: I would like to include lines containing whitespace in the search and use a formula like the one above to keep only a blank line.

It's necessary to modify the *search* part to include  *zero to infinite* (i.e. the `*` postfix operator) whitespace from the beginning of the line.

After many attempts, I found this solution  (without escaping):

```
(^C-q<SPC>*C-qC-j)
```

Translated into human language: from the beginning of the line (`^`), match lines where  are present zero to infinity whitespace  `C-q<SPC>*`.

The rest of the formula is like the previous one.

By inserting the new fragment (with escaping)  after the beginning of the previous one (the `^`), we will have this formula (still as typed on the keyboard):

```
^\(^C-q<SPC>*C-qC-j\)\{2,\}
```
We will visualize , therefore,  la formula in the minibuffer ad follows:

```
^\(^ *
\)\{2,\}
```


After completion, by adding the same second part of the formula as the previous one (`C-qC-j`),  Emacs will display: 

```
^\(^ *^J\)\{2,\} → ^J
```

From my tests, the formula works exactly as desired.

On [this page](https://emacs.stackexchange.com/questions/60063/remove-multiple-blank-lines-in-a-buffer-leave-one), however, I found a little different formula that works just ad well:

``` 
M-x query-replace-regexp <RET> ^\(^<SPC>*C-qC-j\)+ <RET> C-qC-j
```



I also report the unescaped version for better clarity:

``` 
M-x query-replace-regexp <RET> ^(^SPC*C-qC-j)+ <RET> C-qC-j
```

It is a different approach from the previous one but very interesting and works as well.

Thank you for your attention.
