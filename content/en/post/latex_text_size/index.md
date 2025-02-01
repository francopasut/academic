---
title: "LaTeX: some considerations on font size"
date: 2023-08-11
slug:  character-size-considerazions-latex
categories:
  - Blog
tags:
  - LaTeX
image:
  placement: 3
  preview_only: true 
  caption: 'Character sizes list in LaTeX'
---




## LaTeX: class definition, standard classes and font sizes.

In LaTeX, the term "class" refers to a predefined or custom document type that determines the general *layout*, style, and options available for formatting a document. 

The classes in LaTeX are identified by the file extension `.cls` and provide the basic instructions for document structure.

The main features of a `class` in LaTeX relate to the page format as well as the style of the title, of the sections and text.

The standard LaTeX classes are `article`, `report`, `book` and `letter`.

To use a class in LaTeX, it is necessary to declare it in the preamble of the document using the command `\documentclass` as from the following example:

```tex
\documentclass[a4paper,12pt]{article}
```

In the above example, the `article` class is declared with the options `a4paper` for page size and `12pt` for font size.

Regarding font size, the standard classes routinely support only three values: **10pt (the "default" size), 11pt and 12pt**.

This may seem very reductive, even though for most documents it is sufficient.

The question is, of course: is it possible to set a different font size in ordinary LaTeX templates? For example **14pt**?

It is certainly possible: either with resources already normally available in LaTeX or with the use of additional packages.

The following remarks refer to the solutions available in LaTeX without the use of specific packages.

## What are the font-sizing commands in LaTeX?

LaTeX has a set of commands dedicated to changing the size of standard characters.

The sequence, from smallest to largest, is as follows:

 1. \\tiny
 2. \\scriptsize
 3. \\footnotesize
 4. \\small
 5. \\normalsize
 6. \\large
 7. \\Large
 8. \\LARGE
 9. \\huge
10. \\Huge

## When are character sizing commands used in LaTeX?

Each size command has its own specific utility, as shown in the list below:

 1. `\tiny` reduces the font size to the smallest possible level and is useful for very short footnotes or captions.
 2. `\scriptsize` reduces the font size from normal and is suitable for captions, labels or auxiliary text.
 3. `\footnotesize` reduces the font size slightly compared to normal and is often used for footnotes.
 4. `\small` reduces the font size compared to normal and is suitable for supporting text or short quotations.
 5. `\normalsize` resets the font size to normal and is the default command used for most text in the document.
 6. `\large` increases the font size slightly from normal and is useful for slight emphasis of text.
 7. `\LARGE` increases the font size further than the previous command.
 8. `\LARGE` increases the font size again.
 9. `\huge` greatly increases the font size and places clear emphasis on the text.
10. `\Huge` increases the font size further than the previous commands and is the largest font size command available in LaTeX.


## How do you use the character sizing commands in LaTeX?

To use these commands, simply enter them in the document at the desired point.

For example, to reduce the font size of a text fragment, you would write `\tiny` before the text and `\normalsize` after the text to restore the normal size.

Here is an example of what using these commands in LaTeX might look like:

```tex
\documentclass{article}
\begin{document}

{\tiny Lorem ipsum dolor sit amet, consectetuer adipiscing elit.}

{\Huge Aenean commodo ligula eget dolor.}

Aenean massa. Cum sociis natoque penatibus.

\end{document}
```

In the example above, the text inside `{\tiny (...)}` will be displayed very small, while the text inside `{\Huge (...)}` will be displayed very large.

The text after these portions in curly brackets will be restored to normal size.

Here is the actual result:

![tiny-huge](tiny-huge-example.png "Tiny Huge Example")

You can also use the commands to change the size of the text at the beginning of the document to  affect the entire document.

For example, the following code will make all the text in the document size `\Large`:

```tex
\documentclass{article}

\begin{document}
\Large


Aenean commodo ligula eget dolor.

\end{document}
```

It is also possible to use the same commands as environment delimiters, to change the size of text within an area of text, thereby "isolating" the effect from the rest of the document.

For example, the following code fragment applies the `Large` command to the text "*Aenean commodo ligula eget dolor.*" without changing the size of the rest of the document: 


```tex
\documentclass{article}

\begin{document}

Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

\begin{Large}
Aenean commodo ligula eget dolor.
\end{Large}

Aenean massa. Cum sociis natoque penatibus.

\end{document}
```
Again I report the actual result in the following image:

![normal-large](normal-large-example.png "Normal Large Example")

The commands, in summary, can be used in several ways:

- Within an environment (e.g., center)
- As delimiters themselves of an environment.
- Within a block of parentheses
- With permanent effect from a certain point onward

## The alternative classes of the KOMA-Script project.

As an alternative to the solutions described above, it is possible to use the *script* KOMA-Script which contains a set of alternative classes to the standard classes mentioned above: `scrartcl`, instead of the standard `article` class; `scrreprt`, instead of the `report` class; `scrbook`, instead of the `book` class; `scrlttr2`, instead of the `letter` class.

LaTeX's `Koma` classes, through the KOMA-Script package, support a wider range of font sizes than the standard, as listed below:

- 8pt: A very small font size, suitable for documents with limited space or compact readability requirements.
- 9pt: A slightly larger font size than 8pt, but still quite compact. Can be used to make text a little more readable than the smaller size.
- 10pt: The default font size in standard LaTeX classes such as article, report and book. It is a common value for font size in many documents.
- 11pt: A font size slightly larger than 10pt. It can be used to improve the readability of text without increasing it too drastically.
- 12pt: Another font size common in standard LaTeX classes. It is a bit larger than 11pt and is used to make the text even more readable.
- 14pt, 17pt, 20pt and other custom sizes.

The following is a Koma-script class declaration with a *font-size* different from the standard ones:

```tex
\documentclass[fontsize=14pt]{scrartcl}
```

For more in-depth information on KOMA-Script I recommend viewing the [related documentation](https://ctan.org/pkg/koma-script).

Thank you for your attention.
