using Npgsql;

static public class Program
{
    static public void CreateDatabase(this NpgsqlConnection connection)
    {
        connection.Open();
        var command = connection.CreateCommand();
        command.CommandText = "CREATE DATABASE test2";
        Console.WriteLine(command.ExecuteNonQuery());
    }
    static public void Main(string[] args)
    {
        NpgsqlConnectionStringBuilder connectionStringBuilder = new NpgsqlConnectionStringBuilder
        {
            Host = "127.0.0.1",
            Port = 5432,
            Username = "postgres",
            Password = "12345678",
            Database = "test",
        };
        using NpgsqlConnection connection = new NpgsqlConnection(connectionStringBuilder.ToString());
        
    }
}
