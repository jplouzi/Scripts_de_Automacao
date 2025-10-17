import os
import shutil
from pathlib import Path
import logging


PASTA_ALVO = Path.home() / "Downloads"

CATEGORIAS = {

    "Imagens": [".jpg", ".jpeg", ".png", ".gif", ".bmp"],
    "Documentos": [".pdf", ".docx", ".doc", ".txt", ".xlsx", ".pptx", ".odt"],
    "Vídeos": [".mp4", ".mov", ".avi", ".mkv"],
    "Música": [".mp3", ".wav", ".aac"],
    "Compactados": [".zip", ".rar", ".gz", ".tar"],
    "Executáveis": [".exe", ".msi", ".deb", ".run"]

}

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s', datefmt='%Y-%m-%d %H:%M:%S')

def organizar_pasta(pasta_alvo):
	logging.info(f"Iniciando Organização da pasta: {pasta_alvo}")

	pasta_alvo.mkdir(exist_ok=True)

	mapa_extensoes = {}
	for categoria, extensoes in CATEGORIAS.items():
		for ext in extensoes:
			mapa_extensoes[ext] = categoria

	pasta_outros = pasta_alvo / "Outros"
	pasta_outros.mkdir(exist_ok=True)

	for item in pasta_alvo.iterdir():

		if item.is_dir() or item.name == "organizador.py":
			continue

		sufixo = item.suffix.lower()
		categoria_nome = mapa_extensoes.get(sufixo, "Outros")
		pasta_destino = pasta_alvo / categoria_nome
		pasta_destino.mkdir(exist_ok=True)

		try:
			shutil.move(str(item), str(pasta_destino))
			logging.info(f"Movido: {item.name} -> {categoria_nome}/")
		except Exception as e:
			logging.error(f"Erro ao mover {item.name}: {e}")

	logging.info("Organização concluída.")

if __name__ == "__main__":

	print(f"ATENÇÃO: Este script irá organizar os arquivos em: {PASTA_ALVO}")
	confirmar = input("Você deseja continuar? (s/n): ").lower()

	if confirmar == 's':
		organizar_pasta(PASTA_ALVO)
	else:
		print("Operação Cancelada.")





