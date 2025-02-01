---
title: "Ridurre la dimensione di documenti PDF singoli o multipli in GNU/Linux Bash e Python"
date: 2024-03-09
slug:  shrink_pdf_bash_python
categories:
  - Blog
tags:
  - PDF
  - Python
  - Linux
image:
  placement: 3
  preview_only: false 
  caption: 'Compressione di documenti'
---

**Abstract**: *la compressione di documenti PDF è una tecnica utile per ridurre lo spazio occupato da questi *file* e facilitarne la trasmissione e l'archiviazione.* 
*In questo articolo, partendo da una pagina dedicata alla compressione di PDF singoli, presento  due metodi per comprimere documenti PDF  multipli.* 
*La  pagina di riferimento è la seguente: "[Linux shell script to reduce PDF file size](https://bash.cyberciti.biz/file-management/linux-shell-script-to-reduce-pdf-file-size/) (è richiesta una semplice verifica  per entrare) e consente di operare su PDF singoli in codice *bash* a linea di comando nel terminale di GNU/Linux.*
*Sulla base del precedente ho provato ad estendere la  procedura per operare su PDF multipli.*
*Alla fine presento  una semplice applicazione in *Python* con interfaccia grafica.* 
*Ammetto di avere chiesto alcuni aiuti a ChatGPT e Copilot.*

**Indice:**

