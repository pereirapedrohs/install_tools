#!/bin/bash

install_python() {
    # Verifica se o Python já está instalado
    if command -v python3 &> /dev/null; then
        echo "Python já está instalado."
        return
    fi

    echo "Python não está instalado. Instalando agora..."

    # Instala o Python 3 e pip
    sudo apt-get update
    sudo apt-get install -y python3 python3-pip

    echo "Python e pip instalados com sucesso!"
    python3 --version
    pip3 --version
}
