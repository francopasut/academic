---
title: "Vim: study on transposing lists of names from horizontal to vertical"
date: 2022-09-24
slug: vim_transpose_list
categories:
  - Editors
tags:
  - Vim
  - RegEx
image:
  placement: 3
  preview_only: false 
  caption: 'Vim Is Magic'
---



## Primary purpose of the study.

- **Initial status**: series of inline names, separated by a semicolon followed by a space.
- **Objective**: Transpose all names into one column by removing both semicolons and spaces.
- **Purpose**: Creating list for *mail-merging* with e-mail client (*Thunderbird*).
- **Tools**: Vim and built-in RegEx function.
- **Example**: 

<p style="text-align: center; font-weight: bold;">
From:
</p>

<pre>
One@mail; Two@mail; Three@mail; ...
</pre>

<p style="text-align: center; font-weight: bold;">
To:
</p>

<pre>
One@mail
Two@mail
Three@mail
...
</pre>

## Secondary goal

To test the integration between Markdown and css tags.

This objective was accomplished in the Example above by inserting the following code:

```html
<p style="text-align: center; font-weight: bold;">
Da:
</p>

<pre>
One@mail; Two@mail; Three@mail; ...
</pre>

<p style="text-align: center; font-weight: bold;">
A:
</p>

<pre>
One@mail
Two@mail
Three@mail
...
</pre>
```


## Vim: regular expression for the primary target

To obtain the transposition from horizontal to vertical, the object of the primary target, the following formula is used:

```bash
:%s/; /\r/g
```


Analysis of the formula:

- `:%s`: activation of substitution mode throughout the document
- `/; /`: search for the string to replace, note the space after the semicolon that corresponds to the original structure of the list.
- `\r/`: replace the string found by the previous command with a carriage return.
- `g`: *global* option, that is, application of the result to all instances found.


## And now: the reverse procedure.

At this point I also try the reverse procedure: from the vertical list to the horizontal list delimited by semicolon followed by a blank space.

Basically from

<pre>
One@mail
Two@mail
Three@mail
...
</pre>
 
 to

<pre>
One@mail; Two@mail; Three@mail; ...
</pre>

The same formula above can be used with inverted factors:

```bash
%s/\n/; /g
```

where with `\n` I select the carriage returns and with `/; /g` I replace them with a semicolon and a space.

Thank you for your attention.



