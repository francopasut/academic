---
title: "TOC automatico negli articoli in BLOGGER mediante codice HTML"
date: 2026-10-11
slug:  toc_automatic_blogger
categories:
  - Blog
tags:
  - HTML
  - Blogger
image:
  placement: 3
  preview_only: false 
  caption: 'Blogger TOC'
canonicalUrl: https://francopasut.blogspot.com/2026/10/toc-automatico-negli-articoli-in.html#more
---

- [1. Premessa](#1-premessa)
- [2. Contenitore dell'indice](#2-contenitore-dellindice)
- [3. Codice Javascript per la generazione dell'indice](#3-codice-javascript-per-la-generazione-dellindice)
- [4. Abbellire l'indice utilizzando il codice CSS](#4-abbellire-lindice-utilizzando-il-codice-css)
- [5. Funziona solo in Blogger?](#5-funziona-solo-in-blogger)


# 1. Premessa

Utilizzo, ogni tanto, Blogger come sistema personale per la pubblicazione di articoli.

Gli articoli sono strutturati con sezioni e sottosezioni e con un indice iniziale.

Gli articoli sono scritti, principalmente, in Org Mode con Emacs.

In questo caso l'indice viene  generato dallo stesso sistema di scrittura in fase di conversione da Org Mode ad HTML.

A volte, utilizzo altri sistemi di scrittura che non generano l'indice dei contenuti.

In tale casi sarebbe utile conoscere modalità di creazione dell'indice direttamente dal codice HTML.

Di recente ho trovato una soluzione, che condivido con voi.

# 2. Contenitore dell'indice

Nel punto in cui si desidera la generazione automatica dell'indice si inserisce il seguente codice:

`<div id="auto-toc"></div>`

Questo frammento di codice è un elemento HTML contenitore vuoto, tipicamente utilizzato come punto di inserimento (o anchor) per generare dinamicamente un indice dei contenuti (Table of Contents - TOC).

Analisi degli elementi:

-   Tag `<div ...></div>`: definisce un blocco contenitore (Division) vuoto all'interno del documento HTML.
-   Attributo `id="auto-toc"`: assegna un identificatore unico all'elemento all'interno del DOM (Document Object Model).
-   *auto-toc* sta convenzionalmente per "Automatic Table of Contents".

Poiché l'elemento è privo di contenuto visibile, il suo scopo principale è interagire con un altro script, solitamente JavaScript, come nel nostro caso.

# 3. Codice Javascript per la generazione dell'indice

Ecco, dunque, il codice che deve lavorare in combinazione con il contenitore sopra indicato.

Alla fine del sorgente si inserisce:

    <script>
    document.addEventListener("DOMContentLoaded", function() {
      const tocContainer = document.getElementById("auto-toc");
      const headings = document.querySelectorAll(".post-body h2, .post-body h3");
    
      if (headings.length === 0 || !tocContainer) return;
    
      let tocHtml = '<h3>Indice</h3><ul>';
    
      headings.forEach((heading, index) => {
        if (!heading.id) {
          heading.id = "sezione-" + (index + 1);
        }
    
        // Controlla il tipo di tag (H2 o H3) per applicare la classe di rientro
        const isH3 = heading.tagName.toLowerCase() === 'h3';
        const liClass = isH3 ? 'class="toc-h3"' : '';
    
        tocHtml += `<li ${liClass}><a href="#${heading.id}">${heading.innerText}</a></li>`;
      });
    
      tocHtml += '</ul>';
      tocContainer.innerHTML = tocHtml;
    });
    </script>

# 4. Abbellire l'indice utilizzando il codice CSS

Per "abbellire" il documento è possibile utilizzare anche i fogli di stile, come nel seguente esempio:

    <style>
    #auto-toc {
      background-color: #f8f9fa;
      border: 1px solid #e9ecef;
      border-left: 4px solid #0056b3;
      padding: 15px 20px;
      margin: 20px 0;
      border-radius: 4px;
    }
    
    #auto-toc h3 {
      margin-top: 0;
      margin-bottom: 10px;
      font-size: 1.1rem;
      color: #333;
    }
    
    #auto-toc ul {
      list-style-type: none !important;
      padding-left: 0 !important;
      margin-left: 0 !important;
      margin-bottom: 0;
    }
    
    #auto-toc li {
      list-style-type: none !important;
      margin-bottom: 6px !important;
    }
    
    #auto-toc a {
      text-decoration: none;
      color: #0056b3;
    }
    
    #auto-toc a:hover {
      text-decoration: underline;
    }
      #auto-toc li.toc-h3 {
      margin-left: 20px !important; /* Rientro a destra dell'elemento H3 */
      font-size: 0.95em;           /* (Opzionale) leggermente più piccolo per gerarchia */
    }
    </style>

Per quanto concerne il codice CSS io preferisco inserirlo all'interno dell'articolo. Ma questa è una scelta personale.

Di solito si consiglia di  inserire il codice CSS nel sorgente del tema per renderlo efficace in tutti gli articoli.

# 5. Funziona solo in Blogger?

Il codice è in formato HTML e, quindi, ci si aspetterebbe che funzioni anche fuori da Blogger.

In realtà non è così.

Nel codice dei temi di Blogger (sia classici che moderni), il tag o la variabile che stampa il contenuto dell'articolo è quasi sempre inserito dentro un elemento HTML come `<div class="post-body entry-content">...</div>`.

Quindi in Blogger l'indice funziona perché la piattaforma avvolge automaticamente il testo di ogni post all'interno di un contenitore con la classe CSS *.post-body*.

Se si prova ad aprire lo stesso documento  in locale (come file .html stand-alone nel browser) o in un altro editor, quel div esterno non esiste, facendo fallire la ricerca degli elementi h2 e h3.

Per rendere efficace il sorgente anche fuori da Blogger o si avvolge il contenuto in un `<div class="post-body">` oppure si modifica la stringa:

    const headings = document.querySelectorAll(".post-body h2, .post-body h3");

in questa:

    const headings = document.querySelectorAll("h2, h3");

La differenza è la seguente: il frammento `".post-body h2, .post-body h3"` diventa semplicemente `"h2, h3"`.

Grazie per l'attenzione.

