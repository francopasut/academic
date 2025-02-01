---
title: "Vim Is Magic or Nomagic?"
date: 2022-11-17
slug:  vim_magic_nomagic
categories:
  - Editors
tags:
  - Vim
  - RegEx
image:
  placement: 3
  preview_only: false 
  caption: 'Vim Is Magic?'
---



## What's this joke?

The title is a joke with the name of "*V.I.M.*" but, at the same time, it's  a real mode of Vim itself: the *Magic Mode*.

To understand what *Magic Mode* is, the primary source is the item `:help magic` in Vim.

In a few words:
- The *Magic Mode* refers to the *regular expressions*
- The *Magic Mode* is enabled by default in Vim.
- You can explicitly invoke the *Magic Mode* with the `\m` command in the RegEx search area.
- To deactivate it you must set `\M` (capitalized *m*) in the RegEx search area.
- When you use the `\M` command you invoke the *Nomagic Mode*.
- *Nomagic Mode* turns "*almost all special regex symbols into ordinary ones unless they start with a backslash*".
- There is also a *Very Nomagic Mode* that extends the effect to other characters,  not relevant to this article.

## When is magic mode (default) better than nomagic?

To analyze the difference between *magic* and *nomagic* mode, I resume a formula from a previous [article of mine](https://francopasut.netlify.app/post/vim_regex_white_spaces/).

It's the Vim RegEx formula for eliminating all whitespace before the first word and after the last word of each line with a single composite command.

Here's the formula in *magic mode* (it's the last formula of the article) without the parentheses:


```vim
%s/^\s*\|\s\+$//g
```

The same string written in *nomagic mode* is as follows:

```vim
%s/\M^\s\*\|\s\+$//g
```

The difference consists in the `\M`,  that activates the "*nomagic*",  and in the asterisk that in nomagic must be "escaped".

In this situation, the *magic* (default) mode is better than the *nomagic*  because there are no special RegEx characters to use as ordinary characters.

## When is nomagic mode better than magic?

*Nomagic* mode, on the other hand, is very useful when the text contains many special characters, such as brackets.

Let us analyze the effect of the two modes on the following text in which I try to delete only the first group of characters in brackets: *[abc]*.

>[abc][abcdef][abcghi]

Now I try to match the string with the following command in magic mode: 

```vim
s/[abc]//g
```

Applying the strict rules of Vim RegEx in *magic mode* the effect is much different than it should be:

>[][def][ghi]

Why this outcome?

The brackets `[]` in RegEx identify a "*Character Class*".

A *character class* or a collection, is a sequence of characters that you can use to match any single character in the collection.

Then, RegEx records the characters inside the square bracket and deletes them in all occurrences in the entire collection.

To get the correct result in *magic* mode, the *escape* character must be used for each bracket: 

```vim
s/\[abc\]//g
```

By using the *nomagic* mode, instead, you get just  the desired effect because the brackets are treated as ordinary characters.

```vim
s/\M[abc]//g
```
The *nomagic mode*  is more easily readable by the human eyes.

Imagine creating a search string with many special characters that must all be escaped: the risk of forgetting some "escape" would be very high.

## The *curious case* of the extension names

As you know, file extensions are a group of three or four characters separated by a dot from the file name.

Let us try to solve a small RegEx problem involving extensions: suppose we have a list of documents with different extensions, such as *.pdf*, *.tiff*, and *.png*. 

For example:

    - first document.pdf
    - second document.tiff
    - third document.png

Now,  I need to keep the names of the documents and delete only the extensions, **with a single command**.

Strictly applying the rules of regular expressions in the *magic mode*, activated by default in Vim, would result the following formula:

```vim
:%s/\.pdf\|\.tiff\|\.png\|\.jpg//g
```

The alternation operator is `\|` and must be *escaped*.

Applying the rules of regular expressions in the *nomagic mode* would result the following formula:

```vim
%s/\M.pdf\|.tiff\|.png//g

```

The differences are the *escape* bar before every dot.

But at this point we have just the *curious case of extensions*: for operations on dot extensions the *magic* and *no magic* notation coincide because in the former case the dot has the meaning of "any character" before the extension, including... the dot itself, and, on the other hand, in the latter case the dot denotes just that character and no other.

That is, in *magic* mode the dot becomes one of the *any characters* that the dot, intended as a special character, takes on in *magic* mode, and among the *any characters* is, of course, the dot itself.

Simplifying the formula again, we can write it even more easily as follows: 

```vim
%s/.pdf\|.tiff\|.png//g
```

Therefore,  the syntaxes `%s/\M.pdf\.tiff\.png//g` and `%s/.pdf\.tiff\.png//g` are, in fact, equivalent and the result will be the same.

Thank you for your attention.
