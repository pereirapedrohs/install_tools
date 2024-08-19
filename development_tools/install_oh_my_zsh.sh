#!/bin/bash

install_oh_my_zsh() {
    # Verifica se o Zsh já está instalado
    if ! command -v zsh &> /dev/null; then
        echo "Zsh não está instalado. Instalando agora..."
        sudo apt-get update
        sudo apt-get install -y zsh
    else
        echo "Zsh já está instalado."
    fi

    # Verifica se o Oh My Zsh já está instalado
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh My Zsh já está instalado."
        return
    fi

    # Instala o Oh My Zsh
    echo "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Pergunta se deseja definir o Zsh como shell padrão
    read -p "Deseja definir o Zsh como o shell padrão? (y/n): " change_shell
    if [[ $change_shell == [Yy]* ]]; then
        chsh -s $(which zsh)
        echo "Zsh foi definido como o shell padrão."
    else
        echo "Zsh não foi definido como o shell padrão."
    fi

    echo "Oh My Zsh instalado com sucesso."
}
