---
title: "Vim and snippet lists for UltiSnips and other plugins."
date: 2024-06-20
slug:  vim_snippet_ultisnips_snipmate
categories:
  - Blog
tags:
  - Vim
  - Snippets
image:
  placement: 3
  preview_only: false 
  caption: 'UltiSnips Honza vim-snippets snipMate'
---


<p align="center">
ABSTRACT
</p>

Article about the different collections of snippets designed for different plugins of Vim and the possibility of converting from type of format to another.


- [1. Preamble](#1-preamble)
- [2. Steps for using snippets](#2-steps-for-using-snippets)
- [3. Local custom snippets.](#3-local-custom-snippets)
- [4. *Honza*: Why two different collections of *snippets*?](#4-honza-why-two-different-collections-of-snippets)
- [5. Overview of both  collections.](#5-overview-of-both--collections)
- [6. Is it possible to "mix" the snippets of the two collections?](#6-is-it-possible-to-mix-the-snippets-of-the-two-collections)


## 1. Preamble

In the article ["Vim, UltiSnips and Honza vim-snippets: difference and management of the snippets and UltiSnips folders"](https://francopasut.netlify.app/post/vim_honza_snippets_ultisnips/) I have already covered the topic of *snippets* and *UltiSnips* for Vim:

This article is a refinement of the previous one, especially from the aspect of syntactic differences and the possibility of "mixing" together various code fragments from the  collections of *snippets*.

## 2. Steps for using snippets

For the introduction part about *UltiSnips* and *Honza vim-snippets* I refer to my previous article mentioned above.

I briefly summarize the steps:

1. **Installing UltiSnips**:
   - Using a plugin manager such as `vim-plug`, you need to add this line to your configuration file (`.vimrc` or `init.vim`):

     ```vim
     Plug 'sirVer/ultisnips'
     Plug 'honza/vim-snippets'
     ```
     In the case of other *plugin managers* the specific procedure provided should be used.

2. **Configuration of Vim**:
   - Installation is not enough. The following lines must also be added to the Vim configuration to load the `UltiSnips` snippets:


     ```vim
     let g:UltiSnipsSnippetDirectories=["UltiSnips"]
     ```
3. **Restart Vim**:
   - At this point simply restart Vim or run `:source ~/.vimrc` to load the new settings.

With this configuration, `UltiSnips` will automatically load the *snippets* in the `UltiSnips` folder of the *repository* `honza/vim-snippets`.

Here is an example of a complete configuration for Vim with `UltiSnips` and the snippets from the `honza/vim-snippets` repository:

```vim
call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

```

## 3. Local custom snippets.

You can add custom *snippets* locally by creating a folder and collection for each type of *snippet*. 

As an example, for Markdown, you would create a file named `markdown.snippets` within a dedicated folder that could, for example, be named `UltiSnips` under the `home` folder, as in the example below:

```bash
mkdir ~/UltiSnips
cd UltiSnips
touch markdown.snippets
```

Again, I recall a previous article of mine: [Vim, Markdown, Snippets, UltiSnips: how to get a well-formatted link with a single command](https://francopasut.netlify.app/post/vim_markdown_snippet_url/) with an example of a custom *snippet*.

We need, then, to adjust the configuration in `.vimrc` to load both the snippets from the `honza/vim-snippets` repository and the custom ones:

```vim

let g:UltiSnipsSnippetDirectories=["~/UltiSnips", "UltiSnips"]

```
Note that the first configuration invokes a local directory, while the second invokes the repository on GitHub.

The order of the two commands in `g:UltiSnipsSnippetDirectories` is important.

The snippets in the directories specified first will override those in later directories in case of conflicts.

You can use the `:UltiSnipsEdit` command to directly edit the active language snippets and then automatically reload them.

## 4. *Honza*: Why two different collections of *snippets*?

As noted in my previous article, mentioned at the beginning, the [Honza vim-snippets GitHub page](https://github.com/honza/vim-snippets) contains two distinct collections of *snippets*:

- One collection is located in the folder named *UltiSnips*.
- Another collection is located in the folder named *snippets*.

The following image gives a good idea of the two folders:

![Honza Snippets](honza_snippets_github_framed.png)
The *snippets* in the first folder are designed to be used with Vim's `UltiSnips` plugin.

The *snippets* in the second folder are designed to be used with other snippet plugins for Vim, such as `snipMate` and `neosnippet`.

There is an essential syntactic difference between the two collections: the *snippets* in the *UltiSnips* folder have a closing *tag* named `endsnippet` while those in the top-level *snippets* folder have no closing *tag*.

## 5. Overview of both  collections.

I report, in summary, observations on both collections:

1. Contents of the `UltiSnips` folder:
   - The snippets in this folder are designed to be used with the `UltiSnips` plugin.
   - Each snippet has a closing tag named `endsnippet`.
   - Template:

     ```vim
     snippet trigger "description"
     snippet content
     endsnippet
     ```
     Practical example (taken from the `tex.snippets` collection):
     ```vim
     snippet fig "Figure environment" bi
     \begin{figure}[${1:htpb}]
     	\centering
     	${2:\includegraphics[width=0.8\textwidth]{$3}}
     	\caption{${4:$3}}
     	\label{fig:${5:${3/\W+/-/g}}}
     \end{figure}
     endsnippet
     ```

2. Contents of the top-level `snippets` folder:
   - The snippets in this folder are designed to be used with other snippet plugins, such as `snipMate` and `neosnippet`.
   - They do not include a closing tag.
   - Template:

     ```vim
     snippet trigger
     snippet content
     ```
     Practical example (taken from the `tex.snippets` collection):

     ```vim
     snippet fig figure environment (includegraphics)
     	\\begin{figure}
     	\\begin{center}
     		\\includegraphics[scale=${1}]{Figures/${2}}
     	\\end{center}
     	\\caption{${3}}
     	\\label{fig:${4}}
     	\\end{figure}
     	${0}
     ```

## 6. Is it possible to "mix" the snippets of the two collections?

The *snippets* of the two collections are materially different from each other, they are not simply two parallel groups of *snippets* written with different syntax.

Therefore, it might be useful to exchange *snippets* between the two collections.

The question is, therefore: is it possible to "convert" snippets designed for snipMate to those designed for UltiSnips simply by adding the closing tag?

For direct feedback, I tried to convert some *snippets* for Python contained in the `snippets` folder for use with the *UltiSnips* plugin by simply adding the `endsnippet` closing tag.

I report the original version, followed by the `converted` version:

- Original version:

```vim
    snippet pr
    	print($0)
    snippet prs
    	print("$0")
    snippet prf
    	print(f"$0")
    snippet fpr
    	print($0, file=${1:sys.stderr})
    snippet fprs
    	print("$0", file=${1:sys.stderr})
    snippet fprf
    	print(f"$0", file=${1:sys.stderr})
```

- Converted version for UltiSnips:

```vim
    snippet pr
        print($0)
    endsnippet
    snippet prs
        print("$0")
    endsnippet
    snippet prf
        print(f"$0")
    endsnippet
    snippet fpr
        print($0, file=${1:sys.stderr})
    endsnippet
    snippet fprs
        print("$0", file=${1:sys.stderr})
    endsnippet
    snippet fprf
        print(f"$0", file=${1:sys.stderr})
    endsnippet
```

The test was successful: the addition of the closing *tag* made it possible to get *snippets* available for *UltiSnips* as well.

In general, then, the addition of the `endsnippet` closing tag allows *snippets* from the *snippets* folder of `honza/vim-snippets` to be converted to the format dedicated to *UltiSnips*.

However, some *snippets* may require additional modifications to work properly with *UltiSnips*. Variables, logic, or formatting may need to be adjusted to ensure consistent behavior.

It is essential to carefully test each converted *snippet* to ensure that it works properly.

In more complex situations, you may need to use dedicated conversion tools, e.g., [snippets-converter.nvim](https://github.com/smjonas/snippet-converter.nvim).

Thanks for your attention.