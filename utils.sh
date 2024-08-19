#!/bin/bash

# Função para verificar e instalar dependências
check_and_install() {
    local pkg="$1"
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
        read -p "$pkg não está instalado. Deseja instalá-lo agora? (s/n) " choice
        if [ "$choice" = "s" ]; then
            sudo apt-get update && sudo apt-get install -y "$pkg"
        else
            echo "Instalação de $pkg pulada."
        fi
    else
        echo "$pkg já está instalado."
    fi
}

# Verificando e instalando curl, wget, unzip e git se necessário
check_and_install "curl"
check_and_install "wget"
check_and_install "unzip"
check_and_install "git"
