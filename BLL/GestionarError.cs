using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace BLL
{
    public class GestionarError
    {
        public static void loguear(String mensaje)
        {
            BE.Usuario usuario = GestionarSesion.getInstance().Usuario;
            string log;
            if (usuario != null)
                log = "Usuario: " + usuario + mensaje;
            else
                log = mensaje;
            Util.Log.Error(log);
        }
    }
}