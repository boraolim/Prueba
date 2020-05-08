namespace DbMigrator
{
  public class ConnectionStrings
  {
    /// <summary>
    /// Cadena de conexión a la Base de Datos principal de sistema de MySQL Server/Maria DB.
    /// </summary>
    /// <value>La cadena de conexión de la Base de Datos principal de MySQL Server/Maria DB.</value>
    public string MasterConnectionBD { get; set; }

    /// <summary>
    /// Cadena de conexión a la Base de Datos del usuario de MySQL Server/Maria DB.
    /// </summary>
    /// <value>La cadena de conexión de la Base de Datos del usuario de MySQL Server/Maria DB.</value>
    public string DefaultConnectionBD { get; set; }
  }
}