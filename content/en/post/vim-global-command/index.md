---
title: "About Vim and the Global Command"
date: 2022-12-03
slug:  vim_global_command_about
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: false 
  caption: 'Vim and the Globe'
---

{{% toc %}}

## Vim and the Global Command: basic structure

With the "Global Command" of Vim (`g`) you can replicate various
*ex-commands* on multiple lines.

The basic structure of the Global Command is very simple:
`:g/pattern/command`, meaning:

- `:` activates the "command mode".
- `g` activates the "global command".
- `/pattern/` is the "search zone" for matching patterns in the
  document.
- `/command/` is the command applied to the entire lines where the
  results is.

The basic structure is, therefore, biphasic: an initial search phase and
a command phase.

To demonstrate how this structure works,  let's assume the existence of the following
lines:

	abc
	def
	ghi
	jkl
	mno

If you want to delete the line containing the  "a" letter you can use the
following command 
`:g/a/d` in which:

- `:` is the typical command mode activation character in Vim.
- `a` is the search pattern.
- `d` is the command (Delete) applied to the entire line where search
  result is located.

  It's really simple!

## Vim Global Command and the range pattern

But if you want to delete a *range of lines* matching an initial and
final pattern, you have to use a slightly more structured *global
command*.

Suppose you have to delete all the lines between the one containing the
letter "a" and the one containing the letter "k".

In this case, a triphasic structure must be used: initial pattern, final
pattern and command.

The structure is the following
`:g/initial_pattern/,/ final_pattern/command`

The initial and final patterns are separated by a comma.

In this case, the following formula is used:
`:g/a/,/k/d`

- `a` is the initial pattern
- `k` is the final pattern
- `d` is the command

But if you need to delete only the range starting to the line **after**
the first matching pattern, you must use a `+1` option to the initial
pattern:
`:g/a/+1,/k/d`.

At the same time, if you have to delete until the range **before** the
final matching pattern, you must use the option `-1` after the final
pattern:
`:g/a/,/k/-1d`.

Combining the two previuos targets: if you have to delete the range
starting to the line **after** the initial matching pattern and until
the line **before** the final matching pattern, you must use both the
options `+1` and `-1`:
`:g/a/+1,/k/-1d`.

## Various examples

Of course, you can perform all other operations allowed by the global
command, including:

- Delete (as seen above)
- Substitute
- Normal
- Print
- Move
- Put
- Copy
- Sort

Example with the *Normal* command: suppose you need to add a blank line
after the line with the "a" letter wherever the cursor is along the
document.

That's the solution:
`:g/a/norm o`.

What's this `norm o`?

When it finds the target, the formula instructs Vim to apply the normal
(`norm`) mode and virtually type the addition of a line underneath with
Vim's standard `o` command, which everyone who uses Vim, of course, is
already familiar with.

Another target for which you have to add a period at the end of each
line.

Here's how:
`:g/a/norm A,`.

The `norm A,` command adds a comma at the end of the line.

Endless combinations of commands can be created by the same logic.

Thank you for your attention.
