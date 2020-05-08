namespace DbMigrator
{
  using System;
  using System.Reflection;

  using Microsoft.Extensions.Options;

  using DbUp;

  public class App
  {
    private readonly IOptions<ConnectionStrings> _settings = null;

    public App(IOptions<ConnectionStrings> mySettings)
    {
      // you can optionally do .Value but that makes it so updates in the JSON file won't reload in this instance
      _settings = mySettings;
    }

    protected ConnectionStrings Settings => _settings.Value;

    public void Run()
    {
      var connectionString = Settings.MasterConnectionBD;

      Console.WriteLine("Iniciando lectura de scripts de Bases de Datos...");
      var upgrader = DeployChanges.To.MySqlDatabase(connectionString)
                                     .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly())
                                     .WithTransactionPerScript()
                                     .LogToConsole()
                                     .Build();

      Console.WriteLine("Aplicando cambios en Base de Datos...");
      var result = upgrader.PerformUpgrade();

      // Display the result
      if (result.Successful)
      {
        Console.ForegroundColor = ConsoleColor.Green;
        Console.WriteLine("Ejecución satisfactoria de la migración a Base de Datos.");
        Console.ResetColor();
      }
      else
      {
        Console.ForegroundColor = ConsoleColor.Red;
        Console.WriteLine("La migración de Base de Datos falló. No se aplicaron cambios. Revise el siguiente mensaje de error.");
        Console.WriteLine(result.Error);

        Console.ResetColor();
      }
    }
  }
}