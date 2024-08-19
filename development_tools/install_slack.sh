#!/bin/bash

install_slack() {
    # Verifica se o Slack já está instalado
    if command -v slack &> /dev/null; then
        echo "Slack já está instalado."
        return
    fi

    # Baixa e instala o Slack
    echo "Slack não está instalado. Instalando agora..."
    slack_deb="slack-desktop-4.29.149-amd64.deb"
    url="https://downloads.slack-edge.com/releases/linux/4.29.149/prod/x64/$slack_deb"

    # Tenta baixar o pacote do Slack
    if wget -O $slack_deb $url; then
        sudo dpkg -i $slack_deb
        sudo apt-get install -f -y  # Corrige dependências, se necessário
        rm $slack_deb
        echo "Slack instalado com sucesso."
    else
        echo "Erro ao baixar o Slack. Verifique sua conexão ou o link de download."
    fi
}