- [1. La condizione necessaria.](#1-la-condizione-necessaria)
- [2. Lo script di riferimento per la riduzione delle dimensioni di singoli PDF.](#2-lo-script-di-riferimento-per-la-riduzione-delle-dimensioni-di-singoli-pdf)
  - [2.1. Analisi ed utilizzo dello script.](#21-analisi-ed-utilizzo-dello-script)
- [3. Script derivato per operare su PDF multipli.](#3-script-derivato-per-operare-su-pdf-multipli)
  - [3.1. Utilizzo del nuovo script.](#31-utilizzo-del-nuovo-script)
  - [3.2. Quale risoluzione?](#32-quale-risoluzione)
- [4. Applicazione in Python.](#4-applicazione-in-python)





## 1. La condizione necessaria.

La condizione  necessaria è che nel sistema operativo sia installato *[Ghostscript](https://www.ghostscript.com)*.

La verifica è molto semplice, riporto le modalità di verifica ed installazione per tre distribuzioni GNU/Linux fondamentali. 

- Verifica:
  - In Arch Linux: `pacman -Q ghostscript`
  - In Ubuntu Linux: `dpkg -l | grep ghostscript`
  - In Fedora Linux: `rpm -q ghostscript`
- Installazione:
    - In Arch Linux: `sudo pacman -S ghostscript`
    - In Ubuntu Linux: `sudo apt install ghostscript`
    - In Fedora Linux: `rpm -q ghostscript`



## 2. Lo script di riferimento per la riduzione delle dimensioni di singoli PDF.

Questo articolo nasce da una soluzione trovata in rete, molto utile per  riduzione di singoli  PDF.

Ecco il sorgente, compresi gli avvisi di Copyright richiesti dalla licenza di libera distribuzione, tratto dalla   pagina di riferimento  "[Linux shell script to reduce PDF file size](https://bash.cyberciti.biz/file-management/linux-shell-script-to-reduce-pdf-file-size/):




```bash
#!/bin/sh
 
# http://www.alfredklomp.com/programming/shrinkpdf
# Licensed under the 3-clause BSD license:
#
# Copyright (c) 2014-2019, Alfred Klomp
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
# 3. Neither the name of the copyright holder nor the names of its contributors
#    may be used to endorse or promote products derived from this software
#    without specific prior written permission.
#
#
# Modified by Vivek Gite to suit my needs
#
shrink ()
{
	gs					\
	  -q -dNOPAUSE -dBATCH -dSAFER		\
	  -sDEVICE=pdfwrite			\
	  -dCompatibilityLevel=1.3		\
	  -dPDFSETTINGS=/screen			\
	  -dEmbedAllFonts=true			\
	  -dSubsetFonts=true			\
	  -dAutoRotatePages=/None		\
	  -dColorImageDownsampleType=/Bicubic	\
	  -dColorImageResolution=$3		\
	  -dGrayImageDownsampleType=/Bicubic	\
	  -dGrayImageResolution=$3		\
	  -dMonoImageDownsampleType=/Subsample	\
	  -dMonoImageResolution=$3		\
	  -sOutputFile="$2"			\
	  "$1"
}
 
check_smaller ()
{
	# If $1 and $2 are regular files, we can compare file sizes to
	# see if we succeeded in shrinking. If not, we copy $1 over $2:
	if [ ! -f "$1" -o ! -f "$2" ]; then
		return 0;
	fi
	ISIZE="$(echo $(wc -c "$1") | cut -f1 -d\ )"
	OSIZE="$(echo $(wc -c "$2") | cut -f1 -d\ )"
	if [ "$ISIZE" -lt "$OSIZE" ]; then
		echo "Input smaller than output, doing straight copy" >&2
		cp "$1" "$2"
	fi
}
 
usage ()
{
	echo "Reduces PDF filesize by lossy recompressing with Ghostscript."
	echo "Not guaranteed to succeed, but usually works."
	echo "  Usage: $1 infile [outfile] [resolution_in_dpi]"
}
 
IFILE="$1"
 
# Need an input file:
if [ -z "$IFILE" ]; then
	usage "$0"
	exit 1
fi
 
# Output filename defaults to "-" (stdout) unless given:
if [ ! -z "$2" ]; then
	OFILE="$2"
else
	OFILE="-"
fi
 
# Output resolution defaults to 72 unless given:
if [ ! -z "$3" ]; then
	res="$3"
else
	res="90"
fi
 
shrink "$IFILE" "$OFILE" "$res" || exit $?
 
check_smaller "$IFILE" "$OFILE"
```

Il codice deve essere inserito in un file denominato a piacimento, ad esempio `shrinkpdf.sh` con i  permessi di esecuzione (`chmod +x ./shrinkpdf.sh`).


### 2.1. Analisi ed utilizzo dello script.

Lo *script* definisce  una funzione denominata  *shrink* che attiva Ghostscript con una serie di opzioni per la compressione del PDF. 

L'utilizzo è molto semplice, 
basta seguire questo schema:

```bash
./shrinkpdf.sh input.pdf output.pdf [resolution]
```


La risoluzione utilizzata per ridurre i PDF è specificata dalla variabile *res*:

```bash
res="90"
```

Questo valore viene passato come argomento alla funzione *shrink*:

```bash
shrink "$IFILE" "$OFILE" "$res" || exit $?
```

Quindi, la risoluzione utilizzata per ridurre i PDF è di 90 DPI, a meno che non venga specificata una diversa risoluzione come terzo argomento quando si chiama lo script.

## 3. Script derivato per operare su PDF multipli.

Fino a qui, tuttavia, non c'è nulla di nuovo rispetto alla formula trovata in rete.

Sulla base di quella soluzione ho provato a creare uno *script*  per effettuare riduzioni seriali di documenti, ovvero con un *ciclo* che operi su un numero multiplo virtualmente infinito di documenti.



In questo *script*, derivato dal precedente, viene utilizzato  un ciclo per iterare su tutti i file PDF presenti nella cartella specificata e su tali documenti viene applicata  la funzione `shrink` a ciascun di essi. 


```bash
#!/bin/bash

shrink ()
{
    gs                          \
      -q -dNOPAUSE -dBATCH -dSAFER       \
      -sDEVICE=pdfwrite          \
      -dCompatibilityLevel=1.3       \
      -dPDFSETTINGS=/screen           \
      -dEmbedAllFonts=true            \
      -dSubsetFonts=true             \
      -dAutoRotatePages=/None        \
      -dColorImageDownsampleType=/Bicubic \
      -dColorImageResolution=$3      \
      -dGrayImageDownsampleType=/Bicubic  \
      -dGrayImageResolution=$3       \
      -dMonoImageDownsampleType=/Subsample \
      -dMonoImageResolution=$3       \
      -sOutputFile="$2"          \
      "$1"
}

check_smaller ()
{
    # If $1 and $2 are regular files, we can compare file sizes to
    # see if we succeeded in shrinking. If not, we copy $1 over $2:
    if [ ! -f "$1" ] || [ ! -f "$2" ]; then
        return 0
    fi
    ISIZE="$(wc -c < "$1")"
    OSIZE="$(wc -c < "$2")"
    if [ "$ISIZE" -lt "$OSIZE" ]; then
        echo "$1" >&2
    fi
}

usage ()
{
    echo "Reduces PDF filesize by lossy recompressing with Ghostscript."
    echo "Not guaranteed to succeed, but usually works."
    echo "  Usage: $1 infile [outfile] [resolution_in_dpi]"
}

if [ $# -lt 1 ]; then
    usage "$0"
    exit 1
fi

INPUT_FOLDER="$1"

if [ ! -d "$INPUT_FOLDER" ]; then
    echo "Error: $INPUT_FOLDER is not a directory."
    exit 1
fi

# Loop through all PDF files in the directory
for FILE in "$INPUT_FOLDER"/*.pdf; do
    [ -e "$FILE" ] || continue
    OUTPUT_FILE="${FILE%.pdf}_shrink.pdf"
    shrink "$FILE" "$OUTPUT_FILE" 90 || exit $?
    check_smaller "$FILE" "$OUTPUT_FILE"
done
```

### 3.1. Utilizzo del nuovo script.

Questo script accetta una cartella come argomento e cicla su tutti i file PDF in quella cartella, applicando la funzione `shrink` a ciascuno di essi. Infine, stampa i nomi dei file PDF con dimensioni ridotte.

Per vedere il sistema al lavoro basta procedere come segue:

- creare un file, ad esempio `multishinkpdf.sh`
- renderlo eseguibile con `chmod +x multishinkpdf.sh`
- eseguire il file passando, come secondo argomento, l'indirizzo di una cartella contenente i PDF da ridurre.

Al termine dell'operazione nella stessa cartella si troveranno i PDF originali e quelli ridotti con l'estensione *_shrink*.

### 3.2. Quale risoluzione?

La risoluzione, anche in questo caso,  è preimpostata a 90 DPI, ma può essere impostato un valore diverso come terzo argomento alla funzione shrink.

Ad esempio, per  ridurre i PDF a 150 DPI, occorre modificare la chiamata alla funzione *shrink* in questo modo:

```bash
shrink "$FILE" "$OUTPUT_FILE" 150 || exit $?
```

In questo modo, i PDF verranno ridotti utilizzando una risoluzione di 150 DPI anziché 90 DPI. 

È possibile  specificare qualsiasi valore di risoluzione per trovare il bilanciamento ideale tra riduzione e peso dei documenti.

## 4. Applicazione in Python.

A questo punto mi sono chiesto come creare un sistema **grafico** che svolgesse la stessa funzione, consentendo la scelta di una cartella contenente i PDF da comprimere e risoluzione in DPI.

Quella che segue è una semplice implementazione in *Python* denominata "*PDF Shrinker*".

Questa è la semplice finestra dell'applicazione:

![python_pdf](shrinkpdf-python.png)

E questo è il codice sorgente:


```python
import os
import subprocess
import tkinter as tk
from tkinter import filedialog, messagebox
from tkinter.ttk import Progressbar

def shrink(input_file, output_file, resolution, progress_var):
    command = [
        "gs",
        "-q", "-dNOPAUSE", "-dBATCH", "-dSAFER",
        "-sDEVICE=pdfwrite",
        "-dCompatibilityLevel=1.3",
        "-dPDFSETTINGS=/screen",
        "-dEmbedAllFonts=true",
        "-dSubsetFonts=true",
        "-dAutoRotatePages=/None",
        "-dColorImageDownsampleType=/Bicubic",
        f"-dColorImageResolution={resolution}",
        "-dGrayImageDownsampleType=/Bicubic",
        f"-dGrayImageResolution={resolution}",
        "-dMonoImageDownsampleType=/Subsample",
        f"-dMonoImageResolution={resolution}",
        "-sOutputFile=" + output_file,
        input_file
    ]
    
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    while True:
        output = process.stderr.readline().decode().strip()
        if not output:
            break
        if output.startswith('Processing pages'):
            parts = output.split(' ')
            if len(parts) > 2:
                current_page = int(parts[2])
                progress_var.set((current_page / total_pages) * 100)
                root.update_idletasks()

def check_smaller(input_file, output_file):
    if not (os.path.isfile(input_file) and os.path.isfile(output_file)):
        return False
    isize = os.path.getsize(input_file)
    osize = os.path.getsize(output_file)
    return isize < osize

def browse_folder():
    folder_path = filedialog.askdirectory()
    if folder_path:
        input_folder_entry.delete(0, tk.END)
        input_folder_entry.insert(0, folder_path)

def process_folder():
    input_folder = input_folder_entry.get()
    if not os.path.isdir(input_folder):
        messagebox.showerror("Error", f"{input_folder} is not a directory.")
        return

    resolution = resolution_entry.get()
    try:
        resolution = int(resolution)
    except ValueError:
        messagebox.showerror("Error", "Resolution must be an integer.")
        return

    total_pdf_files = sum(1 for file_name in os.listdir(input_folder) if file_name.endswith(".pdf"))
    progress_var.set(0)
    for index, file_name in enumerate(os.listdir(input_folder)):
        if file_name.endswith(".pdf"):
            input_file = os.path.join(input_folder, file_name)
            output_file = os.path.join(input_folder, f"{os.path.splitext(file_name)[0]}_shrink.pdf")
            shrink(input_file, output_file, resolution, progress_var)
            if check_smaller(input_file, output_file):
                result_listbox.insert(tk.END, output_file)
        progress_var.set((index + 1) / total_pdf_files * 100)
        root.update_idletasks()

def close_application():
    root.destroy()

# GUI Setup
root = tk.Tk()
root.title("PDF Shrinker")

input_folder_label = tk.Label(root, text="Input Folder:")
input_folder_label.grid(row=0, column=0, padx=5, pady=5, sticky="e")

input_folder_entry = tk.Entry(root, width=50)
input_folder_entry.grid(row=0, column=1, padx=5, pady=5)

browse_button = tk.Button(root, text="Browse", command=browse_folder)
browse_button.grid(row=0, column=2, padx=5, pady=5)

resolution_label = tk.Label(root, text="Resolution (dpi):")
resolution_label.grid(row=1, column=0, padx=5, pady=5, sticky="e")

resolution_entry = tk.Entry(root)
resolution_entry.grid(row=1, column=1, padx=5, pady=5)

process_button = tk.Button(root, text="Process Folder", command=process_folder)
process_button.grid(row=2, column=0, columnspan=3, padx=5, pady=5)

progress_var = tk.DoubleVar()
progress_bar = Progressbar(root, variable=progress_var, maximum=100)
progress_bar.grid(row=3, column=0, columnspan=3, padx=5, pady=5)

close_button = tk.Button(root, text="Close", command=close_application)
close_button.grid(row=4, column=0, columnspan=3, padx=5, pady=5)

root.mainloop()
```

Per l'esecuzione occorre, ovviamente, riportare il codice in un file `.py` e lanciarlo con  `python file_name.py` o `python3 file_name.py`.

Se trovate errori di codice fatemi sapere.

Grazie per l'attenzione.
