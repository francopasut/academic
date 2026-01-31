---
title: "Personal observations on Robocopy, Rsync, and Rclone"
date: 2026-01-31
slug:  rsync_rclone
categories:
  - Blog
tags:
  - Windows
  - Linux
  - Rsync
  - Rclone
image:
  placement: 3
  preview_only: false 
  caption: 'Rsync vs Rclone'
canonicalUrl: https://francopasut-en.blogspot.com/2026/01/personal-observations-on-robocopy-rsync.html
---

- [1. Introduction](#1-introduction)
- [2. Previous article: brief comparison between robocopy and rsync](#2-previous-article-brief-comparison-between-robocopy-and-rsync)
- [3. Slow rsync with WebDAV](#3-slow-rsync-with-webdav)
- [4. Installing Rclone on Linux: repository or official website?](#4-installing-rclone-on-linux-repository-or-official-website)
- [5. Configuring Rclone](#5-configuring-rclone)


# 1. Introduction

-   Robocopy: The "Robust File Copy" is a built-in powerhouse for Windows users. It’s the native way to handle massive local transfers or network shares (SMB) while perfectly preserving NTFS permissions.

-   Rsync: The *de facto* standard for the Unix world (Linux and macOS). It’s famous for its efficiency—instead of re-copying everything, it only syncs the specific parts of a file that have changed.

-   Rclone: Think of Rclone as "Rsync for the Cloud." While the tools above were born for physical disks and local servers, Rclone was built for the API era.

It is a true multi-platform "Swiss Army knife" that runs seamlessly on Windows, Linux, macOS, and even FreeBSD.

What sets it apart is its incredible versatility: it can "talk" to over 40 different cloud providers—including Google Drive, Dropbox, S3, OneDrive, and NextCloud.


# 2. Previous article: brief comparison between robocopy and rsync

I dedicated a paragraph of [one of my articles](https://francopasut.netlify.app/post/xcopy_robocopy_windowsv/#robocopy-and-rsync) to which I refer,  to comparing *robocopy* and *rsync*.

Here is a summary of that paragraph.

Robocopy (Windows) and rsync (Linux) are mirror utilities designed for efficient data synchronization. 

Their common features include:

-   Incremental Efficiency: Both optimize time by copying only new or modified files, ignoring those that are already present and unchanged.
-   Flexibility and Control: They allow you to filter content through exclusion options for specific files or folders.
-   Reliability: They are robust tools, capable of handling heavy workloads and large files.
-   Mirroring Mode: Both offer a “mirror copy” function (using the /MIR command in Robocopy and &ndash;delete in Rsync), which perfectly aligns the destination with the source by deleting files that are no longer present in the source.


# 3. Slow rsync with WebDAV

Rsync is an excellent synchronizer, with a complete set of options.

However, when used with the WebDAV protocol, as in my case, it can be very slow.

Here is a brief summary of the three bottlenecks that can slow down rsync on WebDAV:

-   Excessive “checks” (Overhead): The WebDAV protocol sends too many control messages for each individual operation.
-   “Funnel” effect (Locking): The mounting system (FUSE/davfs2) locks files for security, forcing operations to proceed one at a time instead of in parallel.
-   Inefficient comparison (Scanning): Rsync struggles to understand remotely which files have changed; it ends up analyzing too much data just to decide what to copy, slowing down the entire process.

I have personally experienced the slowness of *rsync* on Debian and derivatives, including Ubuntu.

While searching for information on how to speed up *rsync*, I “discovered” *rclone*.

*Rclone* does not suffer from the limitations of *davfs2* and is not affected by the above-mentioned problems because it does not communicate with the system as if it were a local disk but “talks” directly to the server using multiple “lanes” simultaneously (multi-threading) .

Furthermore, *Rclone* works regardless of the position of the cursor in the terminal, as both the local and remote paths are stored internally during configuration.

Below are some tips, based directly on my own experience, for installing, configuring, and using *Rclone*.


# 4. Installing Rclone on Linux: repository or official website?

In the Linux world, we are used to the convenience of package managers: whether it's APT on Debian and derivatives, DNF on Fedora, or Pacman on Arch, a simple command is usually enough to solve everything. However, official repositories do not always offer the most up-to-date (and secure) version of software.

When I tested Rclone, I came across a substantial difference between distributions that is worth exploring.

To test on Debian, I installed the software using the classic command: `sudo apt install rclone`.

The result? The version in the repositories was so outdated that it triggered a security warning when using bisync. The system warned me not to use the command in production because it was still considered experimental in that specific release.

At this point, I moved on to Fedora, where the situation improved.

Using: `sudo dnf install rclone`, the installation did not return any warnings, indicating that the Fedora repositories host a newer version than Debian Stable.

To standardize performance and ensure I had the latest features (and bug fixes), I attempted to remove the system version on Debian and proceed with the manual installation recommended by the developers.

After installing using this terminal command:

    sudo -v ; curl https://rclone.org/install.sh | sudo bash

the software was updated to the latest stable version available and all warning signs disappeared.

Therefore, I recommend installing Rclone directly using the official script on the [project download page](https://rclone.org/install/) or using the most up-to-date distribution packages, such as Fedora or Arch.


# 5. Configuring Rclone

After installation, you need to configure it: launch `rclone config` and follow the guided procedure:

1.  `n)` New remote: Type n and press Enter.
2.  `name:` Choose a name (e.g., my<sub>webdav</sub>).
3.  `Storage:` Search for “WebDAV” in the list.
4.  `url:` Enter the server address (e.g., <https://esempio.com/remote.php/dav/files/user/>).
5.  `vendor:` Choose the type of service (e.g., nextcloud, owncloud, or other).
6.  `user:` Enter a  username.
7.  `password:` Type “y” to enter the password and confirm it.
8.  `bearer_token:` Leave blank.
9.  `Edit advanced config?:` Type “n”.
10. `Keep this remote?:` Type “y” to save.
11. `q)` Quit config: Type q to exit.

Some commands:

-   Command to view remote files: rclone ls my<sub>webdav</sub>:/~
-   Command to copy a local folder to the server: rclone copy /home/user/documents my<sub>webdav</sub>:/backup
-   Command to perform synchronization (mirroring): `rclone sync /home/user/documents my_webdav:/backup`

However, the `rclone sync` command is unidirectional.

Unlike two-way synchronization, `sync` works according to the principle of mirroring: in short, the source commands, the destination obeys.

What happens in practice?
Let's imagine the command: `rclone sync local: remote`:

-   Latest local: Files are updated on the remote.
-   Latest remote: New files on the remote are overwritten by the old local versions.
-   Files only on the remote: They are permanently deleted to make the remote identical to the local.

If you want the latest files to always “win,” wherever they are located, you need to change the command to: `rclone bisync local: remote:`.

This enables two-way synchronization, managing conflicts and propagating changes on both sides, as is the case with Dropbox or OneDrive.

The complete command to use bisync is as follows:

    rclone bisync /local/path my_webdav:/remote_folder --resync

The `--resync` option is only used for the first execution, then it must be omitted.

To perform test operations, use the `--dry-run` option.

The complete command for testing is therefore as follows: `rclone bisync /local/folder my_webdav:/backup --dry-run -v`.

To make the operations effective, simply remove the `--dry-run` option.

The `-v` option, or “verbose,” is used to display the operations in progress. This can also be omitted.

Here is a summary of the results:

-   With `bisync`, if you modify a file on the WebDAV server, it will be copied locally and vice versa.
-   If a file is modified simultaneously on both sides, rclone will attempt to manage the conflict.

Please note that the `bisync` command is reported as experimental if Rclone is installed in the Debian and derivative repositories (at least to date). For this reason, I recommend installing the application from your own *repository*, as stated above.

In conclusion: *Rclone* is very fast! It also works anywhere in the folder tree.

Since I “discovered” *Rclone*, I have not used *Rsync* anymore.

