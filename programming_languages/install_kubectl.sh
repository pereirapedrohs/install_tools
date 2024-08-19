#!/bin/bash

install_kubectl() {
    # Define a versão do kubectl para instalar
    local version="v1.27.3"
    local url="https://dl.k8s.io/release/${version}/bin/linux/amd64/kubectl"
    local install_dir="/usr/local/bin"

    # Verifica se o kubectl já está instalado
    if command -v kubectl &> /dev/null; then
        echo "kubectl já está instalado."
        # Verifica a versão atual do kubectl
        current_version=$(kubectl version --client --short | awk -Fv '{print $2}')
        echo "Versão atual do kubectl: $current_version"
        
        # Obtém a última versão do kubectl
        latest_version=$(curl -s https://dl.k8s.io/release/stable.txt)
        echo "Última versão disponível do kubectl: $latest_version"

        # Compara a versão atual com a última versão
        if [ "$current_version" = "$latest_version" ]; then
            echo "Você já está usando a versão mais recente do kubectl."
            return
        else
            echo "Uma nova versão do kubectl está disponível. Atualizando..."
            version="$latest_version"
            url="https://dl.k8s.io/release/${version}/bin/linux/amd64/kubectl"
        fi
    fi

    echo "Instalando kubectl versão $version..."

    # Baixa a versão específica do kubectl
    curl -LO "$url"

    # Torna o arquivo executável
    chmod +x ./kubectl

    # Move para o diretório de binários
    sudo mv ./kubectl "$install_dir/"

    # Verifica se o kubectl foi instalado corretamente
    if command -v kubectl &> /dev/null; then
        echo "kubectl instalado com sucesso!"
        kubectl version --client
    else
        echo "Falha na instalação do kubectl."
    fi
}
