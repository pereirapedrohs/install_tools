#!/bin/bash

install_nvm() {
    # Verifica se o nvm já está instalado
    if [ -d "$HOME/.nvm" ]; then
        echo "nvm já está instalado."
        return
    fi

    echo "nvm não está instalado. Instalando agora..."

    # Baixa e instala o nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

    # Carrega o nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    echo "nvm instalado com sucesso!"
    nvm --version
}
