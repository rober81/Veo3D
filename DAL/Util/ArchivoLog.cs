using System;
using System.IO;

namespace Util
{
    public class ArchivoLog
    {
        static string raizApp = AppDomain.CurrentDomain.BaseDirectory + @"\";
        static string logArchivo = raizApp + "log.txt";

        public static void Log(String mensaje)
        {
            File.AppendAllText(logArchivo, mensaje);
        }
    }
}
