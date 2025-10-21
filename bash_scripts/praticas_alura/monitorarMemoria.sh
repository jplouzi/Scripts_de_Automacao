#! /bin/bash

#Lista os 15 primeiros processos e o uso de memoria

echo "======================================================="
echo " Top 15 Processos por Consumo de Memoria em: $(date)"
echo "======================================================="
echo ""


ps aux --sort=-%mem | head -n 16


echo ""
echo "--- Verificação Concluida ---"
