---
title: "LaTeX: creating and using variables to save time and reduce typing errors"
date: 2021-09-15
slug: latex_variables
categories:
  - Documents
tags:
  - LaTeX
image:
  placement: 3
  preview_only: true 
  caption: 'stylised LaTeX logo'
---




## Variables and legal documents

My work consists of writing legal documents.

Legal documents are full of data and many of them  have to be repeatedly inserted.

Think, for example, about the names of people or of places, dates of events, etc.

A method is needed to avoid manually repeating recurring data when writing documents, both to avoid wasting time and typing errors.

A good system is to use "variables", i.e. placeholders that take on different values depending on the documents in which they are inserted.

Almost every digital writing system has its own management of "variables".


## LaTeX and variables

I use [LaTeX](https://www.latex-project.org/) to write my legal documents.

In my humble opinion, it's the best system for the production of technical,  scientific and also  legal documents!

The management of variables in LaTeX is closely related to the management of commands.

As you can create "*new commands*" to expand the system, you can use the same method to create text variables that you can insert anywhere in your documents.

So, the solution is to use the `newcommand` command to create any variables you need.

## Using "newcommand" to creare your own variables

It's really easy to create a variable with `newcommand`,  it is enough to respect the following syntax:

```latex
\newcommand{\variablename}{content_of_variable}
```

In the above string you can see three parts:

1.  the first part shows the backslash and the command to create other commands: `\newcommand`
2.  the second part shows the creation of the variable that, as every LaTeX command, needs the backslash before it: `\variablename` 
3.  in the the third part  content is assigned to the variable. Here you can insert text or numbers that will be printed in place of the variable.

The string must be inserted in the _preamble_ of the LaTeX document.

You can now write the  `\variablename` as a placeholder everywhere among the `begin/end{document}` tags and LaTeX will automatically replace the variable name with its effective value during compilation.

If you need to get a white space after the word in the compiled document you must add another   _backslash_ character at the end of the *placeholder*:  then the string `\variablename` becames `\variablename\`.

But if the placeholder ends with a dot or other punctuation marks, you must not add the backslash ad the end of it.

Thak You for Your attention.
