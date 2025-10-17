import socket
import logging


SERVICOS_PARA_VERIFICAR = [
    ("Google DNS", "8.8.8.8", 53),
    ("Google Web (HTTPS)", "google.com", 443),
    ("Servidor Local SSH", "127.0.0.1", 22),
    ("Porta Inexistente", "google.com", 81), # Porta que estará fechada
]

TIMEOUT = 2

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def verificar_porta(host, porta):
    """
    Tenta se conctar a um host em uma porta específica.
    Retorna True se a conexão for bem-sucedida, caso contrário, False.
    """
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(TIMEOUT)
            resultado = s.connect_ex((host, porta))

            if resultado == 0:
                return True
            else:
                return False
    except socket.gaierror:
        return False
    except socket.error:
        return False

if __name__ == "__main__":
    logging.info("Iniciando verificação de portas...")
    print("-" * 40)

    sucesso_total = True

    for apelido, host, porta in SERVICOS_PARA_VERIFICAR:
        check_str = f"Verificando {apelido} ({host}:{porta})..."
        print(f"{check_str:<30}", end=' ')

        if verificar_porta(host, porta):
            print("✅ Aberta")
        else:
            print("❌ Fechada")
            sucesso_total = False
        print("-" * 40)
        if sucesso_total:
            logging.info("Verificação concluída: Todas as portas essenciais estão online.")
        else:
            logging.warning("Verificação concluída. UM OU MAIS SERVIÇOS ESTÃO OFFLINE!")

