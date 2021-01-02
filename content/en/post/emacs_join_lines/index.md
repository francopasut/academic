---
title: "Join lines in Emacs using US International Dead Keys layout"
date: 2020-08-08
canonical_url: "https://francopasut.github.io/editors/emacs-joinlines/"
slug: emacs_join_lines
categories:
  - Editors
tags:
  - Emacs
image:
  placement: 3
  caption: 'Emacs green logo'
---

{{% toc %}}


## Join-lines: Vim vs Emacs ##

_Vim_ has a very simple system to join two lines. All you have to do is press the `J` (uppercase) key inside the line above.

In _Emacs_, instead, you must use the `C-^` binding in the lower line.

But the _Emacs_ solution  may seem  a bit more laborious if you use a keyboard with _US International Dead Keys_ layout in MS Windows or GNU/Linux.

However, with a few small adjustments, it can become super-efficient.

What follows is my solution but, of course, everyone can find another one.

## Caret or Circumflex  ##


First of all we need to  take a look at the _US International Dead Keys_ keyboard layout for the  key corresponding to the _number 6_ and,  in specific to the two similar characters indicated on the top of the key.


 ![Figure 1](/img/tasto_6_US.png "The correct character is the one at the top right in the middle square")



You can see that on the _number 6_ button there are two similar characters: `^` (small) and `^`. 

Both are the same character, i.e. _Caret_ or _Circumflex_.

The difference is in the use: the first one is used for compound characters, like _â, ê_, etc.

The second, instead, is used as an stand-alone character.

For the combination `C-^`  must be used the second version: the _circumflex_ as a stand-alone character.


## The original keys binding ##

The original keys binding to join two lines is apparently very simple: `C-^` in the below line (Please remember the difference with _Vim_ in which the `J` button is typed in the upper line).

But in the _US International Dead Keys Layout_ you must press three keys to obtain the `^` stand-alone character, _Shift + Alt Gr + 6_, and, then, add the _Control_ key, as you can see in the following images:



![Figure 2](/img/combinazione_mani.jpg "Like on a piano, side view")


![Figure 3](/img/combinazione_mani2.jpg "Like on a piano, top view")


Doesn't that look like a _piano finger articulation_?


It's indeed not very immediate to get.

This is one of the cases where it is best to change the original keyboard binding.

## An alternative binding ##

It is very simple to set an alternative binding to achieve the desired result.

The best solution is to create a binding not already used by Emacs.

For example the binding  `C-,` (Control + comma) can be very efficient because it's easy to reach and available in the original  Emacs configuration.

To obtain such a combination simply enter the following code in the _.emacs_ configuration file:

``` elisp
(global-set-key (kbd "C-,") 'join-line)
```

After restarting Emacs, simply use the new `C-,` binding in the bottom line to combine it with the top line.

Thank you for your attention.

Originally published at [my Notebook](https://francopasut.github.io/editors/emacs-joinlines/)

