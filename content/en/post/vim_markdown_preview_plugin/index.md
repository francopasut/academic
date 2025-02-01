---
title: "Vim and the Markdown preview"
date: 2023-02-11
slug:  vim_markdown_preview_plugin
categories:
  - Blog
tags:
  - Vim
  - Markdown
image:
  placement: 3
  preview_only: false 
  caption: 'Vim and Markdown'
---



## Preamble

Vim is an excellent editor for Markdown, both for its own "native" features and for the possibility of adding specific functions via "plugins."

Previewing documents requires, unless you use the "manual" solution mentioned at the end of this article, using a dedicated "plugin."

Until a few years ago, my favorite was "_iamcco/markdown-preview.vim_" because it provided a true real-time _live_ effect while typing text, even before periodic saving.

Unfortunately, that project has been abandoned since February 2020.

However, there are interesting alternative solutions that are the subject of these notes.

The operating system predominantly used for this article is Arch Linux but there are indications for other GNU/Linux distributions as well.

## Previewing Vim in Markdown with the "Livedown" plugin

The preliminary step for this solution is to install *npm*.

In Debian-derived distributions you use:

```bash
$ sudo apt install npm
```

For CentOS 8, Fedora, and Red Hat:

```bash
$ sudo dnf install npm 
```

For Arch Linux and Manjaro:

```bash
$ sudo pacman -S npm
```

or (for those using *yay*):

```bash
$ yay -S npm
```

Arch proposed me, immediately afterward, to upgrade to `npm@9.3.0` with:

```bash
sudo npm install -g npm@9.3.0.
```

At this point, the installation of *livedown* is done through `npm` with the command:

```bash
sudo npm install -g livedown
```

Now we need to proceed with the installation of the actual *plugin*.

With the VimPlug system, the command is used:

```bash
Plug 'shime/vim-livedown'.
```

Finally, to avoid typing the entire `LivedownToggle` command every time, you need to customize the keyboard by entering the following command in the *.vimrc* configuration file:

```bash
nmap gm :LivedownToggle<CR> 
```

Instead of the `gm` combination you can use others being careful not to create conflict with other system command.

While activating the *plugin* each time the document is saved (Vim command `:w`) the preview is automatically updated.

## Previewing Vim in Markdown with the "Vim Markdown Preview" plugin

The reference page for the plugin is [this](https://github.com/JamshedVesuna/vim-markdown-preview#toggle).

Again, this requires the availability of a specific installation tool: *PIP*.

*PIP* is used to automate the installation and management of packages and modules written in the *Python* language.

On Arch Linux it is used:

```bash
sudo pacman -S python2-pip # for Python 2
sudo pacman -S python-pip # for Phyton 3 
```

On Debian and derivatives (Ubuntu, Mint) you use:

```bash
install python-pip #python 2
install python3-pip #python 3
```

On CentOS:

```bash
install epel-release 
install python-pip
```

On Fedora:

```bash
dnf install python-pip #Python 2
dnf install python3 #Python 3
```

To display the GitHub Flavoured Markdown, with additional features over the basic version, you need [Grip](https://github.com/joeyespo/grip).

To install *grip* via *pip* you use the command: `pip install grip`.

The system installed for me (as of 14/1/2023) *grip 4.6.1* in the user's *home* folder, i.e. `/home/username/.local/bin` (where *username* corresponds to the user's real name).

It may happen that *grip* is not "seen" by the system (happened in Arch but not in Ubuntu) and in this case it is necessary to proceed with the modification of the PATH environment variable that tells the system where to look for executables.

To view the current contents of the PATH variable, we use the `echo $PATH` command.

If the `/home/username/.local/bin` folder were not present, you would need to modify the contents of the variable by adding the path to that folder.

To test this, you can modify the PATH tentatively by using the following string in the *bash* command line:

```bash
export PATH=/home/username/.local/bin:$PATH
```

At this point it is sufficient from any location, such as from *home*, to type a test command, such as `$ grip - help`. If the system responds with the *grip* command list, then the test should be considered passed.

If, after successfully passing the test, one can make the change permanent in several ways.

A first system, effective only for the current user, involves editing the file `~/.bashrc` with a text editor (e.g. `vim ~/.bashrc`) by adding, at the bottom, the following string:

```bash
export PATH=$PATH:/home/username/.local/bin
```

To change the path for all authorized users in the operating system, you need to open in administrator mode (that is, with the prefix `sudo`) the `/etc/profile` document and scroll until you see something like this:

```bash
# Append our default paths
append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/bin'
```

At this point simply append, remembering that "username" must be changed to the user's actual name, the following string:

```bash
append_path '/home/username/.local/bin'
```

Another component needed is *xdotool* but this may already be installed.

Before proceeding, therefore, type the same command in the terminal: if the system responds with "*command not found*" or similar message, you need to proceed with the installation, otherwise it means that the command is already installed.

To install in Arch Linux you use: `sudo pacman -S xdotool` or, for those using yay, `yay -S xdotool`.

Although the directions are all referring to the Arch Linux distribution, the same directions apply to other distributions but, of course, using the relevant installation system (e.g. *apt-get install* for Debian and derivatives, *dnf install* for Fedora).

You must, finally, enter the following string in .vimrc:

```bash
let vim_markdown_preview_github=1
```

The *plugin* is natively compatible only with Google Chrome (or Safari in macOS).

This means that you must have that browser installed and selected as the default.

To use this preview system, you need to open a file with a `.markdown` or `.md` extension and press `Ctrl-p` both to open the preview and to update it during editing.

In practice: saving the document with Vim's `:w` command, which in the previous *plugin* also automatically caused the preview to be updated, is not sufficient in this case and must be followed by `Ctrl-p`.

So a double command must be pressed: first saving the document and then updating the preview.

I would add, also, that the `Ctrl-p` command is a bit more in "Emacs style" than in the typical Vim one.

I have, also, found that updating with `Ctrl-p` after adding text causes error messages that, in any case, do not prevent the view from updating.

## Simple solution without plugins

In any case, it is possible to use a "de facto" preview **without any *plugin*:** just open the Markdown document with a navigator (usually one uses the `Ctrl-o` command) and refresh the navigator view (`Ctrl-r`).

The advantage of this simple system is also to be able to keep the previews of many documents open at the same time (example, the same document in Italian and English).

To view in Firefox documents written in Markdown language, you can find some tips in [this article of mine](https://francopasut.netlify.app/post/markdown_firefox/).

Thank you for your attention.

