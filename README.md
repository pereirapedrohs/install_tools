# Install Tools Script

Este script foi desenvolvido para facilitar a instalação de ferramentas essenciais no Ubuntu, como Git, Terraform, e Visual Studio Code. Ele verifica se as ferramentas necessárias estão instaladas e, caso não estejam, oferece a opção de instalá-las automaticamente.

## Funcionalidades

- Verifica a presença de `curl`, `wget`, `unzip`, e `git` no sistema.
- Instala as ferramentas ausentes, se autorizado pelo usuário.
- Lista as versões disponíveis do Terraform, permitindo ao usuário escolher qual versão instalar.
- Instala a última versão do Terraform por padrão, se nenhuma outra for selecionada.
- Instala o Visual Studio Code.
- Exibe a versão instalada do Terraform após a instalação.

## Como Usar

### 1. Clone o Repositório

Se você ainda não fez o clone do repositório, faça isso com o comando:

```bash
git clone git@github.com:pereirapedrohs/install_tools.git
cd install_tools
```

### 2. Configurar Permissões

Antes de executar o script, certifique-se de que ele tem permissões de execução:

```bash
chmod +x install_tools.sh
```

### 3. Executar o Script

Para executar o script, use o seguinte comando:

```bash
./install_tools.sh
```

### 4. Escolha as Ferramentas para Instalar

Após iniciar o script, você verá um menu com as opções para instalar as ferramentas disponíveis:

1. **Terraform**: Escolha e instale uma versão específica ou a última versão.
2. **Visual Studio Code**: Instala o editor de código Visual Studio Code.

Você pode sair do script a qualquer momento selecionando a opção "Sair".

### 5. Verificar a Instalação

Após a instalação, o script exibirá a versão instalada das ferramentas, como o Terraform, para que você possa confirmar que tudo foi instalado corretamente.

## Requisitos

- Ubuntu 18.04 ou superior
- Conexão com a internet

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para enviar pull requests ou abrir issues no repositório.

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.
```