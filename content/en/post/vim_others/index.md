---
title: "Vim... beyond Vim"
date: 2026-02-16
slug:  vim_others
categories:
  - Blog
tags:
  - Vim
  - Emacs
  - Visual Studio Code
  - Sublime Text
  - Zed
image:
  placement: 3
  preview_only: false 
  caption: 'The Root of Vim'
canonicalUrl: https://francopasut-en.blogspot.com/2026/02/vim-beyond-vim.html
---


- [1. Vim in five minutes](#1-vim-in-five-minutes)
- [2. Not a tutorial about Vim](#2-not-a-tutorial-about-vim)
- [3. Vim in Emacs: Evil Mode, the emulator par excellence](#3-vim-in-emacs-evil-mode-the-emulator-par-excellence)
- [4. Vim in Sublime Text](#4-vim-in-sublime-text)
- [5. Vim in Visual Studio Code](#5-vim-in-visual-studio-code)
- [6. Vim in Zed: the youngest](#6-vim-in-zed-the-youngest)


# 1. Vim in five minutes

Vim is not  just a text editor, it is an **editing language** that  allows you to interact with text through logical key combinations.

The basis of Vim's "language"  is the "modal" system.

The main modes are as follows:

-   ****Normal Mode****: The "command center." Each key is a movement or modification command.
-   ****Insert Mode****: Where you actually write the text.
-   ****Visual Mode****: For selecting blocks of text.

This separation eliminates the need to use the Ctrl key or mouse for every operation, reducing hand fatigue.

In Vim, your hands never leave the center position of the keyboard. Basic movements are performed with h, j, k, and l, but the real power lies in semantic jumps:

-   **Words**: `w` (jump to the beginning of the next word), `b` (go back), `e` (end of word).
-   **Quick search**: `f` followed by a character (e.g., `ft`) instantly moves the cursor to the first 't' in the line.
-   **Start/End**: `0` for the start of the line, `$` for the end, `gg` for the start of the file, `G` for the end.

Vim can "jump" between words as if it were a "knight on a chessboard."

"Text objects" allow you to operate on logical structures (words, sentences, paragraphs, code blocks) regardless of the cursor position.

The syntax follows the logic: **[Action] + [Scope] + [Object]**.

Imagine that the cursor is inside a string enclosed in quotation marks: `print("Hello World")`. Here are some simple examples of "text objects":

-   `ci"` (**Change Inside "**): Deletes "Hello World" and activates Insert Mode to write the new string.
-   `da(` (**Delete Around (**): Deletes the entire parentheses, including the parentheses themselves.
-   `yiw` (**Yank Inner Word**): Copies (Yanks) the word under the cursor without having to select it.

**Quick Reference Table:**

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Logical Translation</th>
<th scope="col" class="org-left">Result</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left"><b>dip</b></td>
<td class="org-left">Delete Inside Paragraph</td>
<td class="org-left">Deletes the entire current paragraph.</td>
</tr>

<tr>
<td class="org-left"><b>ca{</b></td>
<td class="org-left">Change Around {}</td>
<td class="org-left">Replaces an entire block of code between curly brackets.</td>
</tr>

<tr>
<td class="org-left"><b>vit</b></td>
<td class="org-left">Visual Inside Tag</td>
<td class="org-left">Selects the content of an HTML tag (e.g., between divs).</td>
</tr>
</tbody>
</table>

Vim's efficiency also stems from its **composability**, i.e., the ability to combine commands to create compound commands.

The only problem? You can't learn Vim in five minutes. 

# 2. Not a tutorial about Vim

Let's be clear: the internet is saturated with tutorials on how to install and use Vim.

This is **not** one of those posts. This article is not about Vim as a standalone software, but about **"Vim beyond Vim"**.

As previously noted, Vim is a **modal editing system**: a true "philosophy" that transcends the original application to "live" within command line editing software.

Therefore, it is possible to emulate, or recreate, the same "philosophy" of Vim within other editing systems.

**Emulating Vim allows you to:**

1.  **Save time:** Repetitive operations become instantaneous.
2.  **Protect your health:** Reducing mouse use helps prevent repetitive strain injury (RSI).
3.  **Maintain focus:** Manage every movement with the keyboard alone, without interrupting your creative flow.

To write this article, I used various emulators to exchange information. Each time, I found the spirit of Vim within the various editors. 

# 3. Vim in Emacs: Evil Mode, the emulator par excellence

In the world of text editors, there is a historic rivalry that borders on legend: Vim versus Emacs.

On one side, we have the speed of modal commands; on the other, almost infinite flexibility of extension.

Is it possible to combine the best of both worlds?

This is where the **Evil Mode** plugin comes in.

For years, there has been an ironic saying among programmers:

> **“Emacs is a great operating system, but it lacks a good editor.”**

The power of Emacs as a computing and organizational environment is undisputed, but many users find its original text input system (consisting of often complex key combinations) less efficient than Vim's modal system.

****Evil Mode**** (Extensible VI Layer) solves exactly this “problem.” It is not a simple superficial emulation; it is probably the most faithful, fluid, and powerful implementation of Vim ever created outside of the original source code.

The real reason why many users decide to take the plunge and switch to Emacs is just one: ****Org Mode****.

I admit it: that's exactly what happened to me!

Org Mode is an extraordinary tool for taking notes, managing tasks, planning projects, and writing complex, structured articles. 

I searched for a long time for an Org Mode plugin for Vim that could even come close to matching its functionality, but the truth is: ****it doesn't exist****.

Evil Mode is the best system for those who want to use the power of Org Mode without giving up the “muscle memory” of Vim commands.

One of the great advantages of this setup is freedom of choice. Unlike other environments, Emacs allows you to ****instantly enable and disable Evil Mode**** using a simple keyboard shortcut.

The most modern and efficient method for managing packages in Emacs is to use *use-package*.

You can also use the *use-package* system to install Evil Mode. To do so, add the following snippet to your configuration file (e.g., `~/.emacs.d/init.el)`:

    (use-package evil
      :ensure t
      :init
      (setq evil-want-integration t) ;; Necessario per il supporto ad altri plugin
      (setq evil-want-keybinding nil)
      :config
      (evil-mode 1))

The default shortcut to enable/disable Evil on the fly is usually C-z (Ctrl+z), which switches between “Vim” mode and native “Emacs” mode.

# 4. Vim in Sublime Text

Sublime Text (currently at version 4) seems a bit “out of fashion,” probably because in a world of free editors, it remains essentially a paid resource.

In an ecosystem dominated by VS Code, Vim or Neovim, and Zed—all free and open source—paying for a text editor seems like a counterintuitive choice.

The “proof” is that some important plugins, such as LaTeXTools, have never been updated for version 4 of Sublime. 

However, there is a reason why many professionals have never stopped paying that fee: performance.

Sublime Text still offers an extremely fast writing experience and consumes a fraction of the RAM compared to its more famous competitors.

Not everyone knows that Sublime Text has a secret weapon for speed lovers: Vintage Mode.

Therefore, Sublime Text does not require plugins to emulate Vim: emulation is already integrated into the editor.

In other words: Vintage Mode is an integrated package that enables modal vi editing directly in the editor.

To activate *Vintage Mode*, simply go to the user settings and remove “Vintage” from the ignored<sub>packages</sub> list.

In conclusion: Sublime Text is not outdated at all; it has simply become a tool for “connoisseurs” and, with *Vintage* Mode, it is probably one of the most elegant ways to use Vim today.

# 5. Vim in Visual Studio Code

To emulate Vim in Visual Studio Code, you need to use a plugin such as VSCodeVim.

[VSCodeVim](https://github.com/VSCodeVim/Vim) is a complete Vim emulator for Visual Studio Code. It allows you to combine the flexibility of VS Code with the editing speed typical of Vim.

The plugin is very easily customizable using the *settings.json* file.

To open the *settings.json* file, press   `Ctrl + Shift + P`, type “Open User Settings (JSON)”.

For example: to exit Insert Mode by quickly typing jj, add the following snippet to the *settings.json* file (tried and tested):

    "vim.insertModeKeyBindings": [
        {
            "before": ["j", "j"],
            "after": ["<Esc>"]
        }
    ]

I also include the example of optimized configuration, again in the *settings.json* file, taken from the plugin description:

    {
      "vim.easymotion": true,
      "vim.useSystemClipboard": true,
      "vim.leader": "<space>",
      "extensions.experimental.affinity": {
        "vscodevim.vim": 1
      }
    }

VSCodeVim integrates several additional plugins that are widely used by the Vim community:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Plugin</th>
<th scope="col" class="org-left">Key Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left"><b>vim-surround</b></td>
<td class="org-left"><code>cs</code>, <code>ds</code>, <code>ys</code></td>
<td class="org-left">Bracket and tag management</td>
</tr>

<tr>
<td class="org-left"><b>vim-easymotion</b></td>
<td class="org-left"><code>&lt;leader&gt;&lt;leader&gt;</code></td>
<td class="org-left">Quick jumps within the document</td>
</tr>

<tr>
<td class="org-left"><b>vim-commentary</b></td>
<td class="org-left"><code>gc</code></td>
<td class="org-left">Quick code commenting</td>
</tr>

<tr>
<td class="org-left"><b>vim-sneak</b></td>
<td class="org-left"><code>s&lt;char&gt;&lt;char&gt;</code></td>
<td class="org-left">Jump to two characters</td>
</tr>

<tr>
<td class="org-left"><b>ReplaceWithRegister</b></td>
<td class="org-left"><code>gr</code></td>
<td class="org-left">Replace text with register</td>
</tr>
</tbody>
</table>

The description of the *VSCodeVim* plugin also mentions some special functions:

-   **gd**: Jump to definition (native VS Code).
-   **gb**: Add multiple cursors on matching words.
-   **af**: Hierarchical visual selection (expands selection).
-   **gh**: Show hover (documentation/types) without using the mouse.

I found the **gb** function particularly useful and interesting.

The *VSCodeVim* plugin can be disabled with the ****toggleVim**** command:

1.  Open the ****Command Palette**** with Ctrl+Shift+P (or Cmd+Shift+P on Mac).
2.  Type ****“Vim: Toggle Vim Mode”**** and press Enter.
3.  The status bar at the bottom will display `-- VIM: DISABLED --`.
4.  To reactivate Vim, repeat the same operation.

To have a quick activation/deactivation key, similar to *Ctrl+z* in Emacs, you need to manually map the command as follows:

1.  Open the keyboard shortcuts file (JSON) via the Command Palette: search for ****“Preferences: open keyboard shortcuts (JSON)”****, not to be confused with **“Preferences: open keyboard shortcuts”** (without JSON) as in this case the file would NOT be opened but a list of shortcuts.
2.  Insert a snippet like the following inside the square brackets `[]`:

    {
        "key": "ctrl+alt+v", 
        "command": "toggleVim"
    }

Of course, you can replace `ctrl+alt+v` with other key combinations that are not already used by the system.

# 6. Vim in Zed: the youngest

Zed is the “youngest” editor in this small review.

I admit, I don't know it well yet, and I reserve the right to devote other articles to this editor.

However, in order to write this article, I delved deeper into the part relating to the activation of the Vim emulator. 

Written in Rust, Zed focuses entirely on performance, and this goal   fits perfectly with Vim's philosophy.

As already noted for Sublime Text, in Zed, “Vim Mode” is not a third-party plugin, but Vim support is native.

There is nothing to download; you just need to open the settings and activate Vim mode.

The easiest way to set up Vim emulation is to open the configuration menu in one of the following three ways:

1.  Press the three horizontal lines in the upper left corner, select Open Settings, enter “Vim” in the Search Settings box, select Modal Editing, and activate the Vim Mode button.
2.  Press `Ctrl + ,` and follow the same instructions above.
3.  Open the Command Palette (Ctrl+Shift+P), select Zed: open settings, and proceed as above.

You can activate emulation directly from the program's global settings by opening the settings.json configuration file in one of the following ways:

1.  Press the three horizontal lines at the top left, select Open Settings File.
2.  Press `Ctrl + Alt + ,`.
3.  Open the Command Palette (Ctrl+Shift+P) and select Zed: open settings file.

After opening the configuration file in one of the three ways above, simply enter the following command:

    {
      "vim_mode": true
    }

Obviously, if other configurations were present, the above configuration would need to be added to the others already present, e.g.:

    {
      "vim_mode": true,
      "ui_font_size": 16,
      "buffer_font_size": 15,
      "theme": {
        "mode": "system",
        "light": "One Light",
        "dark": "One Dark",
      },
    }

You will see the mode indicator (NORMAL, INSERT, etc.) in the status bar at the bottom right.

Zed implements most of the standard Vim commands, including:

-   Movements: h, j, k, l, w, b, e, 0, $, G, gg.
-   Operators: d, c, y, p, u.
-   Text objects: iw, it, i", etc.
-   Commands: :w, :q, :wa.

We can perform the same customization described above for VSCode, i.e., use the keyboard shortcut jj to exit Insert mode by configuring *keymap.json*.

Here's how: open the Command Palette, type “Zed: Open Keymap file,” and add the following configuration:

    [
      {
        "context": "Editor && vim_mode == insert",
        "bindings": {
          "j j": "vim::NormalBefore"
        }
      }
    ]

Please note: in Zed's original *keymap.json* file, the `j k` command is already preset but disabled, which I modified by inserting `j j`.

At this point, simply delete the two slashes `//` to activate the *shortcut*.

Thank you for your attention.

