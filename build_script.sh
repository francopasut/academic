#!/bin/bash

# Comando per buildare il sito Hugo

hugo --gc --minify -b $URL

echo "Build di Hugo completata."

# Esempio di post-processing: copia di file aggiuntivi
echo "Eseguo post-processing con comando Python"

[build]
publish = "public"
pip install pagefind 
python3 -c 'import pagefind; import os; print(os.path.dirname(pagefind.__file__))'
python3 $(python3 -c 'import pagefind; import os; print(os.path.dirname(pagefind.__file__))')/pagefind --site public


echo "Post-processing completato."