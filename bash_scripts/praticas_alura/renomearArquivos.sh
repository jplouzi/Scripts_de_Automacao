#! /bin/bash

clear

echo "==========================================="
echo "    Renomeador de Arquivos"
echo "==========================================="
echo ""


read -p "Informe o caminho do diretório:" DIRETORIO


if [ ! -d "$DIRETORIO" ]; then
	echo ""
	echo "Erro: O diretório '$DIRETORIO' não foi encontrado."
	exit 1
fi

echo ""
echo "O que você deseja fazer?"
echo " 1) Adicionar um PREFixo (ex: backup_arquivo.txt)"
echo " 2) Adicionar um SUFixo (ex: arquivo_backup.txt)"
read -p "Escolha a opção (1 ou 2): " ESCOLHA
echo ""

case "$ESCOLHA" in
	1)
		read -p "Informe o PREFixo desejado:" PREFIXO
		echo "====================================="
		echo "Iniciando... (Prefixo: '$PREFIXO')"
		echo "====================================="

		for file in "$DIRETORIO"/*; do
			if [ -f "$file" ]; then
				nome_arquivo=$(basename "$file")
				novo_nome="$DIRETORIO/$PREFIXO-$nome_arquivo"

				mv -n "$file" "$novo_nome"
				echo "Renomeado: $nome_arquivo -> $(basename "$novo_nome")"
			fi
		done
		;;
	2)
		read -p "Informe o SUFixo desejado:" SUFIXO
                echo "====================================="
                echo "Iniciando... (Sufixo: '$SUFIXO')"
                echo "====================================="

                for file in "$DIRETORIO"/*; do
                        if [ -f "$file" ]; then
                                nome_arquivo=$(basename "$file")
				extensao="${nome_arquivo##*.}"
				nome_base="${nome_arquivo%.*}"

				if ["$nome_base" != "$nome_arquivo" ]; then
                               		novo_nome="$DIRETORIO/$nome_base-$SUFIXO.$extensao"
				else
					novo_nome="$DIRETORIO/$nome_arquivo-$SUFIXO"
				fi

                                mv -n "$file" "$novo_nome"
                                echo "Renomeado: $nome_arquivo -> $(basename "$novo_nome")"
                        fi
                done
                ;;

	*)
		echo "Erro: Opção '$ESCOLHA' inválida. Saindo.">&2
		exit 1
		;;
esac

echo "===================================="
echo "Processo concluído!"
echo "===================================="
