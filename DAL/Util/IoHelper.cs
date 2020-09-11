using System;
using System.IO;
using Newtonsoft.Json;

namespace Util
{
    public class IoHelper
    {
        static string raizApp = AppDomain.CurrentDomain.BaseDirectory + @"\";
        static string logArchivo = raizApp + "log.txt";
        static string configuracionArchivo = raizApp + "configuracion.json";

        public static void Log(String mensaje)
        {
            File.AppendAllText(logArchivo, mensaje);
        }

        public static void CrearConfiguracion()
        {
            Configuracion config = new Configuracion();
            config.aplicacionDB = "KineApp";
            config.bitacoraDB = "KineAppBitacora";
            config.idioma = new BE.Idioma("Español");
            //config.servidor = "SQLEXPRESS";
            config.servidor = "SQL_UAI";
            File.WriteAllText(configuracionArchivo, SerializarJson.Serializar(config));
        }

        public static void ActualizarConfiguracion()
        {
            Configuracion config = Configuracion.getInstance();
            File.WriteAllText(configuracionArchivo, SerializarJson.Serializar(config));
        }

        public static Configuracion LeerConfiguracion()
        {
            Configuracion config = null;
            
            try
            {
                if (! File.Exists(configuracionArchivo))
                {
                    CrearConfiguracion(); //Configuracion por defecto
                }
                using (StreamReader file = File.OpenText(configuracionArchivo))
                {
                    config = SerializarJson.DesSerializar<Configuracion>(file);
                }
            }
            catch (Exception ex)
            {
                Log("Error al leer Configuracion.json" + Environment.NewLine + ex.ToString());
            }
            return config;
        }
    }
}
