# 🔧 ChatBot - Consulta de Pedidos de Peças de Engenharia

Este projeto é um chatbot desenvolvido em **C#** que permite a consulta de pedidos de peças de engenharia a partir de um banco de dados. Ele utiliza uma **API de IA** para interpretar e responder perguntas sobre pedidos de clientes.

---

##  **Como Funciona?**

Este chatbot utiliza uma técnica conhecida como **RAG (Retrieval-Augmented Generation)** para fornecer respostas mais precisas e atualizadas. Em vez de depender apenas do conhecimento aprendido durante o treinamento do modelo de IA, o sistema **recupera dados do banco de dados SQL** antes de gerar uma resposta.

**Recuperação de Dados (RAG):**  
   Antes de enviar a pergunta para a **API de IA**, o sistema consulta o banco de dados SQL para **obter informações relevantes** sobre pedidos, peças e clientes.

**Geração de Resposta:**  
   O modelo de IA recebe os dados recuperados do banco e os utiliza para gerar uma **resposta contextualizada** sobre os pedidos de peças de engenharia. Isso permite que o chatbot forneça **respostas mais precisas**, como, por exemplo, quantos pedidos um cliente fez, ou o status de um pedido específico.

**Sem Aprendizado Contínuo:**  
   O modelo de IA **não aprende com as interações**. Ele é pré-treinado e não muda com base nas perguntas e respostas anteriores. No entanto, o sistema é configurado para **consultar dados atualizados** sempre que uma nova pergunta é feita.

## **Funcionalidades Principais**

- **Consulta de pedidos de peças** com base em dados específicos (cliente, número do pedido, etc.).
- **Integração com banco de dados SQL Server** para recuperar informações atualizadas.
- **Uso de IA para interpretação e geração de respostas** baseadas nos dados recuperados.
- Respostas **contextualizadas** com base nas informações do banco de dados e do modelo de IA.


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
