---
title: "LaTeX, three packages for one document"
date: 2022-04-08
slug: latex_standard_koma_arsclassica
categories:
  - Documents
tags:
  - LaTeX
image:
  placement: 3
  preview_only: true
  caption: 'LaTeX'
---

{{% toc %}}

## LaTeX, three packages for one document

The _standard_ version of [LaTeX](https://www.latex-project.org/) has a _"state of the art"_ typographic quality, suitable for any type of document.

For those who want to try different typographical solutions it is, however, possible to use _packages_ that modify the basic settings.

The result may be more or less preferable to the _standard_ version but it is, however, interesting to make some comparative tests. 

In this article I compare the title page of a hypothetical court document in the _standard_ version, in the version named _koma-script_ and in the further version named _ArsClassica_.

At the end of every paragraph I report the relative _preambles_ used for the generation of every version.

The images of the three title pages were framed with the open-source software _Digikam_.


## LaTeX in standard version

Below I report the title page of a agreement written in standard LaTeX

![LaTeX standard](agreement-normal-resized_v1.jpg)

The page layout is elegant, well-kept and well-proportioned: perfectly suited to the formal rigor of legal document.

Following is the relative preamble:

```tex
\documentclass[11pt]{article}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{graphicx}
\usepackage{grffile}
\usepackage{longtable}
\usepackage{wrapfig}
\usepackage{rotating}
\usepackage[normalem]{ulem}
\usepackage{amsmath}
\usepackage{textcomp}
\usepackage{amssymb}
\usepackage{capt-of}
\author{Franco Pasut}
\date{\today}
```




## LaTeX in koma-script version
This is, instead, the version with the "koma-script" package: the text of the sections is more _rounded_ and, consequently, they "detach" better from the base text.

A feature of this solution is the possibility to use font sizes larger than 12 pt.

![Package koma-script](agreement-koma-resized_v1.jpg)

Below is the related preamble:

```tex
\documentclass[12pt,a4paper]{scrartcl}
\usepackage[a4paper,top=2cm,bottom=3cm,left=2.5cm,right=2.5cm]{geometry}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{indentfirst}
\usepackage{paralist}
\usepackage{microtype}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage[official]{eurosym}
\usepackage{booktabs}
\usepackage{caption}
\usepackage{enumitem}
\usepackage{comment}
\usepackage{etoolbox}
\author{Franco Pasut}
\date{\today}
```


## LaTeX in ArsClassica version
Finally, here is the _ArsClassica_ version: extremely elegant, with the text of the current section at the top right (in this case it says "Index" because it is at the beginning of the document).

The separation between the text of the sections and the basic text is very clear.

Hypertext references are highlighted with a blue color that does not create problems in black and white printing but remains visible in the online version.



![Package arcslassica](agreement-arsclassica-resized_v1.jpg)

Here is the related preamble:


```tex
\documentclass[fontsize=12pt]{scrartcl}
\usepackage[eulerchapternumbers,beramono,pdfspacing]{classicthesis} \usepackage{arsclassica}
\usepackage[a4paper,top=2cm,bottom=2.5cm,left=2.5cm,right=2.5cm]{geometry}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{indentfirst}
\usepackage{paralist}
\usepackage{microtype}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{booktabs}
\usepackage{caption}
\usepackage{enumitem}
\usepackage{comment}
\usepackage{etoolbox}
\usepackage{hyperref}
\author{Franco Pasut}
\date{\today}
```

Thank you for your attention.
