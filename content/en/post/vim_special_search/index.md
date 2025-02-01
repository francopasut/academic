---
title: "Vim: searching for text containing a slash or a question mark"
date: 2021-10-01
canonical_url: "https://francopasut-en.blogspot.com/2021/01/vim-searching-for-text-containing-slash.html"
slug: vim_special_search
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: true 
  caption: 'Vim logo'
---



## Vim: the search command

To activate a text search in Vim, press one of the following *trigger
keys* in your keyboard:

-   the slash `"/"` key (do not confuse with the back-slash `"\"` key)
-   the question mark key.

By pressing the slash `"/"` key will activate a forward search.

By pressing the question mark `"/"` key will activate a backward search.

To move the cursor to the results in your document, press the `"n"` key
(mnemonic for "*next*"). To invert the direction of the cursor, press
the `"N"` key, *("upper n")*.

What about if you need to search for a *slash* or a *question mark*,
i.e. the same *trigger characters*, in your document?

You can prepend the *Escape character* to the trigger key.

## The Escape character

The *Escape character* is the *back-slash* key: `"\"`.

Just an example: if you need to forward search (then with `/` trigger
key) the string `/test` you need to write `\/test`in the search field.

Similarly, if you need to backward search (then with `?` trigger key)
the string `?test` you need to write `\?test` in the search field.

Below, a little summary table (the firts character in the "search
string" column is the *trigger* key):

|  searched string  | trigger+search string |
|  -----------------| --------------------- |
|  /test            | `/\\/test`              |
|  ?test            | `?\\?test`              |

## The "inverse search" trick

You can use a little "trick" in Vim to avoid the *Escape character* by
inverting the trigger key.

In this case the search string would be as follows:

| searched string   | trigger+search string   |
| ----------------- | ----------------------- |
| /test             | `?/test`                  |
| ?test             | `/?test`                  |

Wouldn't the research go in the opposite direction of what was intended?

Yes, but you can use the `"N"`, (*upper n*) to *invert the inverse
search*.

Than you for your attention.
