#! /bin/bash

#esse codido solicita o usuario um caminho e faz a conversão das imagens de .jpg para .png

clear
read -p "Informe o diretorio das imagens:" DIRETORIO


if [ ! -d "$DIRETORIO" ]; then
    echo "Erro: O diretório '$DIRETORIO' não foi encontrado."
    exit 1
fi

echo "Iniciando conversão em '$DIRETORIO'..."

for arquivo_jpg in "$DIRETORIO"/*.jpg; do

    arquivo_png="${arquivo_jpg%.jpg}.png"

    if [ -f "$arquivo_jpg" ]; then
        echo "Convertendo: $arquivo_jpg  ->  $arquivo_png"

        convert "$arquivo_jpg" "$arquivo_png"
    else
        echo "Nenhum arquivo .jpg encontrado para converter."
        
        break
    fi
done

echo ""
echo "Imagens finalizadas"
