import subprocess
from subprocess import DEVNULL


arquivoHosts = "HOSTS.txt"

print ("=" * 30)
print (" INICIANDO VERIFICAÇÃO DE REDE")
print ("=" * 30)


with open(arquivoHosts, "r" ) as arquivo:

	for linha in arquivo:
		host = linha.strip()
		if not host:
			continue

		resultado = subprocess.run(
			["ping", "-c", "1", host], 
			stdout=DEVNULL, 
			stderr=DEVNULL
		)

		if resultado.returncode == 0:
			print (f"Host {host} está ativo.")

		else:
			print(f"Host {host} está INATIVO ou com falha!")

print ("\n--- Verificação Concluida ---")
