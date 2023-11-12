---
title: "Vim: delete sentences and paragraphs via Text Objects"
date: 2021-04-20
canonical_url: "https://medium.com/@francopasut/vim-delete-sentences-and-paragraphs-via-text-objects-21d55a883e7b"
slug: vim_delete_sentences
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  caption: 'Vim logo'
---

{{% toc %}}

<style>
table {
    border-collapse: collapse;
}
table, th, td {
   border: 1px solid black;
}
blockquote {
    border-left: solid blue;
    padding-left: 10px;
}
</style>


## Vim reduces the strain on your eyes 

An unbelievable feature of Vim is the ability to perform operations within entire blocks of text called "*Text Objects*", such as words, sentences and paragraphs, regardless of the cursor position inside the objects.

This means you can place the cursor randomly within the blocks and reduce the strain of your eyes towards the monitor.

**Sentence** and **paragraph** deletion operations provide an excellent way to understand how these feature works.

## Sentences and paragraphs 

Vim has a detailed definition of *sentences and paragraphs*.

Here are the technical definitions (from the [official
manual](http://vimdoc.sourceforge.net/htmldoc/motion.html#sentence)):

> A **sentence** is defined as ending at a \'.', \'!\' or \'?\' followed
> by either the end of a line, or by a space or tab.

> A **paragraph** begins after each empty line.

The *text object* symbol for a *sentence* is the `s` character. For a *paragraph* is the `p` character.

If you want to perform operations involving the entire block of text **regardless of the position of the cursor** you must add the character `i`(inner o inside the object) or `a` (around the object).

The possible constructs are as follows:

| Text obj | Meaning              |
|----------|----------------------|
| `is`     | *inside* a sentence  |
| `as`     | *around* a sentence  |
| `ip`     | *inside* a paragraph |
| `ap`     | *around* a paragraph |


What´s the difference between *inside* and *around*? The **white spaces**.

-   `i` leaves white spaces after the subject unchanged]{#8e2c}
-   `a` extends the operation by including any white space up to the next object]{#39bc}

To perform the operations you only need to add the commands such as *d*(elete) *c*(hange) or y(*ank*, copy).

Here is the list of command combinations to delete a text object:

| Command | Operation                   |
|---------|-----------------------------|
| `dis`   | delete *inside* a sentence  |
| `das`   | delete *around* a sentence  |
| `dip`   | delete *inside* a paragraph |
| `dap`   | delete *around* a paragraph |

You can also double or multiply the effect by preceding it with a number, e.g. `2dap`.

The same operation can be, of course, applied to the other commands.

## Examples with animations

The following GIF animations are created with *Screenkey* and *Peek* in Arch Linux operating system (remember that the cursor can be anywhere within the text block, not necessarily at the beginning).

Here is the result after entering the combination `dis`: note the white spaces after the deletion of the FIRST sentence.

![](vim_delete_sentences_1.gif)

Here is the result for `das`: now every white space after the FIRST sentence is deleted.

![](vim_delete_sentences_2.gif)

And now the result for `dip`: note the three blank lines after the deletion of the first paragraph.

![](vim_delete_sentences_3.gif)

Finally, here is the result for `dap`: every blank line after the first paragraph is deleted and the *focus* is pointed on the second paragraph.

![](vim_delete_sentences_4.gif)

By using Text Objects in Vim you can really save a lot of time and some of your eyes!

Thank you for your attention.




[Originally published ad Medium](https://medium.com/@francopasut/vim-delete-sentences-and-paragraphs-via-text-objects-21d55a883e7b)

