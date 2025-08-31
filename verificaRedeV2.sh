#!/bin/bash

#script que le hosts de um arquivo e e executa o comando ping para cada um.
ARQUIVO_HOSTS='HOSTS.txt'

for host in $(cat $ARQUIVO_HOSTS) ; do
	echo '---Verificando o Host: $host ---'
	ping -c 3 $host
done

echo '--- Verificação Concluída ---'
