#! /bin/bash

set -e


clear
echo "================================="
echo " Script de Criação de Usuário"
echo "================================="
echo ""


if [ "$(id -u)" -ne 0 ]; then
	echo "Erro: Este script precisa ser executado como root (ou com sudo)." >&2
	echo "Use: sudo ./criarUsuario.sh" >&2
	exit 1
fi


read -p "Informe o nome do Login do usuário:" USERNAME
read -p "Informe o Nome Completo do usuário:" FULL_NAME


if [ -z "$USERNAME" ] || [ -z "$FULl_NAME" ]; then
	echo "Erro: O nome de login e o nome completo não podem estar vazios." >&2
	exit 1
fi

id "$USARNAME" &>/dev/null
if [ $? -eq 0 ]; then
	echo "Erro: O usuário '$USERNAME' já existe no sistema." >&2
	exit 1
fi


echo ""
echo "Criando usuário '$USERNAME' como o nome '$FULL_NAME'..."

useradd -m -c "$FULL_NAME" -s /bin/bash "$USERNAME"

if [ $? -ne 0 ]; then
	echo "Erro: Falha ao executar o comando 'user add' (o nome pode ser inválido)."
	exit 1
fi

echo "Usuário '$USERNAME' criado com sucesso."
echo ""
echo "--- Definição da Senha ---"
echo "Você precisa definir uma senha inicial para o usuário '$USERNAME'."


passwd "$USERNAME"

if [ $? -ne 0 ]; then
    echo "Erro: Falha ao definir a senha." >&2
    echo "O usuário foi criado, mas está sem senha. Execute 'sudo passwd $USERNAME' manualmente." >&2
    exit 1
fi

echo ""

echo "======================================"

echo "Usuário '$USERNAME' configurado com sucesso!"

echo "Home: /home/$USERNAME"

echo "Shell: /bin/bash"

echo "======================================"

echo ""
