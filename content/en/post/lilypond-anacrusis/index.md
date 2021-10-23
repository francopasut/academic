---
title: "Lilypond: anacrusis, tuplets, multiple voices"
date: 2021-10-23
slug: lilypond_anacrusis_tuplet
categories:
  - Music
tags:
  - Lilypond
image:
  placement: 3
  preview_only: false 
  caption: 'Scriabin, Sonata op. 19'
---

{{% toc %}}


## A very short introduction

[Lilypond](http://lilypond.org/) is an incredible and powerful language for writing music scores. 

Every musician should learn it.  But writing code is more suitable for programmers than for musicians and many attempts have to be made to write complete scores.

In this post I show you some coding snippets regarding _anacrusis, tuplets and multiple voices_ (If you're reading this article you know what  they are).

Here is the basic patterns for each of them in Lilypond language:

| Musical item  | Lilypond pattern                                                                              |
| ------------- | -------                                                                                       |
| Anacrusis     | `\partial x` followed by a `x` duration note                                                  |
| Tuplets       | `\tuplet x/y {n1 n2 n3}`: n(1, 2, 3) are the notes with "x" total duration instead of "y"     |
| Multiple voices        | `<< {musical expression 1} \\ {musical expession 2}`, that's the *double backslash construct* |


## Colored items in a real score

In the image shown at the top of the page you can see a fragment of a real score,  limited to the first two measures, from  the *Piano Sonata No. 2 op. 19*, Sonate-Fantaisie,  by Alexander Scriabin (Aleksandr Nikolaevič Skrjabin).


Colors identify musical elements as follows:

| Musical item  | Color            |
| ------------- | -------          |
| Anacrusis     | Red              |
| Tuplets       | Blue             |
| Multiple Voices        | Blue and Magenta |

I used the color blue to highlight both the tuplets  and the outer voice (magenta for inner voice).

## Analysis of elements

The ***anacrusis***, in this example, is realized by two simultaneous notes with the same duration.

The pattern for contextual notes having the same duration, such as octaves or chords, is the following `< ... >`.

So the fragment ( without dynamic indications) for right and left hand, including simultaneous notes, is as follows:


```
right = \relative c'' { \partial 16 < dis,, gis dis' >16 }

left = \relative c' { \partial 16  < gis,,  gis' >16 }
```


The ***tuplets*** (*triplets*) are, in this score,  a little more complicated: double notes (coloured blue) and separate inner voice (coloured magenta).

Here is the code for the tuplet only, without the inner voice, from the first measure:


```
\tuplet 3/2 {  < gis, gis'>8 < gis gis' > < gis gis' >  }  
```


Now  the code for the tuplet only, without the inner voice, from the second measure:

```
\tuplet 3/2 {  < fisis, fisis'>8 < fisis fisis' > < fisis fisis' >  }  

```

Now the  ***multiple voices***.

Here is the code for the tuplet and the inner voice from the first measure:

```
{
<< 
\tuplet 3/2 {  < gis, gis'>8 < gis gis' > < gis gis' >  }  
\\ 
< dis' eis >4 
>>
}
```


And finally,  the code for the tuplet and the inner voice from the second measure:

```
{
<< 
\tuplet 3/2 {  < fisis, fisis'>8 < fisis fisis' > < fisis fisis' >  }  
\\ 
dis'4 
>>

}

}
```

Thank you for your attention.
