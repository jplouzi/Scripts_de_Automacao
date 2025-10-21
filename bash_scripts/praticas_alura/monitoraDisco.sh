#! /bin/bash

#Construa um script para monitorar o espaço em disco usando o comando df na coleta de informações.


LIMITE_CRITICO=85


clear
echo "==============================================================="
echo " Monitor de Espaço em Disco (Limite Crítico: $LIMITE_CRITICO%)"
echo "==============================================================="
echo ""



df -h | grep "^/dev/" | awk '{ print $1, $5 }'| while read -r FILESYSTEM USO_PERCENT; do

	USO_NUM=${USO_PERCENT%\%}

	if [ $USO_NUM -ge $LIMITE_CRITICO ]; then
		echo -e "⚠️ $FILESYSTEM está com $USO_PERCENT de uso!"
	else
		echo -e "✅ $FILESYSTEM está com $USO_PERCENT de uso!"
	fi

done


echo "==========================================="
echo " Verificação Concluída."
echo "==========================================="
