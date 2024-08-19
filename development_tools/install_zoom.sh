#!/bin/bash

install_zoom() {
    # Define o URL para download e o nome do arquivo
    local url="https://zoom.us/client/latest/zoom_amd64.deb"
    local deb_file="zoom_amd64.deb"
    
    # Verifica se o Zoom já está instalado
    if command -v zoom &> /dev/null; then
        echo "Zoom já está instalado."
        return
    fi

    echo "Zoom não está instalado. Instalando agora..."

    # Baixa o arquivo .deb do Zoom
    wget -q "$url" -O "$deb_file"

    # Instala o pacote .deb do Zoom
    sudo dpkg -i "$deb_file"

    # Corrige dependências ausentes, se houver
    sudo apt-get install -f -y

    # Remove o arquivo .deb após a instalação
    rm -f "$deb_file"

    # Cria um arquivo .desktop para o menu de aplicações, se necessário
    local desktop_file="/usr/share/applications/zoom.desktop"
    if [ ! -f "$desktop_file" ]; then
        sudo bash -c "cat > $desktop_file <<EOF
[Desktop Entry]
Name=Zoom
Comment=Zoom Video Communications
Exec=/usr/bin/zoom
Icon=/usr/share/icons/hicolor/scalable/apps/zoom.svg
Terminal=false
Type=Application
Categories=Network;VideoConference;
EOF"
    fi

    echo "Zoom instalado e adicionado ao menu de aplicações com sucesso."
}