#! /bin/bash


#Script que monitora o uso de Cpu dos 10 primeiros processos


TOP_N=10


clear
echo "====================================================="
echo " Top $TOP_N Processos por Consumo de CPU em: $(date)"
echo "====================================================="
echo ""

ps aux | head -n 1


ps aux | tail -n +2 | grep -v "grep" | sort -k3 -r -n | head -n $TOP_N

echo ""
echo "--- Verificação Concluida ---"
