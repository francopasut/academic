---
title: "Vim: sostituire testo in tutti i buffer aperti con un solo comando"
date: 2022-09-20
slug: vim_substitution_buffers
categories:
  - Editors
tags:
  - Vim
image:
  placement: 3
  preview_only: false 
  caption: 'Vim Is Magic'
---



##  Vim: è necessario sostituire del testo in tutti i buffer aperti? ##

Avete necessità di effettuare una sostituzione tra due parole o frammenti di testo in tutti i documenti aperti?

La prima opzione è quella di aprire tutti i documenti e di effettuare una ricerca con sostituzione in ciascuno di essi.

La stringa di ricerca e sostituzione sarebbe simile a quella sotto riportata dove   `foo` sarebbe il dato da sostituire e `bar`  il dato sostituto.

```vim
%s/foo/bar/g
```



La lettera `g` a fine stringa determina la sostituzione **g**lobale evitando la richiesta di accettazione per ogni elemento sostituito.



## Vim: è possibile effettuare l'operazione con un solo comando? ##

Quello precedentemente illustrato è già un buon sistema, ma si può fare di meglio: si possono sostituire **tutti gli elementi in tutti i documenti** aperti in Vim con un **unico comando**.

Il comando è il seguente:

```vim
:bufdo %s/foo//g | w
```

In pratica il comando `bufdo` estende l'operazione a tutti i buffer aperti. Il nome stesso è mnemonico in quanto deriva da: *buffer do*, ovvero *da fare in ogni buffer*.

La barra verticale visibile alla fine della formula costitisce un *argomento del comando* che  lancia, dopo che ogni buffer ha completato le sostituzioni, il comando posto alla destra della barra stessa.

In questo caso,  il comando posto alla destra è la lettera `w` che scrive  (**w**rite), ovvero salva, i rispettivi *buffer*.

Se non fosse presente la barra verticale sarebbe salvato soltanto l'ultimo documento elaborato.

Grazie per l'attenzione
