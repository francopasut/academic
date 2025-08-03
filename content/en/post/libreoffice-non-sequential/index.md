---
title: "LibreOffice Writer and non-sequential page numbering."
date: 2025-08-02
slug:  libreoffice_non_sequential
categories:
  - Blog
tags:
  - LibreOffice
  - Writer
image:
  placement: 3
  preview_only: false 
  caption: 'Non sequential pages'
canonicalUrl: https://francopasut-en.blogspot.com/2025/08/libreoffice-writer-and-non-sequential.html
---



- [1. Subject of the article.](#1-subject-of-the-article)
- [2. How to insert a page number other than 1.](#2-how-to-insert-a-page-number-other-than-1)
- [3. Change the page number when inserting a page break.](#3-change-the-page-number-when-inserting-a-page-break)
- [4. The common denominator.](#4-the-common-denominator)


# 1. Subject of the article.

LibreOffice is an open source, multi-platform suite for document processing.

Great for writing, calculating, drawing, and much more. 

The reference page in English can be found at [this page](https://libreoffice.org/).

Writer is the module of the Suite dedicated to word processing.

This article is not a tutorial on how to use the LibreOffice Writer module, for which there are numerous pages on the internet, but focuses on a specific feature that, although perfectly efficient, initially caused me some confusion: **non-sequential page numbering**.

I would therefore like to share some considerations that may be useful.


# 2. How to insert a page number other than 1.

The first difficulty came when  I had to change the numbering of the first page of a document by inserting  a number other than 1.

Below is a paraphrase of the original instructions with the addition of  a clarification.

1.  ****Click at the beginning of the document****,
2.  Go to the top menu, select ****“Format”**** and then ****“Paragraph&#x2026;”****.
3.  In the window that opens, find  the tab labeled ****“Text Flow”**** and click on it.
4.  The section called ****“Breaks”**** is disabled. To change the page number, you need to enable some options.
5.  First, you need to check the box next to  ****“Insert”****.
6.  Then, check the box labeled ****“With page style”**** and choose a style (for example, “Default page style”).
7.  At this point, you can activate the ****“Page number”**** box and enter a number other than 1.
8.  Click ****“OK”****.

To display the page number, you must, of course, use the main menu item “/Insert / Page Number&#x2026;/”.

Done! Now the document will start with the numbering other than 1 that you have entered and will maintain the new sequence with the subsequent pages.



# 3. Change the page number when inserting a page break.

Another difficulty came when I had to create a manual page break with a non-sequential number.

To change the page number after a page break, it is not enough to use the Insert - Page Break (*Ctrl+Enter*)  option in the top menu.

This command actually adds a new page but **continues the numbering from the previous page**.

In other words: if the displayed page had the number 1, creating a new page with “Page Break” (*Ctrl+Enter*) would result in a page numbered 2.

To create a new page with numbering independent of the previous page, follow the different procedure described below:

1.  Press “Insert.”
2.  Immediately after, press “More Breaks” followed by “Manual Break&#x2026;”.
3.  In the window that opens, select or leave selected the “Page Break” radio button.
4.  In gray, and therefore not selectable, you will see the words “Change page number” associated with a checkbox.
5.  To activate the checkbox, select the Page Style box and choose a style, for example, “Default Page Style.”
6.  At this point, you can activate che *check box* to modify the number of the new page.

![img](./insert_break_writer_en.png)

In this case too, the subsequent pages will retain the new numbering sequence.

The numbering of the pages preceding the break will not be changed.

To change the numbering of the existing section, use the same procedure described in the previous paragraph [2](#2-how-to-insert-a-page-number-other-than-1).


# 4. The common denominator.

Between the two operations, i.e., the one described in the paragraph [2](#2-how-to-insert-a-page-number-other-than-1) and the one described in the paragraph [3](#3-change-the-page-number-when-inserting-a-page-break), there is a **common denominator**: the need to choose a “page style” before activating the desired numbering.

LibreOffice Writer needs to know the page style before allowing you to change the page number.

Keeping this common denominator in mind makes it easier to remember the two different operations described above for changing page numbers.

Thank you for your attention.

