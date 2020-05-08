namespace DbMigrator
{
  using System.IO;

  using Microsoft.Extensions.Configuration;
  using Microsoft.Extensions.DependencyInjection;

  public class Program
  {
    static void Main(string[] args)
    {
      var services = ConfigureServices();
      var serviceProvider = services.BuildServiceProvider();
      serviceProvider.GetService<App>().Run();
    }

    private static IServiceCollection ConfigureServices()
    {
      var config = LoadConfiguration();

      IServiceCollection services = new ServiceCollection();
      services.AddTransient<App>();
      services.Configure<ConnectionStrings>(config.GetSection("ConnectionStrings"));

      return services;
    }

    private static IConfiguration LoadConfiguration()
    {
      var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory())
                                              .AddJsonFile("AppSettings.json", optional: true, reloadOnChange: true);

      return builder.Build();
    }
  }

}
