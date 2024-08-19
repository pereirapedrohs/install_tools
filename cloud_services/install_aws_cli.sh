#!/bin/bash

# Função para verificar se o AWS CLI já está instalado
check_aws_cli() {
    if command -v aws &> /dev/null; then
        echo "AWS CLI já está instalado."
        aws --version
        exit 0
    fi
}

# Função para instalar AWS CLI
install_aws_cli() {
    echo "Baixando a AWS CLI versão 2..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    
    echo "Extraindo arquivos..."
    unzip awscliv2.zip
    
    echo "Instalando AWS CLI..."
    sudo ./aws/install

    # Limpar arquivos de instalação
    rm awscliv2.zip
    rm -rf aws

    # Verificar instalação
    if command -v aws &> /dev/null; then
        echo "AWS CLI instalado com sucesso!"
        aws --version
    else
        echo "Erro: AWS CLI não foi instalado corretamente."
        exit 1
    fi
}