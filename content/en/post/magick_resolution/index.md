---
title: "Considerations on ImageMagick and resizing JPG and PNG images while preserving resolution"
date: 2026-09-20
slug:  magick-resolution
categories:
  - Blog
tags:
  - ImageMagick
image:
  placement: 3
  preview_only: false 
  caption: 'Magick resolution'
canonicalUrl: https://francopasut-en.blogspot.com/2026/09/considerations-on-imagemagick-and.html 
---

- [1. Introduction to using magick and convert in GNU/Linux](#1-introduction-to-using-magick-and-convert-in-gnulinux)
- [2. Version Check and Functionality Test](#2-version-check-and-functionality-test)
- [3. The Basic Command for Resizing an Image](#3-the-basic-command-for-resizing-an-image)
- [4. The Problem with JPG Images](#4-the-problem-with-jpg-images)
- [5. Processing Images in .png Format](#5-processing-images-in-png-format)


# 1. Introduction to using magick and convert in GNU/Linux

**ImageMagick** is an excellent open-source software package for creating and editing bitmap images.

In the most recent versions of **ImageMagick**, the command syntax has undergone a significant change between versions 6 and 7:

-   **ImageMagick 6 (legacy):** The main command for image operations is `convert`.
-   **ImageMagick 7 (current):** The main command has become `magick`.

As of September 3, 2026, the latest version is 7.1.2-31.

On systems running ImageMagick 7, using the old `convert` command triggers a
backward-compatibility alias (or wrapper) to `magick convert`.

<div class="WARNING" id="orgaa6f279">
<p>
<b>Note regarding Linux distribution compatibility:</b>
Not all distributions update ImageMagick to version 7. For example, in the official Ubuntu LTS repositories (including 22.04 LTS and 24.04 LTS), Canonical maintains the 6.x branch to ensure stability with various system packages.
</p>

</div>

To find out in advance which version is installed on your computer, you can easily check the version.


# 2. Version Check and Functionality Test

1.  **Checking the Installed Version**

Run the following command in the terminal to check which branch is installed:

    magick -version

*Note: If the shell returns “command not found,” try `convert -version`.*

1.  **Checking the Result**

Check the first line of the output in the terminal:

-   If **Version: ImageMagick 7.x.x** appears, the system supports the `magick` command.
-   If **Version: ImageMagick 6.x.x** appears, you must use the legacy syntax `convert`.

Therefore, to run commands on distributions that still use version 6, you must use the `convert` command instead of `magick`.

In this article, I will use the **ImageMagick 7** syntax (`magick`).


# 3. The Basic Command for Resizing an Image

The structure of the basic ImageMagick command for resizing an image is very simple:

-   Type the command `magick` in the Linux terminal.
-   Type the name of the input image.
-   Enter the `-resize` option.
-   Specify the resize amount.
-   Enter the name of the output image.

For example: in the following command, an image named “image.png” is resized by 50% and saved as “image<sub>converted.png</sub>”.

`magick image.png -resize 50% image_converted.png`

The conversion is successfully performed but with a noticeable loss of detail.

The following is a *collage* of a zoomed-in detail of the same image resized using the command above, first at 1408×768 pixels and then at 704×384 pixels, half the previous size:

![img](./collage-5-9-26.png)

It is clear that the image with half the resolution is blurrier than the original, to the point where the text characters are unreadable.


# 4. The Problem with JPG Images

I tried to reduce the size of a JPG image and ended up with an output file larger than the original.

How is that possible?

This result is due to the nature of the JPEG format and the way image-processing software handles compressed files.

The JPEG/JPG format was originally designed as a lossy compression algorithm (meaning it results in a loss of information).

To reduce the amount of disk space used, the algorithm exploits the limitations of human visual perception: it discards details and color nuances that our eyes have trouble distinguishing.

This means that a JPG file is already the result of a compromise: it has already lost some of its original color information in order to remain lightweight.

When ImageMagick processes a JPG, it does not act directly on the compressed file.

The workflow consists of three mandatory steps:

-   Decompression: The program opens the JPG file and “unpacks” it into RAM in an uncompressed format.
-   Processing: It applies the specified parameters (resizing, quality adjustment, filters).
-   Recompression from scratch: The software re-encodes the image to save it to disk.

During the third step, if the quality parameters specified in the recompression algorithm are higher than those used by the original file, ImageMagick will attempt to encode the image while preserving more detail than the source file actually contains.

The final result may, therefore, be larger in file size, without any gain in visual quality.

Therefore: I do not recommend resizing JPEG images without a loss of resolution.


# 5. Processing Images in .png Format

The PNG format is lossless: it does not use a simple percentage-based quality slider like JPG does.

To reduce the file size of a PNG while maintaining the resolution (pixels) and sharpness, I tried two solutions.

First, I adjusted the following parameters:

-   `strip`, which removes EXIF metadata, redundant ICC color profiles, and creation information.
-   `quality 95`: in ImageMagick PNGs, the first digit (9) sets the zlib compression level from 0 to 9 (where 9 is the maximum);

the second digit (5) sets the type of adaptive compression filter (5 = Paeth filter).

Here is the complete command syntax:

`magick input.png -strip -quality 95 output.png`

This combination achieves the lowest possible file size without affecting the image data.

In this case, the quality remains lossless, but the reduction in file size is very modest: in my case, 19.23%.

Then I tried a more drastic solution: reducing the color palette.

By converting the image to PNG-8 format (with a palette of up to 256 colors), the file goes from 24/32 bits to 8 bits per pixel.

If the PNG contains illustrations, software screenshots, text, or icons (rather than complex photographs with infinite shades), this strategy can reduce the file size by up to 80%.

For graphics and web interfaces, the difference will be imperceptible, and the file size will drop dramatically.

The formula is as follows:

`magick input.png -strip -colors 256 png8:output.png`

With this last solution, I achieved a 77.66% reduction from the original, without any significant loss of detail:

![img](./comparazione_immagini_13-9-2026.jpg)

Thank you for your attention.

