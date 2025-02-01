---
title: "LaTeX, tre pacchetti per un documento"
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



## LaTeX, tre pacchetti per un documento

La versione _standard_ di [LaTeX](https://www.latex-project.org/)  ha una qualità tipografica allo _"stato dell'arte"_, adatta a qualsiasi tipo di documento (ivi compresi gli atti giudiziari trattati nei miei precedenti articoli [LaTeX per atti giudiziari, configurazione di base](https://francopasut.blogspot.com/2018/12/latex-per-atti-giudiziari.html)  e [LaTeX e PCT: atti giudiziari strutturati e ipertestuali](https://francopasut.blogspot.com/2017/03/uso-di-latex-per-la-strutturazione.html), quest'ultimo contenente anche il link per scaricare il codice sorgente di un modello per atto giudiziario in LaTeX).

Per chi voglia provare diverse soluzioni tipografiche è, tuttavia, possibile utilizzare _pacchetti_  che modifichino le impostazioni di base.

Il risultato può essere più o meno preferibile  alla versione _standard_ ma è, comunque, interessante effettuare qualche test comparativo. 

In questo articolo metto a confronto il frontespizio di un ipotetico atto giudiziario nella versione _standard_, in quella denominata _koma-script_ ed in  quella ulteriore denominata _ArsClassica_.

Al termine di ogni paragrafo riporto i relativi _preamboli_ utilizzati per la generazione di ciascuna versione.

Le immagini dei tre frontespizi sono state incorniciate con il software open-source _Digikam_.

I nomi di luoghi e persone sono liberamente tratti dal romanzo _"Il giuoco delle perle di vetro"_ di Hermann Hesse.

## LaTeX in versione standard
Di seguito riporto il frontespizio di un atto giudiziario redatto in LaTeX standard

![Versione normale](castalia_normale_resized_v1.jpg)

L'impaginazione è elegante, curata e ben proporzionata: perfettamente adatta al rigore formale degli atti giudiziari.

Di seguito il relativo preambolo:

```tex
\documentclass[11pt]{article}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[italian]{babel}
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




## LaTeX in versione koma-script
Questa è, invece, la versione con il pacchetto "koma-script": il testo delle sezioni è piu _arrotondato_   e, di conseguenza, si "staccano" meglio dal testo base.

Un caratteristica di questa soluzione è la possibilità di utilizzare dimensioni di carattere superiori a 12 pt.

![Versione koma-script](castalia_koma_resized_v1.jpg)

Di seguito il relativo preambolo:

```tex
\documentclass[12pt,a4paper]{scrartcl}
\usepackage[a4paper,top=2cm,bottom=3cm,left=2.5cm,right=2.5cm]{geometry}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[italian]{babel}
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


## LaTeX in versione ArsClassica
Infine, ecco la versione _ArsClassica_: estremamente elegante, con testo di richiamo della sezione corrente in alto a destra (nel caso specifico riporta la dicitura "Indice" perché siama all'inizio del documento).

Lo stacco tra il testo delle sezioni e quello base è nettissimo.

I riferimenti ipertestuali sono evidenziati con un colore blu che non crea problemi di stampa in bianco e nero ma resta visibile nella versione online.
![Versione arcslassica](castalia_arsclassica_resized_v1.jpg)

Ecco il relativo preambolo:


```tex
\documentclass[fontsize=12pt]{scrartcl}
\usepackage[eulerchapternumbers,beramono,pdfspacing]{classicthesis} \usepackage{arsclassica}
\usepackage[a4paper,top=2cm,bottom=2.5cm,left=2.5cm,right=2.5cm]{geometry}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[italian]{babel}
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
\author{Franco Pasut}
\date{\today}
```

Grazie per  l'attenzione.
