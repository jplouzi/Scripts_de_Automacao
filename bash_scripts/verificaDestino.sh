#! /bin/bash


clear

echo "Informe o caminho para o Diretório:"

read DIRETORIO

if [ -d "$DIRETORIO" ]; then

	echo "Caminho ${DIRETORIO} existe."
else
	echo "O diretorio ${DIRETORIO} NÃO foi encontrado."

fi


