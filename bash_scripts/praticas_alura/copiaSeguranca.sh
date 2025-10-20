#!/bin/bash

clear

DATA_HORA=$(date +%Y-%m-%d_%H-%M-%S)
NOME_ARQUIVO="backup-$DATA_HORA.tar.gz"

DESTINO="/home/backups"

mkdir -p "$DESTINO"

read -p "Informe o caminho do Diretorio para backup:" DIRETORIO

ARQUIVO_FINAL="$DESTINO/$NOME_ARQUIVO"

if [ -d "$DIRETORIO" ]; then

	tar -czpf "$ARQUIVO_FINAL" "$DIRETORIO"
	echo "Backup concluido com sucesso!"
else
	echo "Não foi possivel concluir o Backup ${DIRETORIO} inexistente."

fi
