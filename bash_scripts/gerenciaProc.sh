#!/bin/bash

#Script que lista 10 processos e mata (kill) se desejar o que estiver consumindo mais recursos
echo "Este Script Lista os 10 processos que mais usam recursos."
echo "Você deseja lista por (1) CPU ou (2) memoria
read ESCOLHA

echo "--------------------------------------------------"


if [ "$ESCOLHA" == "1" ]; then
	echo "--- TOP 10 PROCESSOS POR USO DE CPU ---"
	ps aux --sort=-%cpu | head -n 11
elif [ "$ESCOLHA" == "2" ]; then
	echo "--- TOP 10 PROCESSOS POR USO DE MEMÓRIA ---"
	ps aux --sort=-%mem | head -n 11
else
	echo "❌ Opção inválida. Saindo."
	exit 1
fi


echo "----------------------------------------------"
echo "Leitura (colunas): USER, PID, %CPU, %MEM, ... COMMAND"
echo ""
echo "Deseja 'matar' (kill) algum processo?"
echo "Digite o PID do processo (ou 'n' para sair):"
read PID_PARA_MATAR

if [[ "$PID_PARA_MATAR" == "n" || "$PID_PARA_MATAR" == "N" ]]; then
	echo "Ok, saindo."
	exit 0
fi

if ! [[ "$PID_PARA_MATAR" =~ ^[0-9]+$ ]]; then
	echo "❌ PID inválido. Não é um número. Saindo"
	exit 1
fi

echo "⚠️ ATENÇÃO: Você tem certeza que deseja matar o processo PID $PID_PARA_MATAR?"
echo "Isso pode fechar programas ou instabilizar o sistema."
echo "Digite 'sim' para confirmar:"
read CONFIRMACAO

if [ "$CONFIRMACAO" == "sim" ]; then
	kill "$PID_PARA_MATAR"

	if [ $? -eq 0 ]; then
		echo "✅ Processo $PID_PARA_MATAR encerrado com sucesso"
	else
		echo "❌ Falha ao tentar encerrar o processo $PID_PARA_MATAR."
		echo "(Talvez você precise rodar o script com 'sudo'?)"
	fi
else
	echo "Operação cancelada. Saindo."
fi


