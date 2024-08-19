#!/bin/bash

install_postman() {
    # Verifica se o Postman já está instalado
    if command -v postman &> /dev/null; then
        echo "Postman já está instalado."
        return
    fi

    echo "Postman não está instalado. Instalando agora..."
    
    # Define o URL para download e o nome do arquivo
    local url="https://dl.pstmn.io/download/latest/linux64"
    local tar_file="postman.tar.gz"
    local install_dir="/opt/Postman"
    local icon_file="$install_dir/app/icons/icon_128x128.png"
    
    # Baixa o arquivo .tar.gz do Postman
    wget -qO "$tar_file" "$url"

    # Cria o diretório de instalação
    sudo mkdir -p "$install_dir"
    
    # Extrai o arquivo .tar.gz para o diretório de instalação
    sudo tar -xzf "$tar_file" -C "$install_dir" --strip-components=1

    # Cria um link simbólico para o Postman
    if [ ! -L /usr/local/bin/postman ]; then
        sudo ln -s "$install_dir/Postman" /usr/local/bin/postman
    fi

    # Remove o arquivo .tar.gz após a instalação
    rm -f "$tar_file"

    # Verifica se o ícone existe e o copia para um diretório de ícones padrão, se necessário
    if [ -f "$icon_file" ]; then
        sudo cp "$icon_file" /usr/share/icons/postman.png
        icon_path="/usr/share/icons/postman.png"
    else
        echo "Ícone do Postman não encontrado. Usando ícone padrão."
        icon_path="/usr/share/icons/gnome/256x256/apps/postman.png"
    fi

    # Cria um arquivo .desktop para o menu de aplicações
    local desktop_file="/usr/share/applications/postman.desktop"
    sudo bash -c "cat > $desktop_file <<EOF
[Desktop Entry]
Name=Postman
Comment=Postman API Development Environment
Exec=/usr/local/bin/postman
Icon=$icon_path
Terminal=false
Type=Application
Categories=Development;
EOF"

    echo "Postman instalado e adicionado ao menu de aplicações com sucesso."
}
