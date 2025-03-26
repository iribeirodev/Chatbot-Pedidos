
namespace ChatSampleClientes.Infrastructure.Providers
{
    public interface ICustomerProvider
    {
        Task<string> GetPedidosByCliente();
    }
}