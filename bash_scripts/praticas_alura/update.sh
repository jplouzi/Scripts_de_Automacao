#! /bin/bash

set -e


if [ "$(id -u)" -ne 0 ]; then
	echo "Erro: Este script precisa ser executado como root." >&2
	echo "Por favor, tente novamente usando: sudo ./update.sh" >&2
	exit 1
fi

clear

echo "==============================================="
echo "Inciando a atualização do sistema.."
echo "==============================================="
echo ""

echo "--- (Passo 1/4) Atualizando lista de pacotes (apt update) ---"
apt update
echo ""


echo "--- (Passo 2/4) Atualizando Pacotes instalados (apt upgrade) ---"
apt upgrade -y
echo ""

echo "--- (Passo 3/4) Removendo dependencias antigas (apt autoremove) ---"
apt autoremove -y
echo""

echo "--- (Passo 4/4) Limpando o cache de pacotes (apt clean) ---"
apt clean
echo ""

echo "=================================================="
echo "Atualização Concluída!"
echo "=================================================="
echo ""
