---
title: "Vim, flash movements between windows with EasyMotion"
date: 2020-08-11
canonical_url: "https://francopasut.github.io/editors/vim-easymotion/"
slug: vim_easymotion
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  caption: 'Vim like a lighting bolt'
---


{{% toc %}}



## Quick introduction

Vim can quickly jump through different  documents at a lightning speed.

Do you remember when you had to move  the cursor using the arrow keys and pressing them continuosly until the final point?

If you use Vim, the above actions  will be only bad memories. 

You only have to install the [EasyMotion](https://github.com/easymotion/vim-easymotion) plugin and make a miniml configuration. 




## Installation and configuration of *EasyMotion*

The *EasyMotion* plugin installation is really a kid's joke. 

If you use [Vim Plug](https://github.com/junegunn/vim-plug) as your *plugin manager*, actually it's my favourite one, you only have to insert in  your *.vimrc* the following text strings:

```vim
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
```

The strings must be written between the following delimitators:

-   `call plug#begin('~/.vim/plugged')`
-   `call plug#end()`

At this point you only have to digit the command `:PlugInstall`. That's all. 

If you use other  plugin managers the above operations could be a little different.

After the installation you must configure the plugin following the instruction in the [developer page](https://github.com/easymotion/vim-easymotion).

I report my current setup: 

```vim
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

function! s:incsearch_config(...) abort
return incsearch#util#deepextend(deepcopy({
	\   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
	\   'keymap': {
	\     "\<CR>": '<Over>(easymotion)'
	\   },
	\   'is_expr': 0
	\ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
```
It's not a problem if you don't know the specific meaning of the code: you can simply copy and paste the code in your *.vimrc* configuration file. 




## Use of *EasyMotion* in Vim

It is also very easy to use the plugin. 

To aim at the point where you want to jump, you must look at the text and identify one or more characters at the desired point. 

Then you must press, in Normal Mode, one of the following commands: 

1.  `\f` to jump to a single character
2.  `\s` to jump to a double character
3.  `/  + string search` to jump to a complete text string

Following the instructions you will have a series of letters on top of the tex: those are the *target points* that you can reach by pressing the corresponding letter. 

You can jump everywhere both in the same document and in other documents open in your monitor.

You only have to press the letter pointed where you need to go. That's all!




## Examples with images

Some images could be very useful.

In the first image you can see the result or a single character search with
the following command: `\f + <one letter>` ("\\" is the default _\<Leader\>_).

In this example I'm going to search the "o" letter:

![Figure 1](/img/barra-f.png "Search example with  *Leader*-f")

In the second example you find ad example of a _double character search_ with the command `\s + <two letters>`. I'm going to search the letters *qu* together.

![Figure 2](/img/barra-s.png "Search example with  *Leader*-s")



You can also use the ordinary Vim search, or the combination of `/ + <word>`.

In the following image you can see the result of the following
search `/ + "justo"`. 

![Figure 3](/img/barra-cerca-justo.png "The effect of the plugin in the ordinary Vim search.")

Then I can type  the _target_ letter *d* and I will get
the  result in the following image.

Please,  see the cursor position exactly under the previous *d* target letter.

![Figure 4](/img/barra-cerca-justo-evid.png "Example of Vim search with words highlighted")




## In brief

In Vim you can use the *EasyMotion* plugin to jump at any point in any
document visible in the mosaic of your Vim desktop windows. 

Thank you for your attention

Originally published at [my Notebook](https://francopasut.github.io/editors/vim-easymotion/)


