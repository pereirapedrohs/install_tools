#!/bin/bash

install_nodejs() {
    # Verifica se o npm já está instalado
    if command -v npm &> /dev/null; then
        echo "npm já está instalado."
        return
    fi

    echo "npm não está instalado. Instalando agora..."

    # Instala o Node.js e npm
    sudo apt-get update
    sudo apt-get install -y nodejs npm

    echo "npm instalado com sucesso!"
    npm -v
}
