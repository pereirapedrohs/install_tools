#!/bin/bash

install_chrome() {
    # Verifica se o Google Chrome já está instalado
    if command -v google-chrome &> /dev/null; then
        echo "Google Chrome já está instalado."
        return
    fi

    # Baixa e instala o Google Chrome
    echo "Google Chrome não está instalado. Instalando agora..."
    chrome_deb="google-chrome-stable_current_amd64.deb"
    url="https://dl.google.com/linux/direct/$chrome_deb"

    # Tenta baixar o pacote do Chrome
    if wget -O $chrome_deb $url; then
        sudo dpkg -i $chrome_deb
        sudo apt-get install -f -y  # Corrige dependências, se necessário
        rm $chrome_deb
        echo "Google Chrome instalado com sucesso."
    else
        echo "Erro ao baixar o Google Chrome. Verifique sua conexão ou o link de download."
    fi
}
