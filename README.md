# 🔧 ChatBot - Consulta de Pedidos de Peças de Engenharia

Este projeto é um chatbot desenvolvido em **C#** que permite a consulta de pedidos de peças de engenharia a partir de um banco de dados. Ele utiliza uma **API de IA** para interpretar e responder perguntas sobre pedidos de clientes.

---

## 📂 Estrutura do Projeto

![image](https://github.com/user-attachments/assets/104966d8-0556-416d-ae83-ae2bb8b52b14)


---

## 🚀 Tecnologias Utilizadas

- **.NET** (C#)
- **HttpClient** para comunicação com a API de IA
- **SQL Server** para armazenar pedidos de clientes
- **System.Text.Json** para manipulação de JSON
- **Injeção de Dependência (`IHttpClientFactory`)**

---

## Configuração e Execução

### Configurar Variáveis de Ambiente  
Crie um arquivo `.env` (ou defina no sistema) com as seguintes variáveis:

```sh
API_KEY=your_api_key_here
API_URL=https://api.mistral.ai/v1/chat/completions
CONNECTION_STRING="Server=seu-servidor;Database=seu-db;User Id=seu-usuario;Password=sua-senha;"
```
## Instalar Dependências

No terminal, dentro do diretório do projeto, execute:

```sh
$ dotnet restore
$ dotnet run
```

## Melhorias Futuras
- Implementação de cache para otimizar consultas.
- Adicionar logs detalhados para monitoramento.
- Criar uma interface web ou bot de chat para facilitar o uso.

## Autor
- Itamar Ribeiro

📧 Contato: ribeirojr.itamar@gmail.com


Se quiser incluir mais detalhes ou personalizar, me avise!
