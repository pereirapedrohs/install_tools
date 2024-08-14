# Install Tools Script

Este script foi desenvolvido para facilitar a instalação de ferramentas essenciais no Ubuntu, como Git, Terraform, e Visual Studio Code. Ele verifica se as ferramentas necessárias estão instaladas e, caso não estejam, oferece a opção de instalá-las automaticamente.

## Funcionalidades

- Verifica a presença de `curl`, `wget`, `unzip`, e `git` no sistema.
- Instala as ferramentas ausentes, se autorizado pelo usuário.
- Lista as versões disponíveis do Terraform, permitindo ao usuário escolher qual versão instalar.
- Instala a última versão do Terraform por padrão, se nenhuma outra for selecionada.
- Instala o Visual Studio Code.
- Exibe a versão instalada do Terraform após a instalação.

## Como usar

### 1. Clone o repositório

Se você ainda não fez o clone do repositório, faça isso com o comando:

```bash
git clone git@github.com:pereirapedrohs/install_tools.git
cd install_tools
