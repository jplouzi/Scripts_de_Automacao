#!/bin/bash

# Script simples para verificar o status de hosts importantes

clear

echo '========================================='
echo '      INICIANDO VERIFICAÇÃO DE REDE'
echo '========================================='
echo ''

HOST1='8.8.8.8'     #DNS GOOGLE
HOST2='1.1.1.1'     #DNS CLOUDFLARE
HOST_INTERNO='192.168.15.1' #GATEWAY

echo 'Verificando DNS do GOOGLE ($HOST1)'
ping -c 3 $HOST1

echo 'Verificando DNS do CLOUDFLARE ($HOST2)'
ping -c 3 $HOST2

echo 'Verificando GATEWAY ($HOST_INTERNO)'
ping -c 3 $HOST_INTERNO

echo ''

echo'--- Vericação Concluida ---'

echo '' 

