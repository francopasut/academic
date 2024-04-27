---
title: "Python: applicazione per copiare testo da vari PDF e raccoglierlo in un unico documento in formato Markdown."
date: 2024-04-26
slug:  python_pdf_collect_content_markdown
categories:
  - Blog
tags:
  - Markdown
  - Python
  - PDF
image:
  placement: 3
  preview_only: false 
  caption: 'Python, PDF e Markdown'
---


<p align="center">
  <i>Abstract:</i>
</p>

Semplice applicazione in Python per estrarre testo da vari PDF ed inserirlo in un unico documento Markdown.

- [1. Oggetto dell'articolo.](#1-oggetto-dellarticolo)
- [2. Analisi del sorgente in Python.](#2-analisi-del-sorgente-in-python)
- [3. Il codice sorgente completo in Python.](#3-il-codice-sorgente-completo-in-python)

## 1\. Oggetto dell'articolo.

L'obiettivo è quello di ottenere uno *script* che permetta di raccogliere il testo contenuto in vari PDF generati direttamente da programmi di videoscrittura e di inserire i vari frammenti in un unico documento in formato Markdown separando i  frammenti con titoli di secondo livello corrispondenti al nome dei documenti di provenienza.

La soluzione "manuale" è quella di copiare il testo dai singoli documenti, uno per uno, e di incollarlo in un secondo documento.

Oppure si potrebbe costruire una semplice applicazione in Python che svolga tutto il lavoro automaticamente, risparmiando una quantità di tempo direttamente proporzionale al numero di documenti da elaborare.

Lo *script*, generato  con l'aiuto di Copilot (non essendo io un programmatore), necessita  dell'installazione della libreria `PyPDF2`.

Attenzione: **in questo articolo NON si parla  di riconoscimento ottico dei caratteri (OCR).** Per tale argomento rimando ad un [altro mio articolo](https://francopasut.netlify.app/it/post/ocr_linux_tesseract/).

## 2\. Analisi del sorgente in Python.

Trattandosi di effettuare interventi a livello di sistema operativo, occorre, innanzitutto,  importare il modulo *os*.

Come, poi, sopra anticipato occorre importare il modulo *PdfReader* dalla libreria *PyPDF2*, che deve, quindi, essere installata prima di lanciare lo *script*.

Quindi si inizia con:

```python
import os
from PyPDF2 import PdfReader
```

Occorre, poi, definire una variabile, qui denominata *pdf_directory*,   contenente il percorso della cartella dove si trovano i documenti PDF da elaborare,  sostituendo la stringa `path/to/pdf/folder` con il percorso effettivo:


```python
pdf_directory = 'path/to/pdf/folder'
```

nonché inizializzare un'altra variabile, vuota, destinata a raccogliere i vari frammenti all'interno del documento in formato Markdown:

```python
markdown_content = ""
```

A questo punto inizia (utilizzando le funzioni del modulo *os*)  la sequenza delle iterazioni nei file presenti nella cartella indicata nella prima variabile:

```python
for filename in os.listdir(pdf_directory):
    if filename.endswith('.pdf'):
```

Da notare: il controllo che il nome del documento finisca per ".pdf".

Segue, quindi, l'attribuzione del percorso e del nome del file alla variabile *pdf_path*:

```python
        pdf_path = os.path.join(pdf_directory, filename)
```

A questo punto il programma legge il testo del PDF:

```python
        reader = PdfReader(pdf_path)
        text = ""
```

Il frammento seguente, poi, itera attraverso le pagine e aggiunge il testo estratto da ciascuna pagina alla variabile *text*, separandolo da un carattere di nuova riga (`\n`)

```python
        for page in reader.pages:
            text += page.extract_text() + "\n"
```

Dopo la raccolta del contenuto da tutte le pagina di ciascun documento il programma aggiunge il contenuto formattato in markdown alla variabile `markdown_content`:

```python
        markdown_content += f"## {filename}\n{text}\n"
```

La stringa include:

- `## {filename}` che inserisce il nome del file come titolo di secondo livello in Markdown. Da notare il *doppio cancelletto* che è il simbolo del titolo di secondo livello secondo la standard di Markdown.
- `\n` aggiunge una nuova riga dopo il titolo del documento.
- `{text}` include il contenuto del testo estratto dalle varie pagine.
- `\n` aggiunge una nuova riga alla fine del contenuto.

Alla fine, il risultato dell'operazione viene salvato in un documento in formato Markdown:

```path
with open('extracted_content.md', 'w', encoding='utf-8') as md_file:
    md_file.write(markdown_content)
```

e viene stampato a video un messaggio finale con l'esito dell'operazione:

```python
print("Il contenuto di tutti i file PDF è stato estratto con successo e salvato in extracted_content.md")
```

## 3\. Il codice sorgente completo in Python.

Ecco il sorgente completo:

```python
import os
from PyPDF2 import PdfReader

pdf_directory = 'path/to/pdf/folder'

markdown_content = ""

for filename in os.listdir(pdf_directory):
    if filename.endswith('.pdf'):
        pdf_path = os.path.join(pdf_directory, filename)
        
        reader = PdfReader(pdf_path)
        text = ""
        
        for page in reader.pages:
            text += page.extract_text() + "\n"
        
        markdown_content += f"## {filename}\n{text}\n"

with open('extracted_content.md', 'w', encoding='utf-8') as md_file:
    md_file.write(markdown_content)

print("Il contenuto di tutti i file PDF è stato estratto con successo e salvato in extracted_content.md")
```

A questo punto abbiamo un documento in Markdown contenente frammenti di testo raccolti da vari altri documenti. 

Il documento in Markdown si potrà editare con uno dei sistemi di scrittura descritti  nell'articolo [Markdown con Vim, Emacs, Sublime Text 4 e Visual Studio Code](https://francopasut.netlify.app/it/post/markdown-vim-emacs-sublime-vscode/).

Il programma è molto semplice ma, per quanto mi risulti, fa il suo lavoro correttamente. 

Grazie per l'attenzione.
