using Microsoft.Data.SqlClient;
using System.Text;

namespace ChatSampleClientes.Infrastructure.Providers;

public class CustomerProvider : ICustomerProvider
{
    private readonly string connectionString = "Server=localhost;Database=Samples;Trusted_Connection=True;TrustServerCertificate=True;";

    public async Task<string> GetPedidosByCliente()
    {
        using (var connection = new SqlConnection(connectionString))
        {
            await connection.OpenAsync();

            // Query atualizada para obter pedidos detalhados
            var query = @"
                SELECT 
                    c.Nome AS NomeCliente,
                    c.Email AS Email,
                    c.Telefone AS Telefone,
                    p.PedidoID, 
                    p.DataPedido, 
                    pr.SKU, 
                    pi.PedidoItemID,
                    pr.Nome AS NomeProduto, 
                    pi.Quantidade, 
                    pi.PrecoUnitario
                FROM Pedidos p
                JOIN Clientes c ON p.ClienteID = c.ClienteID
                JOIN PedidoItens pi ON p.PedidoID = pi.PedidoID
                JOIN Produtos pr ON pi.ProdutoID = pr.ProdutoID
                ORDER BY p.DataPedido DESC;";
                    //            WHERE c.Nome = @clienteNome

            using (var command = new SqlCommand(query, connection))
            {
                // Se quiser filtrar pelo nome do cliente, descomente a linha abaixo
                // command.Parameters.AddWithValue("@clienteNome", clienteNome);

                using (var reader = await command.ExecuteReaderAsync())
                {
                    var pedidos = new StringBuilder();

                    while (await reader.ReadAsync())
                    {
                        pedidos.AppendLine($"Cliente: {reader["NomeCliente"]}, " +
                            $"Email: {reader["Email"]}, " +
                            $"Telefone: {reader["Telefone"]}, " +
                            $"Pedido ID: {reader["PedidoID"]}, " +
                            $"Data do Pedido: {DateTime.Parse(reader["DataPedido"].ToString()):dd/MM/yyyy}, " +
                            $"SKU: {reader["SKU"]}, " +
                            $"Produto: {reader["NomeProduto"]}, " +
                            $"ID do Item do Pedido: {reader["PedidoItemID"]}, " +
                            $"Quantidade: {reader["Quantidade"]}, " +
                            $"Preço Unitário: {decimal.Parse(reader["PrecoUnitario"].ToString()):C2}"
                        );
                    }

                    // Retornar todos os pedidos detalhados como uma string
                    return pedidos.ToString();
                }
            }
        }
    }

}
