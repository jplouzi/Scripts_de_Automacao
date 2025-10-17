import paramiko

ipVM = "192.168.15.23"
portaVM = 22
usuarioVM = "joab"
senhaVM = "NathaliE_1610"

client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

client.connect(
	hostname = ipVM,
	port = portaVM,
	username = usuarioVM,
	password = senhaVM
)

print(" --- Conectado ao servidor! Executando comando... ---")
stdin, stdout, stderr = client.exec_command("hostname")
output = stdout.read().decode("utf-8")

print("A resposta do servidor foi:")
print(output)

client.close()
print("--- Conexão fechado. ---")


