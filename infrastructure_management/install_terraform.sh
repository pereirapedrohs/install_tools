#!/bin/bash

# Função para instalar Terraform
install_terraform() {
    # Verifica se o Terraform já está instalado
    if command -v terraform &> /dev/null; then
        echo "Terraform já está instalado."
        terraform -v
        return
    fi

    echo "Buscando versões disponíveis do Terraform..."

    # Obtém a lista de versões disponíveis
    versions=$(curl -s https://api.releases.hashicorp.com/v1/releases/terraform | grep -oP '"version":"\K[0-9]+\.[0-9]+\.[0-9]+(?=")' | sort -V)
    
    # Encontra a última versão (mais recente)
    latest_version=$(echo "$versions" | tail -n 1)

    echo "Última versão disponível: $latest_version"

    # Exibe as versões disponíveis e pede para o usuário escolher uma
    echo "Escolha uma versão para instalar (padrão: $latest_version):"
    select version in $versions "Cancelar"; do
        if [ "$version" == "Cancelar" ]; then
            echo "Instalação cancelada."
            return
        elif [[ -n "$version" ]]; then
            echo "Você escolheu a versão: $version"
            break
        else
            echo "Opção inválida! Tente novamente."
        fi
    done

    # Se o usuário não escolher nada, usa a última versão como padrão
    version=${version:-$latest_version}

    echo "Instalando Terraform versão $version..."
    wget -O terraform.zip https://releases.hashicorp.com/terraform/$version/terraform_${version}_linux_amd64.zip
    unzip terraform.zip
    sudo mv terraform /usr/local/bin/
    rm terraform.zip
    
    # Verifica se o Terraform foi instalado corretamente
    echo "Terraform versão $version instalado com sucesso!"
    terraform -v
    echo ""
}
