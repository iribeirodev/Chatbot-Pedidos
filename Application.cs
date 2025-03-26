using ChatSampleClientes.Infrastructure.Providers;
using ChatSampleClientes.Services;

namespace ChatSampleClientes;

public class Application
{
    private readonly ICustomerProvider _customerProvider;
    private readonly IChatBotService _chatBotService;

    public Application(
        ICustomerProvider customerProvider,
        IChatBotService chatBotService)
    {
        _chatBotService = chatBotService;
        _customerProvider = customerProvider;
    }

    public async Task RunAsync()
    {
        while (true)
        {
            Console.Clear();

            //Console.Write("Digite o nome do cliente: ");
            //string clienteNome = Console.ReadLine();

            Console.Write("Digite sua pergunta: ");
            string pergunta = Console.ReadLine();
            if (string.IsNullOrEmpty(pergunta))
            {
                Console.WriteLine("Resposta: Faça uma pergunta ou CTRL+C para sair.");
                Console.ReadKey();
                continue;
            }

            // I - Consultar pedidos do cliente no banco de dados
            var pedidos = await _customerProvider.GetPedidosByCliente(); //(clienteNome);

            if (string.IsNullOrEmpty(pedidos))
            {
                Console.WriteLine($"Resposta: Cliente inexistente.");

                Console.WriteLine("Pressione algo para continuar...");
                Console.ReadKey();
                continue;
            }

            // II - Formatar o prompt que será enviado para a API do Mistral
            //string prompt = $"O cliente {clienteNome} fez os seguintes pedidos: {pedidos}. Pergunta: {pergunta} Responda com base nesses dados.";

            string prompt = $"Esses foram os pedidos realizados pelos clientes: {pedidos}. Pergunta: {pergunta} Responda com base nesses dados.";

            // III - Chamar a API do Mistral com o prompt que contém os dados do cliente e a pergunta
            string response = await _chatBotService.GetResponseAsync(prompt);

            Console.WriteLine("Resposta: " + response);

            Console.WriteLine("Pressione algo para continuar...");
            Console.ReadKey();
        }
    }
}
