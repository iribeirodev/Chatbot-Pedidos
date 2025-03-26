namespace ChatSampleClientes.Models;

public class ChatRequest
{
    public string Model { get; set; } = "mistral-tiny";
    public List<ChatMessage> Messages { get; set; } = [];
    public float Temperature { get; set; }
}