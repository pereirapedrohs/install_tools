#!/bin/bash

# Função para verificar se um comando existe
check_command() {
    command -v "$1" >/dev/null 2>&1
}

# Função para instalar o Git
install_git() {
    echo "Instalando Git..."
    sudo apt-get update
    sudo apt-get install -y git
    echo "Git instalado com sucesso!"
    git --version
}

# Função para instalar pré-requisitos
install_prerequisites() {
    missing_tools=()

    # Verifica se cada ferramenta está instalada
    for tool in curl wget unzip git; do
        if ! check_command "$tool"; then
            missing_tools+=("$tool")
        fi
    done

    # Se houver ferramentas faltando, pergunta ao usuário se deseja instalá-las
    if [ ${#missing_tools[@]} -gt 0 ]; then
        echo "As seguintes ferramentas não estão instaladas: ${missing_tools[*]}"
        read -p "Deseja instalá-las agora? [y/n]: " install_choice
        if [[ "$install_choice" == "y" || "$install_choice" == "Y" ]]; then
            for tool in "${missing_tools[@]}"; do
                if [ "$tool" == "git" ]; then
                    install_git
                else
                    sudo apt-get install -y "$tool"
                fi
            done
        else
            echo "Não foi possível prosseguir sem as ferramentas necessárias. Abortando."
            exit 1
        fi
    else
        echo "Todas as ferramentas necessárias já estão instaladas."
    fi
}

# Função para instalar Terraform
install_terraform() {
    echo "Buscando versões disponíveis do Terraform..."
    
    # Obtém a lista de versões disponíveis
    versions=$(curl -s https://api.releases.hashicorp.com/v1/releases/terraform | grep -oP '"version":"\K[0-9]+\.[0-9]+\.[0-9]+(?=")' | sort -V)
    
    # Encontra a última versão (mais recente)
    latest_version=$(echo "$versions" | tail -n 1)

    echo "Última versão disponível: $latest_version"

    # Exibe as versões disponíveis e pede para o usuário escolher uma
    echo "Escolha uma versão para instalar (padrão: $latest_version):"
    select version in $versions "Cancelar"; do
        if [ "$version" == "Cancelar" ]; then
            echo "Instalação cancelada."
            return
        elif [[ -n "$version" ]]; then
            echo "Você escolheu a versão: $version"
            break
        else
            echo "Opção inválida! Tente novamente."
        fi
    done

    # Se o usuário não escolher nada, usa a última versão como padrão
    version=${version:-$latest_version}

    echo "Instalando Terraform versão $version..."
    wget -O terraform.zip https://releases.hashicorp.com/terraform/$version/terraform_${version}_linux_amd64.zip
    unzip terraform.zip
    sudo mv terraform /usr/local/bin/
    rm terraform.zip
    
    # Verifica se o Terraform foi instalado corretamente
    echo "Terraform versão $version instalado com sucesso!"
    terraform -v
}

# Função para instalar o VSCode
install_vscode() {
    echo "Instalando Visual Studio Code..."

    # Adiciona a chave GPG da Microsoft e o repositório do VSCode
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    rm microsoft.gpg

    # Atualiza os pacotes e instala o VSCode
    sudo apt-get update
    sudo apt-get install -y code

    # Verifica se o VSCode foi instalado corretamente
    echo "Visual Studio Code instalado com sucesso!"
    code --version
}

# Função para mostrar o menu
show_menu() {
    echo "Selecione a ferramenta que deseja instalar:"
    echo "1) Terraform"
    echo "2) Visual Studio Code"
    echo "3) Sair"
}

# Verifica e instala pré-requisitos
install_prerequisites

# Loop do menu
while true; do
    show_menu
    read -p "Escolha uma opção: " choice
    case $choice in
        1)
            install_terraform
            ;;
        2)
            install_vscode
            ;;
        3)
            echo "Saindo..."
            break
            ;;
        *)
            echo "Opção inválida! Tente novamente."
            ;;
    esac
done
