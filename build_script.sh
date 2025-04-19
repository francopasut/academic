#!/bin/bash

# Comando per buildare il sito Hugo

hugo --gc --minify -b $URL

echo "Build di Hugo completata."

# Esempio di post-processing: copia di file aggiuntivi
echo "Eseguo post-processing con comando Python"
pip install pagefind
python3 -m pagefind --site public

echo "Post-processing completato."