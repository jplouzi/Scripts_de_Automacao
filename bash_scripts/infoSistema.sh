#!/bin/bash

#Exibe informações do sistema como proposto em aula

clear

echo "==================================="
echo "     INFORMAÇÕES DO SISTEMA"
echo "==================================="
echo ""


echo "Olá, Tudo Bem?"

echo "Este computador está nomeado como" $(hostname)
echo "em:"$(date)
echo "e sua configurações de rede são:" $(ip a)
echo ""
