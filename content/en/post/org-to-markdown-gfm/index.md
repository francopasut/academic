---
title: "Converting from Org Mode to Markdown GFM"
date: 2022-12-20
slug:  org-to-markdown-gfm
categories:
  - Blog
tags:
  - Org-Mode
  - Markdown
  - Emacs
image:
  placement: 3
  preview_only: false 
  caption: 'Org-Mode to Markdown'
---

{{% toc %}}

## Does it make sense to talk about Org Mode instead of Markdown?

Why should I use Org-Mode to write articles to be published network in
Markdown format?

Wouldn't it be more convenient to write the articles directly in
Markdown?

The question is more than justified and the answer is not obvious.

First, let me remind you that Org-Mode is a mode of GNU/Emacs. While
there are various plugins for other editors, including Vim, none of them
can match the outstanding efficiency of the original system.

So: to write in Org-Mode, it's best to must use GNU/Emacs.

Org-Mode is a complete and extremely powerful structured writing system,
although the learning curve is significantly upward.

It is a very useful resource for anyone who has to write complex
documents, such as legal documents, scientific publications, novels.

Markdown is a language with text-format syntax much easier and immediate
to learn.

However, some current CMSs directly accept Markdown format without the
need for any conversion. I am not aware, however, that it is possible to
publish directly in Org-Mode format.

Org-Mode (in Emacs, of course) has a very extensive set of commands for
moving, shifting, deleting chapters, and managing images and is,
therefore, extremely useful in the creative and construction phase of
the writings.

In summary: Org-Mode is a very powerful, fast and effective writing
system for all those who write complex documents by profession or
passion.

But sooner or later, you will need to convert the material from Org-Mode
to another format for printing (LaTeX) or web publishing (Markdown or
HTML) (or both).

## The export problems

Org-Mode has excellent and very fast built-in export capabilities with a
myriad of options and configurations to various formats including LaTeX,
HTML, and Markdown itself.

The export result is excellent for LaTeX, HTML, and basic Markdown.

However, basic Markdown lacks some syntactic features compared to the
GFM dialect (i.e., "GitHub Flavored Markdown").

For example, as I witnessed directly in the course of preparing one of
my articles, Org-Mode's internal export produces tables in HTML format
(i.e., with the typical \<table\>, \<tr\> and \<td\> *tags*) instead of
the dedicated Markdown GFM table markup code.

Using Pandoc with the standard configuration (such as
"`Pandoc input_file -or output_file`") the result is better but still
not enough, as we will see in the examples below.\*\* Some examples to
make it clearer

I report some export examples from the Org-Mode version of [this article
of mine](https://francopasut.netlify.app/it/post/vim_vimtex_surround/).

The following table is the "source" text version in Org-Mode:

``` shell
| Function                       | Keystrokes |
|--------------------------------+------------|
|                                |    <c>     |
| Delete Surrounding Command     |   =dsc=    |
| Delete Surrounding Environment |   =dse=    |
| Change Surrounding Command     |   =csc=    |
| Change Surrounding Environment |   =cse=    |
```

This is the result of exporting via Org-Mode built-in function:

``` html
  <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-center" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Function</th>
<th scope="col" class="org-center">Keystrokes</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">Delete Surrounding Command</td>
<td class="org-center"><code>dsc</code></td>
</tr>

<tr>
<td class="org-left">Delete Surrounding Environment</td>
<td class="org-center"><code>dse</code></td>
</tr>

<tr>
<td class="org-left">Change Surrounding Command</td>
<td class="org-center"><code>csc</code></td>
</tr>

<tr>
<td class="org-left">Change Surrounding Environment</td>
<td class="org-center"><code>cse</code></td>
</tr>
</tbody>
</table>
```

The code is pure HTML and not Markdown.

This, on the other hand, is the result of exporting with Pandoc using
the following formula:

``` shell
pandoc -s nomefile.org -o nomefile.md
```

``` markdown
Function                             Keystrokes
-------------------------------- ------------------
Delete Surrounding Command        `dsc`{.verbatim}
Delete Surrounding Environment    `dse`{.verbatim}
Change Surrounding Command        `csc`{.verbatim}
Change Surrounding Environment    `cse`{.verbatim}
```

The code seems to be correct but the result on browser is very different
from the desired one:

``` shell
  Function Keystrokes

Delete Surrounding Command dsc{.verbatim} Delete Surrounding Environment dse{.verbatim} Change Surrounding Command csc{.verbatim} Change Surrounding Environment cse{.verbatim}
```

## The solution: export from Org-Mode to Markdown via Pandoc with GFM option.

The solution is to convert from Org-Mode to Markdown using Pandoc but
adding the GFM option to have the code "enriched" from the base version.

This is the pattern, [found, after long search, on this
page](https://eengstrom.github.io/musings/convert-org-mode-to-markdown):

``` shell
pandoc --from=org --to=gfm org-mode-file.org > markdown.md
```

where, of course, the document names *org-mode-file.org* and
*markdown.md* must be replaced with the real ones.

Note the "`--to=gfm`" option that determines the output in the Markdown
GitHub format.

Applying that pattern to the code mentioned in the previous paragraph
produces the following converted code:

``` markdown
| Function                       | Keystrokes |
|--------------------------------|:----------:|
| Delete Surrounding Command     |   `dsc`    |
| Delete Surrounding Environment |   `dse`    |
| Change Surrounding Command     |   `csc`    |
| Change Surrounding Environment |   `cse`    |
```

In this way, you get perfectly formatted Markdown code even for the
parts not provided in the basic version.

Note, in addition to the complete table of each character, also the
"centering" of the second column.

Then, you can create the writings by taking advantage of the infinite
potential of Org-Mode and, then, exporting them to HTML or Markdown (or
LaTeX) perfectly formatted for the publishing stage.

## The special case of exporting code blocks.

While testing this topic I found a peculiarity in the export of source
code (tag `src`).

Simply using the combination "`begin_src ... end_src`" gives a result in
Markdown as if it were the "quote" format, that is, with four indent
spaces (which is equivalent to prefixing "`>`" before each line).

In exporting via Pandoc, the same result is obtained ONLY if the
fragment language is not specified.

If, however, the language is specified (for example:
"`#+begin_src markdown`") the export is correctly formatted as a code
block with the same language specified in Markdown.

The names of the languages allowed by Org and Markdown are not, however,
coincident.

This, however, does not preclude the correct formatting of the code when
exporting, but only the colored display of the content: if the language
indicated in Org-Mode were not provided in Markdown it would simply
result in an uncolored fragment but, in any case, correctly exported as
a "code block" and not as a "citation block."

Thank you for your attention.
