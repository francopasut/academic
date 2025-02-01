---
title: "LaTeX, LilyPond and lyluatex package: state-of-the-art text and music typesetting"
date: 2020-03-21
canonical_url: "https://medium.com/@francopasut/latex-lilypond-and-lyluatex-package-state-of-the-art-text-and-music-typesetting-f7c8d79ac66e/"
slug: lilypond-lyluatex
categories:
  - Editors
tags:
  - LaTeX
  - LilyPond
image:
  placement: 3
  preview_only: true
  caption: 'Music sheet'
---





## LaTeX and LilyPond  ##

*LaTeX* is a \"*state-of-the art\"* pagination system for text, maths
and more.

*LilyPond* is the same for musical scores.

*LaTeX and LilyPond* together are a true excellence to mix music
notation and text within same documents.

But it is not so easy to generate documents by using that combination of markup languages.

This post is intended as a simple introduction to start using *LaTeX and LilyPond* in documents containing text and music notation.

## Prerequisites for understanding this article  ##

In order to understand the content of this article, it is of course necessary to know the markup languages it deals with: *LaTeX* and *LilyPond*.

There are many tutorials on Internet on how to use LaTeX.

For *LilyPond*, the best tutorial is the one available on the official
page \
<https://lilypond.org/website/manuals.html>

Obviously you need to know musical notation.

## The LilyPond official solution  ##

*LilyPond* is a markup language to produce music scores of high typographical quality.

In the *Usage* manual there is a section on how to use it inside *LaTeX* documents: [Section 3.2.1](https://lilypond.org/doc/v2.22/Documentation/usage/latex).

Accordingly the official manual you must save your document in a file with *.lytex* extension (for instance: '*lilybook.lytex*'), then execute two steps.

First of all you have to launch, in a terminal, the following command:
`lilypond-book --output=out --pdf lilybook.lytex.`

You get a `.tex` file that you must further elaborate with the typical LaTeX *pdflatex* command such as`pdflatex lilybook.tex` to obtain the final *lilybook.pdf* document.

Whenever you edit the music notation into the *.lytex* source file you must first generate the *.tex* file from the *.lytex* to get the *.tex* and, then, generate the *.pdf* from the *.tex*.

If, therefore, you had inserted text elements in the *.tex* file you will lose them and have to insert them again in the previous *.lytex* or in the *.tex* after the first step.

Not a very efficient system!

## The single command solution: lyluatex package  ##

Fortunately since a few years it is contained in [TEX Live](https://ctan.org/pkg/texlive) and in [MiKTEX](https://ctan.org/pkg/miktex) distributions the amazing ***lyluatex*** package that lets you to insert complete music scores or inline music notation using a single command.

You simply must add the `\usepackage{lyluatex}` directive to the *preamble* of your LaTeX document and you're ready to use *LilyPond* directly inside your *LaTeX* document.

Of course, you also need to install *lilypond* itself in your operating system.

You can use the `\lilypond{...}` command for inline inserts and the `\begin{lilypond} ... \end{lilypon}` environment for block of musical scores.

The following is an example of **inline code with text and music**:

```lilypond 
Inline music fragment insertion test: \lilypond{\new RhythmicStaff { \time 3/4 c4( c16) c c c c c c c \bar "|."}}
```

The following is an example of **code with text and a musical block
score**:

```lilypond
Start slowly and then increase in ascending until you reach the forte, then decrease in descending until you reach the piano. Then repeat the scales (always in groups of three) with the colors in reverse, that is to start strong and decrease ifno to the floor in ascending, then increase to the strong in descending.



\begin{lilypond}
\header {
  title = "C Major Scale"
}



\layout {
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
  }
}
\relative c' {
  
  \clef F 
  c,4-1\p\<\startGroup_\markup{gr. 3} d-2 e-3\stopGroup f-1\startGroup_\markup{gr. 4} g-2 a-3 b-4 \stopGroup
  \clef G
  c4-1\startGroup_\markup{gr. 3} d-2 e-3\stopGroup f-1\startGroup_\markup{gr. 4}
  g-2 a-3 b-4\stopGroup c-1\startGroup_\markup{gr. 3}
  d-2 e-3\stopGroup f-1\startGroup_\markup{gr. 4+1} g-2 a-3 b-4 c-5\f\!\stopGroup b-4\>\startGroup_\markup{gr. 4} a-3
  g-2 f-1\stopGroup e-3\startGroup_\markup{gr. 3} d-2 c-1\stopGroup b-4\startGroup_\markup{gr. 4} a-3 g-2 f-1\stopGroup e-3\startGroup_\markup{gr. 3} d-2 c-1\stopGroup
  \clef F b-4\startGroup_\markup{gr. 4} a-3 g-2 f-1\stopGroup e-3\startGroup_\markup{gr. 3} d-2 c-1\p\!\stopGraceMusic r
}
\end{lilypond}



Perform loudly with the right hand and softly with the left hand, then vice versa. Then switch the \textit{crescendo} and \textit{diminuendo} between the two hands.
```

When you have finished writing the text and the music in the document, you only need to **compile your document using *lualatex*** (Not use *pdflatex*!) with the `--shell-escape` command line option.

The complete command is: `lualatex --shell-escape document.tex`.

That's all! Have a little patience because *lyluatex* needs to compile the scores in *lilypond* and enjoy your document containing *text and music*, like the following fragments derived from the above code snippets.

## INLINE EXAMPLE:  ##

![Inline
insertion](inline-music-fragment.png)

## BLOCK CODE EXAMPLE:  ##

![Block
insertion](block-music-fragment.png)

Thank you for your attention.


[Originally posted at Medium](https://medium.com/@francopasut/latex-lilypond-and-lyluatex-package-state-of-the-art-text-and-music-typesetting-f7c8d79ac66e)
