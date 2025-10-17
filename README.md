# 🤖 Scripts de Automação (Bash e Python)

Este repositório é uma coleção de scripts utilitários em Bash e Python para automatizar tarefas de rotina, administração de sistemas e monitoramento.

## 🐍 Scripts Python

Os scripts Python estão localizados na pasta `/pythonScripts` e são projetados para rodar em um ambiente virtual (`venv`).

### Scripts Disponíveis:

* **`organizador.py`**: Organiza automaticamente arquivos em um diretório (ex: `~/Downloads`) em subpastas com base em suas extensões (Imagens, Documentos, etc.).
* **`port_checker.py`**: Verifica o status (Aberto/Fechado) de uma lista de portas TCP em servidores especificados. Útil para monitorar se serviços (web, SSH, etc.) estão online.
* **`monitor_recursos.py`**: Monitora o uso de CPU, memória e disco do sistema. Dispara alertas no log se os recursos ultrapassarem limites pré-definidos.

### ⚙️ Instalação (Python)

1.  Clone o repositório:
    ```bash
    git clone [https://github.com/jplouzi/Scripts_de_Automacao.git](https://github.com/jplouzi/Scripts_de_Automacao.git)
    cd Scripts_de_Automacao/pythonScripts
    ```
2.  Crie e ative um ambiente virtual:
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```
3.  Instale as dependências (necessárias para `monitor_recursos.py`):
    ```bash
    pip install -r requirements.txt
    ```
4.  Execute o script desejado:
    ```bash
    python monitor_recursos.py
    ```

---

## 🐧 Scripts Bash

Os scripts Bash estão localizados na pasta `/bash_scripts`.

### Scripts Disponíveis:

* **`backup_diario.sh`**: Cria um arquivo de backup compactado (`.tar.gz`) de um diretório especificado, nomeando-o com a data e hora atual.
* **`verifica_rede.sh`**: Realiza um "ping sweep" em uma sub-rede (ex: `192.168.0.x`) para identificar quais hosts estão online ou offline.
* **`gerencia_proc.sh`**: Um script interativo que lista os 10 principais processos por uso de CPU ou Memória e oferece a opção de "matar" (kill) um processo pelo seu PID.

### ⚙️ Execução (Bash)

1.  Dê permissão de execução ao script:
    ```bash
    chmod +x seu_script.sh
    ```
2.  Execute-o:
    ```bash
    ./seu_script.sh
    ```
