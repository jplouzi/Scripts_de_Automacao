#!/bin/bash

# --- Script para Analisar Logs de Erro de Processos ---

clear
echo "========================================="
echo "  Analisador de Logs de Erros de Processos"
echo "========================================="
echo ""


KEYWORDS="failed|segfault|segmentation fault|critical|panic|oom-killer|killed process|core dumped"


DEFAULT_HORAS=24


if [ "$(id -u)" -ne 0 ]; then
   echo "Aviso: Este script pode precisar de 'sudo' para ler todos os logs."
   echo "Se você não vir resultados, tente: sudo $0"
   echo ""
   sleep 2 # Pequena pausa para o usuário ler
fi

RESULTADOS=""

# Checa se o comando 'journalctl' (do systemd) existe
if command -v journalctl &> /dev/null; then
    echo "--- Usando 'journalctl' (systemd) ---"
    read -p "Verificar logs de quantas horas atrás? [Padrão: $DEFAULT_HORAS]: " HORAS

    if [ -z "$HORAS" ]; then
        HORAS=$DEFAULT_HORAS
    fi

    echo "Procurando por logs (nível warning+) e palavras-chave: $KEYWORDS"
    echo "------------------------------------------------------------------"

    RESULTADOS=$(journalctl -p 4 --since "${HORAS} hours ago" | grep -E -i "$KEYWORDS")

else
    echo "--- 'journalctl' não encontrado. Verificando /var/log/ (syslog) ---"
    LOG_FILES="/var/log/syslog /var/log/messages"
    echo "Procurando por: $KEYWORDS em $LOG_FILES"
    echo "(Analisando as últimas 1000 linhas de cada)"
    echo "------------------------------------------------------------------"
 
     RESULTADOS=$(tail -n 1000 $LOG_FILES 2>/dev/null | grep -h -E -i "$KEYWORDS")
fi


echo ""

if [ -n "$RESULTADOS" ]; then
    echo ">>> ERROS E AVISOS ENCONTRADOS <<<"
    echo ""
   echo "$RESULTADOS"
else
    echo ">>> Nenhuma mensagem de erro correspondente encontrada nos logs. <<<"
fi

echo ""
echo "========================================="
echo "Análise concluída."
echo "========================================="
