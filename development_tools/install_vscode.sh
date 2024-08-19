#!/bin/bash

# Função para obter a versão instalada do VS Code
get_installed_version() {
    if command -v code &> /dev/null; then
        code_version=$(code --version | head -n 1)
        echo "$code_version"
    else
        echo "none"
    fi
}

# Função para obter a versão mais recente do VS Code
get_latest_version() {
    echo "Obtendo a versão mais recente do Visual Studio Code..."
    latest_version=$(wget -qO- https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 | grep -oP 'Visual Studio Code \K[\d.]+' | head -n 1)
    echo "$latest_version"
}

# Função para comparar versões (simples)
version_compare() {
    # Comparar versões, retornando 1 se a primeira versão for menor que a segunda, 0 caso contrário
    [ "$(printf '%s\n' "$1" "$2" | sort -V | head -n1)" = "$1" ] && [ "$1" != "$2" ]
}

# Função para instalar ou atualizar o Visual Studio Code
install_vscode() {
    echo "Iniciando a instalação/atualização do Visual Studio Code..."

    # Obtém as versões
    installed_version=$(get_installed_version)
    latest_version=$(get_latest_version)

    echo "Versão instalada do Visual Studio Code: $installed_version"
    echo "Última versão disponível: $latest_version"

    if [ "$installed_version" != "none" ]; then
        if version_compare "$installed_version" "$latest_version"; then
            echo "Uma nova versão do Visual Studio Code está disponível."
            read -p "Deseja atualizar? (s/n): " choice
            if [ "$choice" != "s" ]; then
                echo "Atualização cancelada."
                return
            fi
        else
            echo "Visual Studio Code já está atualizado para a versão mais recente."
            return
        fi
    fi

    echo "Instalando/Atualizando o Visual Studio Code..."
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt-get install apt-transport-https
    sudo apt-get update
    sudo apt-get install -y code

    echo "Visual Studio Code instalado/atualizado com sucesso!"
    code --version
    echo ""
}

# Verificar se o jq está instalado
if ! command -v jq &> /dev/null; then
    echo "O comando jq não está instalado. Instale-o com: sudo apt-get install -y jq"
    exit 1
fi