#!/bin/bash


ARQUIVO_SERVICO="servico.txt"

VERDE="\033[0;32m"
VERMELHO="\033[0;31m"
NC="\033[0m"

clear

for serv in $(cat $ARQUIVO_SERVICO); do
	systemctl is-active --quiet $serv

	if [ $? -eq 0 ] ; then
		echo -e "Serviço $serv está ${VERDE}ATIVO${NC}."
	else
		echo -e "Serviço $serv está ${VERMELHO}INATIVO${NC} ou com falha."
	fi
done
