#!/bin/bash
#script simples para fazer backup de um diretorio

#Alterar  Origem e Destino para as pastas que deseja realizar o Backup
ORIGEM="/home/jplouzi/Documentos"

DESTINO="/home/jplouzi/Backups"

mkdir -p "$DESTINO"

DATA_HORA=$(date =%Y-%m-%d_%H-%M-%S)
NOME_ARQUIVO="backup-$DATA_HORA.tar.gz

ARQUIVO_FINAL="$DESTINO/$NOME_ARQUIVO"

echo "Iniciando backup de $ORIGEM..."

#(tar) comando de compressão
#-c : cria um arquivo
#-z : comprimir com gzip
#-p : preservar permissões
#-f : usar o nome de arquivo especificado

tar -czpf "$ARQUIVO_FINAL" "$ORIGEM"

echo "Backup Concluído com sucesso!"
echo "Arquivo salvo em: $ARQUIVO_FINAL"
