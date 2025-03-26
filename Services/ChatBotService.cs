using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using ChatSampleClientes.Models;

namespace ChatSampleClientes.Services;

public class ChatBotService : IChatBotService
{
    private readonly HttpClient _httpClient;

    public ChatBotService()
    {
        _httpClient = new HttpClient();
    }

    public async Task<string> GetResponseAsync(string userMessage)
    {
        var messages = new List<ChatMessage>
        {
            new ChatMessage { 
                Role = "system", 
                Content = "Você é um assistente especializado em pedidos" 
            },
            new ChatMessage{ 
                Role = "user", 
                Content = "Responda de forma breve: " + userMessage 
            }
        };

        var request = new ChatRequest { Messages = messages, Temperature = 0.2F,  };

        var jsonContent = new StringContent(JsonSerializer.Serialize(request, new JsonSerializerOptions
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
            DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull
        }), Encoding.UTF8, "application/json");

        _httpClient.DefaultRequestHeaders.Remove("Authorization");
        _httpClient.DefaultRequestHeaders.Add("Authorization", $"Bearer {Environment.GetEnvironmentVariable("API_KEY")}");

        var response = await _httpClient.PostAsync(Environment.GetEnvironmentVariable("API_URL"), jsonContent);

        if (!response.IsSuccessStatusCode)
        {
            string error = await response.Content.ReadAsStringAsync();
            Console.WriteLine($"Erro {response.StatusCode}: {error}");
            return "Erro na resposta do chatbot.";
        }

        var responseContent = await response.Content.ReadAsStringAsync();
        var responseData = JsonSerializer.Deserialize<JsonElement>(responseContent);

        var botResponse = responseData
            .GetProperty("choices")[0]
            .GetProperty("message")
            .GetProperty("content")
            .GetString() ?? "Sem resposta.";

        return botResponse;
    }
}