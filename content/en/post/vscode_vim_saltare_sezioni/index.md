---
title: "Markdown in VSCode, Vim emulation, and navigating between sections"
date: 2026-07-29
slug:  vscode_vim_saltare_sezioni
categories:
  - Blog
tags:
  - Markdown
  - Visual Studio Code
  - VSCode
  - Vim
image:
  placement: 3
  preview_only: false 
  caption: 'Coding'
canonicalUrl: https://francopasut-en.blogspot.com/2026/07/markdown-in-vscode-vim-emulation-and.html 
---

- [1. Introduction](#1-introduction)
- [2. Vim in VSCode](#2-vim-in-vscode)
- [3. Step-by-Step guide to entering the configuration](#3-step-by-step-guide-to-entering-the-configuration)
- [4. Native Navigation in VS Code: Go to Symbol / Title (`Ctrl + Shift + O`)](#4-native-navigation-in-vs-code-go-to-symbol--title-ctrl--shift--o)
- [5. The Sidebar: “Outline” Panel](#5-the-sidebar-outline-panel)
- [6. The Top Address Bar (Breadcrumbs)](#6-the-top-address-bar-breadcrumbs)
- [7. Conclusions](#7-conclusions)


# 1. Introduction

Visual Studio Code is an excellent editor for Markdown.

There are various built-in features in the editor that allow you to navigate quickly through the structure of Markdown documents.

Additionally, for those familiar with VIM who have set up VSCode to emulate that editor, it’s also possible to configure a simple setup to use square bracket navigation.

Let’s start with this method of jumping between sections using VIM emulation in VSCode.

# 2. Vim in VSCode

For those familiar with **Vim** or who use modal editing, the speed of navigating through text is essential (as I discussed in detail in the article on [Vim Beyond Vim](https://francopasut-en.blogspot.com/2026/02/vim-beyond-vim.html)).

To enable modal editing in VS Code, you can use the **VSCodeVim** plugin, a full-featured emulator that combines the functionality of the Microsoft editor with Vim’s signature typing speed.

In Vim, you can jump between sections of a document using the `]]` (next section) and `[[` (previous section) key combinations.

We can replicate this behavior exactly in VS Code by mapping search commands to Markdown headings (`#`, `##`, `###`, etc.).

Here’s a summary of the section from my previous article, mentioned above, dedicated to emulating Vim in Visual Studio Code:

-   To enable modal editing in VS Code, the VSCodeVim plugin is used—a comprehensive emulator that combines the features and flexibility of the Microsoft editor with Vim’s typical typing speed.
-   The extension is easily configured by editing VS Code’s global \`settings.json\` file (accessible via the command palette with \`Ctrl + Shift + P\` and selecting “Open User Settings (JSON)”).
-   Through the JSON configuration, you can define custom key bindings to speed up your workflow.

In the configuration file \`/settings.json/\`—which you can open by pressing `Ctrl+Shift+P` and selecting “Open User Settings (JSON)”—enter the following code:

```
    "vim.normalModeKeyBindingsNonRecursive": [
        {
            "before": ["]", "]"],
            "after": ["/", "^", "#", "<Enter>"]
        },
        {
            "before": ["[", "["],
            "after": ["?", "^", "#", "<Enter>"]
        }
    ]
```

If there is other code in the file, you would need to add a comma at the end of the existing code and insert the new code immediately below it—that is, BEFORE the last curly brace that closes the loop for all configurations.

After making this change, you can use:

-   `]]` to go to the next section (next #, ##, etc.).
-   `[[` to return to the previous section.

# 3. Step-by-Step guide to entering the configuration

Here is a step-by-step guide to entering the configuration described above:

1.  Open the **Command Palette** using the keyboard shortcut `Ctrl + Shift + P` (or `Cmd + Shift + P` on macOS).
2.  Select the entry `Preferences: Open User Settings (JSON)`.
3.  Inside the `settings.json` file, enter the following code block to map non-recursive navigation in Normal Mode:

```
    "vim.normalModeKeyBindingsNonRecursive": [
        {
            "before": ["]", "]"],
            "after": ["/", "^", "#", "<Enter>"]
        },
        {
            "before": ["[", "["],
            "after": ["?", "^", "#", "<Enter>"]
        }
    ]

```

**JSON Syntax Note:** If the `settings.json` file already contains other rules, be sure to add a comma `,` at the end of the previous line before pasting this block. Everything must remain enclosed within the outer curly braces `{ ... }`.

Once you’ve saved the file:

-   Pressing **`]]`** in Normal Mode will instantly jump the cursor to the **next heading** (any line starting with `#`).
-   Pressing **`[[`** in Normal Mode will return the cursor to the **previous heading**.

# 4. Native Navigation in VS Code: Go to Symbol / Title (`Ctrl + Shift + O`)

For those who don't use Vim emulation or prefer to search for a specific title rather than scroll through the list, VS Code offers the powerful native **Go to Symbol in File** feature.

-   **Keyboard shortcut:** `Ctrl + Shift + O` (on macOS: `Cmd + Shift + O`).
-   **How it works:** Pressing this combination opens the search bar at the top, which contains the complete list of all headings (from `H1` to `H6`) in the active document.

If, after pressing `Ctrl + Shift + O`, you add the character **`:`** (resulting in the string `@:` in the bar), VS Code will automatically organize all headings by hierarchical level (`H1`, `H2`, `H3`&hellip;), allowing you to immediately identify the file’s overall structure.

# 5. The Sidebar: “Outline” Panel

For a constant overview while writing or editing, the ideal tool is the **Outline** panel (*Outline*).

1.  Open the **Explorer** sidebar (`Ctrl + Shift + E`).
2.  At the bottom of the sidebar, expand the **Outline** section (*Outline*).

In this pane, you’ll see the complete Markdown table of contents, updated in real time as you write:

-   Clicking on any heading in the outline will immediately position the cursor on the corresponding line.
-   The active element is automatically highlighted as you scroll through the document.
-   You can filter elements simply by typing in the panel while it’s active.

# 6. The Top Address Bar (Breadcrumbs)

Just below the tab for the open file (and above the text editing area) is the **Breadcrumbs** bar (the document path).

In Markdown files, the Breadcrumbs not only show the folder structure on the disk but also include **the current section and title** where your cursor is located.

-   Clicking on the heading name shown in the Breadcrumbs opens a drop-down menu with all the titles at the same level or the level above.
-   This allows you to jump quickly from one chapter to another without having to open side panels or remember keyboard shortcuts.

# 7. Conclusions

Mastering structural navigation in Markdown documents with Visual Studio Code allows you to transform the editor into a fast and efficient writing environment:

1.  For **rapid sequential writing**, Vim emulation with `]]` and `[[` ensures continuity without taking your hands off the keyboard.
2.  For **targeted searching**, the `Ctrl + Shift + O` shortcut lets you instantly jump to any heading.
3.  For **visual management of complex documents**, the combination of the **Structure Panel** and **Breadcrumbs** offers total control over your workflow.

Thank you for your attention.

