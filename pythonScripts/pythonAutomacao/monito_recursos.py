import psutil
import logging
import time


LIMITE_CPU = 80.0  # Uso de CPU
LIMITE_MEMORIA = 80.0  # Uso de memoria
LIMITE_DISCO = 90.0  # Uso de disco


logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s', datefmt='%Y-%m-%d %H:%M:%S')

def checar_recursos():

    logging.info("Iniciando monitoramento de recursos...")
    print("-" * 40)

    alerta_disparado = False

    cpu_uso = psutil.cpu_percent(interval=1)
    print(f"🌡️ Uso de CPU: {cpu_uso}%")
    if cpu_uso > LIMITE_CPU:
        logging.warning(f"⚠️ Alerta: Uso de CPU ({cpu_uso}%) excedeu o limite de {LIMITE_CPU}%!")       
        alerta_disparado = True

    memoria = psutil.virtual_memory()
    memoria_uso = memoria.percent
    print(f"🧠 Uso de Memória: {memoria_uso}%")
    if memoria_uso > LIMITE_MEMORIA:
        logging.warning(f"⚠️ Alerta: Uso de Memória ({memoria_uso}%) excedeu o limite de {LIMITE_MEMORIA}%!")
        alerta_disparado = True

    try:
        disco = psutil.disk_usage('/')
        disco_uso = disco.percent
        print(f"💾 Uso de Disco: {disco_uso}%")
        if disco_uso > LIMITE_DISCO:
            logging.warning(f"⚠️ Alerta: Uso de Disco ({disco_uso}%) excedeu o limite de {LIMITE_DISCO}%!")
            alerta_disparado = True
    except FileNotFoundError:
        logging.error("Erro: Partição de disco '/' não encontrada.")
    print("-" * 40)
    if not alerta_disparado:
        logging.info("✅ Todos os recursos estão dentro dos limites aceitáveis.")
    else:
        logging.info("🔔 Monitoramento concluído com alertas disparados.")

if __name__ == "__main__":
    checar_recursos()