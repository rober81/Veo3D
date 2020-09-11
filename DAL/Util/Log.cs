using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Util
{
    public class Log
    {
        public static void Error(String mensaje)
        {
            string fecha = DateTime.Now.ToString("dd/MM/yyyy-HH:mm:ss");
            string log = fecha + ": " + mensaje + Environment.NewLine;
            IoHelper.Log(log);
        }

        public static void Debug(String mensaje)
        {
            string fecha = DateTime.Now.ToString("dd/MM/yyyy-HH:mm:ss");
            string log = fecha + ": " + mensaje + Environment.NewLine;
            IoHelper.Log(log);
        }
    }
}
