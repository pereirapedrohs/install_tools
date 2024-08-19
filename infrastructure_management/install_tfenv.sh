#!/bin/bash

# Função para instalar tfenv
install_tfenv() {
    # Verifica se o tfenv já está instalado
    if command -v tfenv &> /dev/null; then
        echo "tfenv já está instalado."
        tfenv -v
        return
    fi

    if [ ! -d "$HOME/.tfenv" ]; then
        echo "Instalando tfenv..."
        git clone https://github.com/tfutils/tfenv.git ~/.tfenv
        if [ $? -ne 0 ]; then
            echo "Erro ao clonar o repositório do tfenv."
            exit 1
        fi
    fi

    # Cria links simbólicos, se não existirem
    if [ ! -L /usr/local/bin/tfenv ]; then
        sudo ln -s ~/.tfenv/bin/tfenv /usr/local/bin/tfenv
    else
        echo "Link simbólico para tfenv já existe."
    fi

    echo "tfenv instalado com sucesso!"
    tfenv -v
    echo ""
}
