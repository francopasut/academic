---
title: "Two open source tools for editing PDF documents: GUI versus CLI."
date: 2026-01-08
slug:  arranger_pdftk
categories:
  - Blog
tags:
  - PDF
image:
  placement: 3
  preview_only: false 
  caption: 'Monitor'
canonicalUrl: https://francopasut-en.blogspot.com/2026/01/two-open-source-tools-for-editing-pdf.html
---


- [1. Introduction](#1-introduction)
- [2. Managing operations with PDF Arranger](#2-managing-operations-with-pdf-arranger)
- [3. Managing the same operations with PDFtk.](#3-managing-the-same-operations-with-pdftk)
- [4. In summary](#4-in-summary)


# 1. Introduction

The “PDF” is the essentially static document format par excellence.

However, even PDF documents can be modified, especially with operations such as deleting, adding, reversing pages, inserting text, and more.

There are various applications, including free ones, for performing these operations.

In this article, I will report some parallel observations between two systems for page manipulation: one graphical, PDF Arranger, and one command line, PDFtk.

[PDF Arranger](https://github.com/pdfarranger/pdfarranger) is a free and open source application (a fork of PDF-Shuffler) ideal for merging, splitting, rotating, and cropping PDF files in an intuitive way.

[PDFtk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/) is one of the most powerful tools for manipulating PDFs in command line mode.

I would like to point out that this article does not claim to be exhaustive on the two systems mentioned, but is only intended as a basis for comparison.

The “real-life” operations considered in the article are: concatenating (i.e., merging) individual PDFs into a multi-page PDF, separating the pages of a multi-page document into individual pages, and rotating an internal page of a multi-page document.


# 2. Managing operations with PDF Arranger

The first operation is to merge several PDF documents into a single PDF document.

To proceed with the examples, I created three test documents, each consisting of a single page containing only a large number.

PDF Arranger makes this operation extremely intuitive: just press the “Open” icon at the top left and select the separate documents while holding down the Shift key, then press Open in the selection window.

Then select the documents to be merged and right-click (or, if using a laptop with a touchpad, tap with two fingers) and choose Export - Export Selection to a Single File, as shown in the image below.

![img](./arranger-merge-en_20251228.png)

At this point, choose a name for the merged document and save it.

It's all very simple and intuitive.

The opposite operation is, of course, **splitting a multi-page PDF document into individual single-page PDF documents**.

This operation is also very simple with PDF Arranger.

Simply open the document from the application, select all the pages to be split, and right-click on the mouse to select *Export - Export selection to individual files*, as shown in the following image:

![img](./arranger-separation-en-20251228.png)

Please note that in the image above, the document is originally a single document consisting of three pages.

In practice, this is the document obtained previously by merging three separate documents, each consisting of one page.

One last simple operation is the **rotation of a page within a multi-page PDF document**.

Select the page (or pages) to be rotated, right-click and choose Rotate Left or Rotate Right.

![img](./arranger-rotate-left-en-20251228.png)

You can also use the shortcut shown next to the menu item, as shown in the previous image.

At this point, save and exit the application.

With a little imagination, you can easily perform all the operations of assembling, disassembling, and reassembling documents.


# 3. Managing the same operations with PDFtk.

PDFtk makes these operations slightly more complex but, in return, offers faster execution than any graphics manager, including PDF Arranger.

To perform the first operation described above, i.e., merging three PDF documents into one, simply enter the sequence of documents, in this case named 1.pdf, 2.pdf, and 3.pdf, as shown in the following diagram:

    pdftk 1.pdf 2.pdf 3.pdf cat output 123.pdf

Step-by-step description:

-   Start by launching the application command, i.e., `pdftk`
-   Enter the sequence of individual documents to be merged: in the example, `1.pdf 2.pdf 3.pdf`
-   Send the command for the type of operation, in this case `cat`, which “concatenates” the previous documents.
-   Add the command `output`, which indicates the name assignment operation: in the example, `123.pdf`.

With a single command, you can perform  an operation that previously required at least four steps (opening documents, selecting, menu command, naming)!

The time saved is directly proportional to the number of operations to be performed.

Even simpler is the operation of separating a multi-page document into the individual pages that compose it:

    pdftk 123.pdf burst

The system itself assigns a sequential name to the individual documents obtained from the operation.

The names are of such types as: pg<sub>0001.pdf</sub>, pg<sub>0002.pdf</sub>, etc.

The operation of rotating one page among others is slightly more complex.

Here is the example corresponding to the third operation performed in the previous chapter:

    pdftk 123.pdf cat 1 2east 3-end output file_name.pdf

Analysis:

-   `pdftk`: command launch.
-   `123.pdf`: name of the multi-page document to be processed.
-   `cat`: concatenation operation. Understanding this step is essential: the operation is performed by creating a new concatenation in which some internal documents are rotated.
-   This is followed by the pages of the document: both those that are not modified and those that are to be modified. In this case:
    -   The first page is not modified.
    -   The second page is rotated 90 degrees eastward, basically a quarter turn clockwise.
    -   The third page is not modified.
    -   In this example, I have also included the `-end` operator, which would concatenate any additional pages after the third and up to the end of the document. Obviously, in this case, the addition is for demonstration purposes only.
-   `output`: command for assigning the name, which is then specified in the following: `file-name.pdf`.

Despite the apparent greater complexity of the command, the operation is quite intuitive and,  with a little practice,  the command sequence is compiled instantly.

So, even in this case, the operation is much faster than the graphical equivalent.


# 4. In summary

Even when it concerns PDF management, the historical dualism between Graphic User Interface and Command Line Interface reappears.

The former is more intuitive, but the latter is faster.

It is a matter of knowledge and personal choice.

Thank you for your attention.

