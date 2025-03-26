using Microsoft.Extensions.DependencyInjection;
using ChatSampleClientes.Infrastructure.Helpers;
using ChatSampleClientes.Infrastructure.Providers;
using ChatSampleClientes.Services;

namespace ChatSampleClientes;

public class Program
{
    public static async Task Main(string[] args)
    {
        var serviceProvider = ConfigureServices();
        using var scope = serviceProvider.CreateScope();
        var scopedServices = scope.ServiceProvider;

        try
        {
            EnvironmentHelper.Load(".env");
            var app = serviceProvider.GetRequiredService<Application>();
            await app.RunAsync();
        }
        catch (Exception exc)
        {
            Console.WriteLine("Erro: " + exc.Message);
        }
    }

    private static ServiceProvider ConfigureServices() 
        => new ServiceCollection()
            .AddSingleton<ICustomerProvider, CustomerProvider>()
            .AddSingleton<IChatBotService, ChatBotService>()
            .AddSingleton<Application>()
            .BuildServiceProvider();
}