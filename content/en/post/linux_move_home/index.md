---
title: "Linux: move \"home/user\" directory back to the same \"root\" partition"
date: 2021-07-27
canonical_url: "https://medium.com/@francopasut/linux-move-home-user-directory-back-to-the-same-root-partition-181c23eee15d"
slug: linux_move_home
categories:
  - Operating Systems
tags:
  - Linux
image:
  placement: 3
  caption: 'Peppermix Linux'
---



## What's my target?

I've installed, as it should always be, a Linux distribution in two separate partitions.

In particular: the *root* directory in */dev/sdb2* partition and the *home/user* directory in */dev/sdb3* one.

After some time, I wanted to return the *home/user* directory to the same *root* partition.

Why I need it? I'd like to dedicate every partition to different Linux distributions.

## What I've read before writing this article?

In the *net* I found many tutorials about moving the *home/user* directory to other partition, but not so many on the opposite operation.

Here are some references:

-   [Move the home directory back to a single partition](https://askubuntu.com/questions/122464/move-the-home-directory-back-to-single-partition#122466)
-   [Re: Partioning advice dualboot LM18.3 and 19](https://forums.linuxmint.com/viewtopic.php?p=1539963&sid=70b6125fb0326c3bd1d9b9f6b1f1ad02#p1539963)

I've resolved this *little* problem with a personal trick, perhaps not appreciated by Linux purists, but very simple and quick and successful.

## Here's my not elegant but working trick

I created a bootable stick with a portable system (specifically Peppermint on USB) and booted the computer from the external drive.


I used the automatic mounting of the partitions *sdb2* and *sb3* in graphical mode (just clicking on the relevant folders in the file manager).

![](automatic_mounting_partition.png)

Then I copied the folder *home/franco* from the *sdb3* partition, opened the folder *home* on the *sdb2* partition as root (explicit option in the
file manager) and simply pasted the copied material.

![](copy_paste_folder.png)

As final steps, I booted into the working operating system in maintenance mode, I commented out the line in *fstab* that contained the reference for the previous *home/franco* to *sdb3*, assigned to files, folder and subfolders the property to me with the following command: `chown -R franco:franco franco` and restarted the system.

NOW IT WORKS AS I NEED!

Thank you for your attention.

[Originally posted on Medium](https://medium.com/@francopasut/linux-move-home-user-directory-back-to-the-same-root-partition-181c23eee15d)
