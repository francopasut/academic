---
title: "Vim,  UltiSnips and Honza vim-snippets: difference and management of the snippets and UltiSnips folders"
date: 2022-10-20
slug: vim_honza_snippets_ultisnips
categories:
  - Editors
tags:
  - Vim
  - Snippets
image:
  placement: 3
  preview_only: true 
  caption: 'Honza vim-snippets folders'
---




## What is the subject of this article?

  In this article I will talk about Vim,  snippets powered by  [SirVer UltiSnip](https://github.com/sirver/UltiSnips): "_the ultimate solution for snippets in Vim_" and [Honza vim-snippets](https://github.com/honza/vim-snippets) (hereafter also simply referred as "honza").

 For some more information you can refer to [this previous article of mine](https://francopasut.netlify.app/post/vim_markdown_snippet_url/).


[SirVer UltiSnip](https://github.com/sirver/UltiSnips) is a plugin to launch and manage snippets in Vim.

The application does not contain snippets but you can create your own by following the plugin syntax or use a collection of ready-made snippets.

[Honza vim-snippets](https://github.com/honza/vim-snippets) contains an extensive collection of snippets for various languages.

In fact into the [Honza GitHub repository](https://github.com/honza/vim-snippets) you'll find two separate collections of snippets for the same languages.

What's the difference about them? This is the argument we are going to talk about in this article.

All operations were performed on a computer running the GNU/Linux operating system.

## Honza and the snippets collections

In the Honza vim-snippets GitHub repository you will find, as you can see in the following image,  two different collections of snippets: one list under the folder name *UltiSnips* and  another list under the folder called *snippets*.


![honza folders image](honza-folders-decorated.jpg)

The programmer himself offers these explanations at the top of the GitHub page:

- snippets/*: snippets using snipMate format
- UltiSnips/*: snippets using UltiSnips format

Therefore, the two collections are targeted for two different snippets managers.

## Study on the two lists of snippets

On the `SirVer / ultisnips` page you find this configuration (assuming you are using _Vundle_ plugin manager):

>" Snippets are separated from the engine. Add this if you want them:
>Plugin 'honza/vim-snippets'

When I entered that configuration, however, I only had the availability of the snippets contained in the *snippets* folder and not, instead, those in the *UltiSnips* folder.

I noticed that snippets, even if created for snipMate, also work smoothly with UltiSnips.

The problem is that snippets created specifically for UltiSnips are not, however, used.

To find a solution, I did a lot of research and testing.

Of course, I do not guarantee that this is the only possible solution. It works, though!

Foremost,  I've created a folder locally called "UltiSnips",  but you can call it whatever you want.

Then I entered in *.vimrc* the configuration to activate that folder, with code such as the following (*MyName* is the user name for the operating system):

```vim
let g:UltiSnipsSnippetDirectories = ['/home/MyName/UltiSnips']
```
Finally I downloaded one file, in particular I tried with the `markdown.snippets` folder,  from Honza's UltiSnips collection into the local folder named UltiSnips.

The snippets were all activated and functioning. 

They work even without the `honza.snippets` callback in the .vimrc!

This means that the files in the UltiSnips collection are self-executing. 

Of course, in the latter case the *online honza snippets* are not available.

The *local snippets* work also on selected parts of text: you can apply the snippets in VISUAL mode to use the rest highlighted as a precompiled snippet.

In the local folder you can also easily add custom snippets as well (for this you can read [this article](https://francopasut.netlify.app/post/vim_markdown_snippet_url/).


If, on the other hand, you maintain the callback to `honza/vim-snippets` in the *.vimrc*, then you will have both Honza's online snippets and local snippets with your own additional custom snippets, if any.

I believe this is the most complete solution for having maximum resource availability in every language listed in the Honza folders.

Obviously a big thanks to the manager of the snippets lists,  Mr. Honza Pokorny.

And thank you for your attention.
