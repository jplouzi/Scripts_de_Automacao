#! /bin/bash

clear

read -p "Informe o nome do arquivo:" MEU_ARQUIVO

if [ -e "$MEU_ARQUIVO" ]; then

	echo "Arquivo existente."
else
	echo "Arquivo inexistente."
fi
