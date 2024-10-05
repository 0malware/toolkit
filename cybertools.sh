#!/bin/bash

# Ferramentas a serem instaladas
tools=(
    "nmap"
    "metasploit-framework"
    "john"
    "hydra"
    "aircrack-ng"
    "sqlmap"
    "nikto"
    "netcat"
    "recon-ng"
    "hashcat"
    "wpscan"
    "dirb"
    "fcrackzip"
    "enum4linux"
)

# 1. Atualizar pacotes
echo "Atualizando pacotes..."
sudo apt update

# 2. Instalar as ferramentas
echo "Instalando ferramentas..."
for tool in "${tools[@]}"
do
    sudo apt install -y "$tool"
done

# 3. Alterar o shell padrão para o usuário comum
echo "Alterando o shell padrão do usuário..."
USER_SHELL_CONFIG="$HOME/.bashrc"
if ! grep -q 'PS1_CMD1' "$USER_SHELL_CONFIG"; then
    echo "PROMPT_COMMAND='PS1='\\[\\e[38;5;83m\\]\\[\\e[38;5;87m\\]\\u\\[\\e[0m\\] \\[\\e[38;5;77m\\]\\W\\[\\e[0m\\] \\[\\e[38;5;27m\\]\[\\e[38;5;77m\\]\\$ \\[\\e[0m\\]'" >> "$USER_SHELL_CONFIG"
fi

# 4. Alterar o shell do usuário root
echo "Alterando o shell do root..."
ROOT_SHELL_CONFIG="/root/.bashrc"
if ! sudo grep -q 'root\\\[\\e[38;5;124m\\]' "$ROOT_SHELL_CONFIG"; then
    echo "PS1='\\[\\e[38;5;83m\\]\\[\\e[38;5;124m\\]root\\[\\e[0m\\] \\[\\e[38;5;248m\\]\\W\\[\\e[0m\\] \\[\\e[38;5;255m\\]#\\[\\e[0m\\]'" | sudo tee -a "$ROOT_SHELL_CONFIG"
fi

echo "Configurações concluídas! Reinicie o shell para aplicar as mudanças."
