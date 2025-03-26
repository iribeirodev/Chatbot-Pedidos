
namespace ChatSampleClientes.Services
{
    public interface IChatBotService
    {
        Task<string> GetResponseAsync(string userMessage);
    }
}