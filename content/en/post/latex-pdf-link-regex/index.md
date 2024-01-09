---
title: "Automatic generation of hyperlinks  in  LaTeX environment, using Vim's Regular Expressions, between PDF documents."
date: 2024-01-08
slug:  latex-pdf-link-regex
categories:
  - Blog
tags:
  - Vim
  - RegEx
  - PDF
  - LaTeX
image:
  placement: 3
  preview_only: false 
  caption: 'Link Documents'
---

Vim is an editor with endless capabilities. It can also generate hyperlinks in LaTeX language to other locally stored documents, thanks to its built-in Regular Expressions. For lawyers, this means linking a legal document with its related evidentiary materials. This is the analysis of the procedure.

- [1. Subject of this article.](#1-subject-of-this-article)
- [2. Main document configuration.](#2-main-document-configuration)
- [3. RegEx formula for automatic link generation.](#3-regex-formula-for-automatic-link-generation)
- [4. Explanation of the RegEx formula.](#4-explanation-of-the-regex-formula)
- [5. Management of "underline character".](#5-management-of-underline-character)
- [6. Links within the text](#6-links-within-the-text)
  - [6.1. "Indirect linkage" solution:](#61-indirect-linkage-solution)
  - [6.2. "Direct link" solution:](#62-direct-link-solution)



##   1. Subject of this article.

Sometimes it is necessary to include in a main PDF document a list of documents to be retrieved with specific hyperlinks dedicated to each item in the list.

For example:   judicial acts with reference to related document productions.

In this article I deal with the **automatic** generation of hyperlinks in ***LaTeX*** by ***Vim*** using the ***Regular Expressions*** (RegEx) built into the *editor*.


##  2. Main document configuration.

The first operation is to create a document in LaTeX by including, in the preamble, the loading of the *hyperref* package:

```tex
\usepackage{hyperref}
```

It could also follow the possible `\hypersetup{pdfnewwindow}` configuration, which is used to open the documents retrieved by the various hyperlinks in separate tabs from the main document:

```tex
\usepackage{hyperref}
\hypersetup{pdfnewwindow}
```



This is necessary because, otherwise, documents retrieved via hyperlinks might overlap with each other and with the main document itself, and this would make it difficult to backtrack through the sequence.

The same *pdfnewwindow* command can, however, also be inserted within the *RegEx* formulas that we will see later in this article.

So, the starting situation is as follows: we have a main PDF document that within it has a list of secondary documents that should be retrieved with hyperlinks dedicated to each individual document.

 The document list is configured following the *standard* of *LaTeX*, as in the following example:

> \\item DOC 01.pdf  
> \\item DOC 02.pdf  
> \\item DOC nn.pdf   
> (...)


The environment can be either *itemize* (or *compactitem* with the *paralist* package) or *enumerate* (or *compactenum* with the *paralist* package).

The difference between the two variants *itemize* and *enumerate* becomes important for [cross-links within document](#6-links-within-the-text).


##   3. RegEx formula for automatic link generation.

Here, then, is the formula that adds a hyperlink to **all elements** in the main document formed with the above pattern:

```bash
:%s/\\item \(.*\.pdf\)/\\item \\href[pdfnewwindow]{run:.\/\1}{\1}/g
```

Applying the *RegEx* formula in Vim returns the following string:

```tex
\item \href[pdfnewwindow]{run:./DOCUMENT NALE.pdf}{DOCUMENT NAME.pdf}
```

After the main document is compiled, the *linked* document is clickable directly from where its name is in the list.

The system also works with **PDFs containing spaces** in the name.

Instead of applying the formula to **all items** it is possible to limit the operation to a **selection of items** from a list.

To achieve this, one must select the rows to be processed and use the following formula (keeping in mind that the first part `'<,'>s'`, is added directly by *Vim* itself):

```bash
'<,'>s/\\item \(.*\.pdf\)/\\item \\href[pdfnewwindow]{run:.\/\1}{\1}/g
```

##   4. Explanation of the RegEx formula.

Before analyzing the *RegEx* formula, it should be borne in mind that in the Regular Expressions embedded in Vim, round brackets allow you to define **catchgroups** which can, then, be used, with a numbering such as *"\1, \2"*, etc., for substitution elsewhere in the formula.

- The `:%s/` fragment initiates substitution on all lines of the document.
- The `\\item fragment \(.*\.pdf\)` captures the part of the document name that **follows *\item* and ends with *.pdf*.**
- The fragment `\item \href[pdfnewwindow]{run:..\/\1}{\1}` finally replaces the current line with the desired new format.
- The `\1` callback represents the captured block (the document name), as illustrated in the clarification at the beginning of this paragraph.

##   5. Management of "underline character".

Attention should be paid to the *underlining character* i.e., the *low stroke* ("*\*") that is often used instead of white space, e.g: *DOC_01.pdf* instead of *DOC 01.pdf*.

If the name of the documents to be linked contained such a character, the *LaTeX* language would return an error.

In practice: in the following formula:

```tex
\item \href[pdfnewwindow]{run:./DOC_01.pdf}{DOC_01.pdf}
```

you would get the following error:

```vim
filename.tex|13 error| Missing $ inserted.
```

This error stems from the fact that the underscore character is normally used in *LaTeX* to indicate a *pedice* in mathematical notation while, in the operating system, the same character is used as the "*unifying character*" of the characters that make up document names. In practice, as pointed out above, it is used instead of whitespace in document names.

To avoid the error highlighted above, it is necessary to modify the document names, obviously **before** applying the *RegEx* formula, using the ***escape*** character (*/*).

The *escape* character must precede each *underline character*.

For example, the name "*DOC_01.pdf*" should be changed to "*DOC\_01.pdf*".

It is very simple to create a *RegEx* formula in *Vim* that inserts the *escape* automatically for each underscore character in the document.

Here is the formula that performs such a substitution **globally** in the document.

```bash
%s/_/\\_/g
```

Again, the same formula can be applied to a text selection, using the same rule as described above.

Applying the link creation formula to the document name with *escape* would thus result in,

```tex
\item \href[pdfnewwindow]{run:./DOC\_01.pdf}{DOC\_01.pdf}
```

This neutralizes the mathematical matrix of the *underline character* in *LaTeX*.

##   6. Links within the text

The links can, of course, also be scattered within the documents, as well as in the hypothetical list mentioned above.

To use the list of documents as above processors in other *sparse* places in the main document I, for now, follow basically, two methods: indirect linking and direct linking.

###   6.1. "Indirect linkage" solution:

In the case of **indirect linking** I use a `\label{label_name}` tag to the list item (which, in this case, must necessarily be of type *numbered*) so that I can retrieve the list tagged with the `\ref` tag anywhere in the document.

Basically: at the scattered point to be linked we write "*see Doc. no. \ref{label_name}*" where *label_name* is the same as the one contained in the `\label{label_name}` tag.

###   6.2. "Direct link" solution:

In the case of **direct linking** you *cut* directly to the external link by inserting, at the *sparse* point of the main document, the link *copied* from the relevant list item.

Copying with Vim is very fast: just use, **anywhere on the link to be copied** the composite command `yiW` and paste the fragment at the desired point with `p`.

I also recommend *customizing* the hypertext reference to make it more suitable for interdocument citation, as below.

For example: the fragment `{run:./DOC_01.pdf}{DOC_01\_DOCUMENT_NAME.pdf}` could more simply become `{run:./DOC_01.pdf}{DOC 1}` within the text.

That is: instead of reporting the full name of the document, only the number within the list could be reported.

Thank You for your attention.

