namespace ChatSampleClientes.Infrastructure.Helpers;

public class EnvironmentHelper
{
    public static void Load(string filePath)
    {
        if (!File.Exists(filePath))
        {
            throw new FileNotFoundException($"O arquivo .env não foi encontrado no caminho especificado: {filePath}");
        }

        foreach (var line in File.ReadAllLines(filePath))
        {
            if (string.IsNullOrWhiteSpace(line) || line.StartsWith("#"))
                continue; 

            var parts = line.Split('=', 2);
            if (parts.Length != 2)
                continue; 

            var key = parts[0].Trim();
            var value = parts[1].Trim();

            // Remove aspas do valor, se estiverem presentes
            if (value.StartsWith("\"") && value.EndsWith("\""))
            {
                value = value.Substring(1, value.Length - 2);
            }

            Environment.SetEnvironmentVariable(key, value);
        }
    }
}
