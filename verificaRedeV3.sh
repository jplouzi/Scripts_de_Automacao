#!/bin/bash

ARQUIVO_HOSTS="HOSTS.txt"

VERDE="\033[0;32m"
VERMELHO="\033[0;31m"
NC="\033[0m" # No Color

for host in $(cat $ARQUIVO_HOSTS); do
	ping -c 1 $host > /dev/null 2>&1

	if [ $? -eq 0 ] ; then
		echo -e "host $host está ${VERDE}ATIVO${NC}."
	else
		echo -e "host $host está ${VERMELHO}INATIVO${NC} ou com falha!"
	fi
done
