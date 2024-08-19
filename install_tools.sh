#!/bin/bash

# Fonte das funções e scripts
source ./utils.sh
source ./infrastructure_management/install_terraform.sh
source ./infrastructure_management/install_tfenv.sh
source ./development_tools/install_vscode.sh
source ./development_tools/install_slack.sh
source ./development_tools/install_chrome.sh
source ./development_tools/install_oh_my_zsh.sh
source ./development_tools/install_postman.sh
source ./development_tools/install_zoom.sh
source ./cloud_services/install_aws_cli.sh
source ./programming_languages/install_kubectl.sh
source ./programming_languages/install_nodejs.sh
source ./programming_languages/install_nvm.sh
source ./programming_languages/install_python.sh

# Menu principal
while true; do
    echo ""
    echo "==== Menu de Instalação de Ferramentas ===="
    echo "1. Gerenciamento de Infraestrutura"
    echo "2. Ferramentas de Desenvolvimento"
    echo "3. Linguagens de Programação"
    echo "4. Sair"
    echo "==========================================="
    echo ""
    read -p "Escolha uma categoria: " category_choice
    
    case $category_choice in
        1)
            echo ""
            echo "==== Gerenciamento de Infraestrutura ===="
            echo "1. Instalar Terraform"
            echo "2. Instalar tfenv"
            echo "3. Instalar AWS CLI"
            echo "4. Voltar"
            echo "========================================="
            echo ""
            read -p "Escolha uma opção: " infra_choice
            
            case $infra_choice in
                1) install_terraform ;;
                2) install_tfenv ;;
                3) install_aws_cli ;;
                4) continue ;;
                *) echo "Opção inválida. Tente novamente." ;;
            esac
            ;;
        2)
            echo ""
            echo "==== Ferramentas de Desenvolvimento ===="
            echo "1. Instalar Visual Studio Code"
            echo "2. Instalar Slack"
            echo "3. Instalar Chrome"
            echo "4. Instalar Oh My Zsh"
            echo "5. Instalar Postman"
            echo "6. Instalar Zoom"
            echo "7. Voltar"
            echo "========================================="
            echo ""
            read -p "Escolha uma opção: " dev_choice
            
            case $dev_choice in
                1) install_vscode ;;
                2) install_slack ;;
                3) install_chrome ;;
                4) install_oh_my_zsh ;;
                5) install_postman ;;
                6) install_zoom ;;
                7) continue ;;
                *) echo "Opção inválida. Tente novamente." ;;
            esac
            ;;
        3)
            echo ""
            echo "==== Linguagens de Programação ===="
            echo "1. Instalar Node.js"
            echo "2. Instalar nvm"
            echo "3. Instalar Python"
            echo "4. Instalar Kubernetes"
            echo "V. Voltar"
            echo "==================================="
            read -p "Escolha uma opção: " programming_choice

            case $programming_choice in
                1) install_nodejs ;;
                2) install_nvm ;;
                3) install_python ;;
                4) install_kubectl ;;
                5) continue ;;
                *) echo "Opção inválida! Tente novamente." ;;
            esac
            ;;

        3) echo "Saindo..."; exit ;;
        *) echo "Opção inválida. Tente novamente." ;;
    esac
done
