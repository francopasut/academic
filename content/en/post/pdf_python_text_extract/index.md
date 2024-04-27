---
title: "Python: application to copy text from various PDFs and collect it into a single document in Markdown format."
date: 2024-04-26
slug:  python_pdf_collect_content_markdown
categories:
  - Blog
tags:
  - Markdown
  - Python
  - PDF
image:
  placement: 3
  preview_only: false 
  caption: 'Python, PDF and Markdown'
---


<p align="center">
  <i>Abstract:</i>
</p>

Simple application in Python to extract text from various PDFs and insert it into a single Markdown document.


- [1. Subject of this article.](#1-subject-of-this-article)
- [2. Python source analysis.](#2-python-source-analysis)
- [3. The full source code in Python.](#3-the-full-source-code-in-python)

## 1\. Subject of this article.

The goal is to obtain a *script* that allows one to collect the text contained in various PDFs generated directly from word processing programs and to insert the various fragments into a single document in Markdown format by separating the  fragments with second-level headings corresponding to the name of the source documents.

The "manual" solution is to copy the text from the individual documents, one by one, and paste it into a second document.

Or you could build a simple application in Python that does all the work automatically, saving an amount of time directly proportional to the number of documents to be processed.

The *script*, generated with the help of Copilot ( because I am not a programmer), requires the installation of the `PyPDF2` library.

Warning: **this article does NOT discuss optical character recognition (OCR).** For that topic you may refer to [my other article](https://francopasut.netlify.app/post/ocr_linux_tesseract/).

## 2\. Python source analysis.

Since this is to be done at the operating system level, it is necessary, first of all, to import the *os* module.

As, then, anticipated above it is necessary to import the *PdfReader* module from the *PyPDF2* library, which must, therefore, be installed before launching the *script*.

So we start with:

```python
import os
from PyPDF2 import PdfReader
```

We must, then, define a variable, here named *pdf_directory*, containing the path to the folder where the PDF documents to be processed are located, replacing the string `path/to/pdf/folder` with the actual path:


```python
pdf_directory = 'path/to/pdf/folder'
```

as well as initialize another variable, empty, intended to collect the various fragments within the document in Markdown format:

```python
markdown_content = ""
```

Now begin (using the functions of the *os* module) the sequence of iterations in the files in the folder indicated in the first variable:

```python
for filename in os.listdir(pdf_directory):
    if filename.endswith('.pdf'):
```

Note: checking that the document name ends in ".pdf".

Then follows the assignment of the path and file name to the *pdf_path* variable:

```python
        pdf_path = os.path.join(pdf_directory, filename)
```

Now the program reads the text of the PDF:

```python
        reader = PdfReader(pdf_path)
        text = ""
```

The following fragment, then, iterates through the pages and adds the text extracted from each page to the *text* variable, separating it by a newline character (`\n`)

```python
        for page in reader.pages:
            text += page.extract_text() + "\n"
```

After collecting content from all pages in each document, the program adds the markdown-formatted content to the `markdown_content` variable:

```python
        markdown_content += f"## {filename}\n{text}\n"
```

The string includes:

- `## {filename}` which inserts the filename as the second-level title in Markdown. Note the *double hash mark* which is the second-level title symbol according to the Markdown standard.
- `\n` adds a new line after the document title.
- `{text}` includes the text content extracted from the various pages.
- `\n` adds a new line at the end of the content.

At the end, the result of the operation is saved in a document in Markdown format:

```path
with open('extracted_content.md', 'w', encoding='utf-8') as md_file:
    md_file.write(markdown_content)
```

and a final message with the result of the operation is printed on the screen:

```python
print("The contents of all PDF files were successfully extracted and saved in extracted_content.md")
```

## 3\. The full source code in Python.

Here is the full source:

```python
import os
from PyPDF2 import PdfReader

pdf_directory = 'path/to/pdf/folder'

markdown_content = ""

for filename in os.listdir(pdf_directory):
    if filename.endswith('.pdf'):
        pdf_path = os.path.join(pdf_directory, filename)
        
        reader = PdfReader(pdf_path)
        text = ""
        
        for page in reader.pages:
            text += page.extract_text() + "\n"
        
        markdown_content += f"## {filename}\n{text}\n"

with open('extracted_content.md', 'w', encoding='utf-8') as md_file:
    md_file.write(markdown_content)

print("The contents of all PDF files were successfully extracted and saved in extracted_content.md")
```

Now we have a Markdown document containing text fragments collected from various other documents. 

The Markdown document can be edited with one of the writing systems described in the article [Markdown with Vim, Emacs, Sublime Text 4, and Visual Studio Code](https://francopasut.netlify.app/post/markdown-vim-emacs-sublime-vscode/).

The program is very simple but, to the best of my knowledge, it does its job correctly. 

Thank you for your attention.
