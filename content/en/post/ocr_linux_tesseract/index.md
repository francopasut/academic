---
title: "Powerful OCR system under GNU/Linux for PDF documents managed from command line and with refinement by Vim."
date: 2023-06-26
slug:  ocr_linux_tesseract
categories:
  - Blog
tags:
  - PDF
  - OCR
  - Linux
  - Vim
image:
  placement: 3
  preview_only: true 
  caption: 'Optical Character Recognition'
---




## Introduction.

The idea came from reading [this article](https://www.howtogeek.com/682389/how-to-do-ocr-from-the-linux-command-line-using-tesseract/) about optical character recognition (OCR) in the GNU/Linux environment from images and PDF,  managed from the command line.

Obviously, PDF documents are those scanned from paper original, i.e., not obtained by direct saving of document in digital format. For the latter, no OCR is needed.

The article is very well written and the end result is very good.

I wondered if it would be possible to aggregate all the steps into a single text command.

In this article I report my solution.

Next, then, I added some con *RegEx* steps by Vim to reformat the raw result of optical recognition.

Again, I tried to combine several separate formulas into a single regular expression.

So the goal is to use one text command and one regular expression with Vim to achieve good optical recognition in GNU/Linux environment.

## The installation of components.

The system engine is *Tesseract*, the installation of which, well described in the reference article, is done as follows:

- On Debian and derivatives, including Ubuntu and Mint: `sudo apt-get install tesseract-ocr`.
- On Fedora: `sudo dnf install tesseract`.
- On Arch and derivatives, including Manjaro and EndeavourOS: `sudo pacman -S tesseract` or `yay -S tesseract`.

Please note: for the "family" *Debian* the component is named *tesseract-ocr* while for other distributions, simply *tesseract*.

For the installation of additional languages it is necessary to use the system already indicated for each distribution by pointing to one of the language codes [indicated on this page](https://github.com/tesseract-ocr/tesseract/blob/main/doc/tesseract.1.asc#languages), taking into account some semantic differences between the various distributions, as indicated below in the case of the data related to the Italian language:

- On Debian and derivatives, including Ubuntu and Mint: `sudo apt-get install tesseract-ocr-ita`.
- On Fedora: `sudo dnf install tesseract-langpack-ita`.
- On Arch and derivatives, including Manjaro and EndeavourOS: `sudo pacman -S tesseract-data-ita` or `yay -S tesseract-data-ita`. Arch also makes it possible to install data along with the basic program.

It is also necessary to verify that the *pdftoppm* software, which is part of the *poppler-utils* package, is present in the system.

The test is very simple: just type `pdftoppm -help`. If present, it will respond with the various options available.

If not, you will need to install the whole package:

- On Debian and derivatives, `sudo apt install poppler-utils`.
- On Fedora: `sudo dnf popple-utils`.
- On Arch and derivatives: `sudo pacman -S poppler` or `yay -S poppler`.


## OCR of PDF documents with "tesseract": description of steps.

This is the outline of the steps to achieve the result:

- **Objective**: submit documents in PDF format to optical recognition (OCR).
- **Problem**: *tesseract* operates only on images and not, instead, on PDF documents.
- **Solution**: some operations need to be performed on PDF documents before and after optical recognition, as follows:
    - transform PDFs into images, separating any multiple pages into single images,
    - apply OCR software to each individual image resulting in many separate text documents, 
    - reassemble the individual text documents to reconstruct the original sequence of the source document.

It sounds tricky, but it really isn't at all if you understand the specific function of each step.

## The single steps.

Here are the steps, assuming the document to be processed is named *document.pdf*:

1. `pdftoppm -png document.pdf document` to transform PDFs into PNG-format images (note the `-png` option) by splitting each page into a single file with progressive numbering.
2. `for i in document-*png; do tesseract "$i" "text-$i" -l ita; done;` creates a *loop* that applies *tesseract* to each individual image and generates a text document named *text-document-* followed by progressive double-digit numbering.
3. `cat text-document* > document.txt`, to recompose all the individual text documents generated by optical recognition into a single document.

In step #2 I use the command `for i in document-* ...` to allow the system to run regardless of the number of documents to be processed.

## Everything in one command!

And here is the part that accomplishes the first goal of this article: concentrating all steps in a **one command**!

I create a *file* that I name *ocr.sh* (but, of course, that could have any other name).

I insert the following *script* into the file:

```bash
pdftoppm -png document.pdf document 
for i in document-*png; do tesseract "$i" "text-$i" -l ita; done; 
cat text-document* > document.txt
rm document-*
rm text-document-*
```
The last two lines, namely: 

```bash
rm document-*
rm text-document-*
```

automatically delete scattered *files* generated during the optical recognition process and no longer needed after merging the text into *document.txt*.


I make the file executable with `chmod u+x ocr.sh`, for the *owner* or `chmod a+x ocr.sh` for *all users*.

I launch the command having a PDF document named `document.pdf` present in the same folder as the executable.

**The whole process happens in total automatism**: at the end I find the result of the optical recognition in the file *document.txt*.

In other words: the whole procedure will happen in automatic sequence, from the first to the last formula, and, at the end, we will find a document named *document.txt* with the optical recognition extracted from the above sequence.
 
If any error occurs during the process, the *script* would be interrupted with a message identifying the problem (for example: the lack of language form), so that the problem can be corrected.

## And now: Vim with RegEx.

And now we can use the power of Vim with RegEx to make the raw result of optical recognition more readable and manageable.

Specifically:

1. Eliminate all carriage returns on each line, keeping only the blank lines intact.
2. Reduce all redundant blank lines between paragraphs to one.
3. Eliminate redundant white characters within the text.

The fomulas in RegEx for each of the above tasks are as follows:

1. `:%s/.\+\zs\n\ze./ /`
1. `:g/^\s*$\n^\s*$/d`
1. `:%s/\s\+/ /g`

The first search string always finds a positive match in the generated document since a forced carriage return is always added to the end of each line.

The other two search strings may not find any positive match in the generated document and in this case would give the result "*pattern not found*".

The above, can be launched in a single command (the second goal!) including all the previous ones, ([using the pattern described on this page](https://stackoverflow.com/questions/59551215/multiple-vim-regex-command-in-one-line)):

```bash
:%s/.\+\zs\n\ze./ / | :g/^\s*$\n^\s*$/d | :%s/\s\+/ /g
```

Warning: in this case the *script* would be interrupted if the second or third (as anticipated above) search string did not find a match, that is, respectively, if there were no redundant lines or spaces in the document.

At this point, if the interruption occurred at the second string, one could consider, if necessary, launching the third *script* separately to clean up the internal spaces in the document.

## In Conclusion.

At this point we have achieved our stated goals of obtaining a high-quality optical recognition system in GNU/Linux, managed at the command line with a single command for the optical recognition phase and a single *RegEx* function in Vim for formatting the result.

Thank you for your attention.
