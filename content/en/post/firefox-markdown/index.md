---
title: "Markdown in Firefox"
date: 2022-10-24
slug:  markdown_firefox
categories:
  - Internet
tags:
  - Markdown
  - Firefox
image:
  placement: 3
  preview_only: false 
  caption: 'Markdown under Firefox'
---

{{% toc %}}

## Abstract

Use Mozilla Firefox as a Markdown documents viewer written under Linux Ubuntu, Fedora and Arch, with mention of MS Windows and macOS.

## Mozilla Firefox and the Markdown layout

Mozilla Firefox, one of the best Internet browsers, does not natively read documents written in Markdown.

If you try to open a document written in Markdown, the browser asks whether it should save it locally or open it with an application among those offered by the operating system.  But it doesn't render the document.

It is necessary, therefore, to use an add-on plugin to view a Markdown document in rendered mode within the navigator.

An excellent plugin is [*Markdown Viewer Webext*](https://github.com/KeithLRobertson/markdown-viewer).

In addition to displaying content written in Markdown, the component makes available a pop-up table of contents that also allows you to choose the *style* (*default* and *github*) and download the HTML version of the document locally.

I did, however, have some problems to install the component under GNU/Linux, especially on Ubuntu distribution. I also tried in Fedora and Arch but the process was a bit easier.

I report concise guidelines for various operating systems, aimed especially at those that have installed the browser via SNAP on Ubuntu.

## No problem for installing the plugin in MS Windows e macOS

Under the **MS Windows** operating system the component works right away, immediately after the installation made by the dedicated Firefox function.

No additional configuration is required beyond simply installing the plugin.

Also under,  the **macOS** operating system it works immediately without any additional configuration.


## Only a small work around in  GNU/Linux Fedora and Arch

In both GNU/Linux Fedora and Arch, the installation required a little work around.

Following the instructions on the [GitHub page](https://github.com/KeithLRobertson/markdown-viewer) of the component, I added, under the `~/.local/share` folders, the `/mime/packages` folders.

Inside the `packages` folder I placed the `text-markdown.xml` file with the following contents:

```xml
<?xml version="1.0"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>.
  <mime-type type="text/plain">.
    <glob pattern="*.md"/>
    <glob pattern="*.mkd"/>
    <glob pattern="*.mkdn"/>
    <glob pattern="*.mdwn"/>
    <glob pattern="*.mdown"/>
    <glob pattern="*.markdown"/>
  </mime-type>
</mime-info>
```

Finally, I ran the command `update-mime-database ~/.local/share/mime`.

Warning: since it is a local directory **the prefix "sudo "** should not be used because, otherwise, the system would highlight that the path is not in the PATH.

That's all, the procedure is clearly illustrated both on the component programmer's page and in various tips on the net.

## A  slightly more labor-intensive installation on Ubuntu.

On Ubuntu, it is most probable that Mozilla Firefox was installed via the SNAP package manager.

The problem, in this case, originates from the isolation of SNAP packages from the rest of  the operating system.

Some additional actions are, therefore, required than in other Linux distributions.

You must first type, in the Firefox Internet address field, the following command: `about:profiles`.

The answer to the previous command gives a string like the following one: `/home/franco/snap/firefox/common/.mozilla/(...)`.

You must search, in the string,   for the folder immediately above that named `.mozilla`.

The folder to take as a reference should be the `common` one.

Inside the `common` folder, then, you have to place a file named `mime.types`.

The complete path with the new file could then look like the following:  `/home/franco/snap/firefox/common/mime.types`.

Inside the `mime.types` file you must write the following line of code:

```bash
type=text/plain exts=md,mkd,mkdn,mdwn,mdown,markdown, desc="Markdown document"
```

It's not over yet!

You need to run, again in the address field, another command  named `about:config`, accept the warning *Proceed with Caution*  by pressing *Accept the Risk and Continue* and digit in the search field the string `helpers.private_mime_types_file`.

On the right you will find a pencil icon that you must press to edit the field pre-filled with the string `~/.mime.types` modifying it with the path to the "file" created above, using not the tilde (~) for the *home*  but the full absolute path.

In my situation:  `/home/franco/snap/firefox/common/mime.types` but  not `~/snap/firefox/common/mime.types`.

We are done: let's restart Firefox and enjoy the Markdown inside the browser.

By the way: the fastest way to load an external document into the browser is to use the `Ctrl-o` command (`Cmd-o` for macOS) and select the document in the window that appears.

In summary, the SNAP package manager on Ubuntu makes the configuration of the component a bit more complex because of its isolation from the operating system.

Thank you for your attention.
