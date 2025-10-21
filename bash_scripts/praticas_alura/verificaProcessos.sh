#! /bin/bash

clear
echo "==========================================="
echo " Verificador de Status de Processo"
echo "==========================================="
echo ""

read -p "Informe o nome do processo que deseja verificar: " NOME_PROCESSO

if [ -z "$NOME_PROCESSO" ]; then
	echo "Erro: Nenhum nome de processo foi fornecido." >&2
	exit 1
fi

echo "Verificando por '$NOME_PROCESSO'..."
echo ""

HEADER=$(ps aux | head -n 1)

RESULTADO=$(ps aux | grep -i "$NOME_PROCESSO" | grep -v "grep" | grep -v "$0")

if [ -n "$RESULTADO" ]; then
    echo "Sucesso! Processo '$NOME_PROCESSO' está em execução."
    echo "----------------------------------------------------------------"

    echo "$HEADER"

    echo "$RESULTADO"

    echo "----------------------------------------------------------------"
else
    echo "Status: Processo '$NOME_PROCESSO' NÃO está em execução."
fi
