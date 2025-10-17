#!/bin/bash

#Script para verificar quais hosts estao ativos em uma sub-rede /24

#verifica se o usuario forneceu um argumento ($1)

if [ -z "$1" ]; then
	echo "❌ Erro: Você precisa informar o prefixo de rede."
	echo "Uso: $0 <prefixo_de_rede>"
	echo "Exemplo: $0 192.168.1"
	exit 1
fi

#---fim da verificação---

PREFIXO=$1

echo "🔍 Iniciando varredura na rede $PREFIXO.0/24..."
echo "_____________________________________________"

for i in {1..254}; do
	IP="$PREFIXO.$i"

	ping -c 1 -W 1 "$IP" > /dev/null 2>&1

	if [ $? -eq 0 ]; then
		echo "✅ host $IP está ONLINE"
	else
		echo "❌ Host $IP está OFFLINE"
	fi
done

echo "--------------------------------------------"
echo "Varredura Concluída"
