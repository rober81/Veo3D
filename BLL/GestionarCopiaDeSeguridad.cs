using BE;
using System.Collections.Generic;

namespace BLL
{
    public class GestionarCopiaDeSeguridad
    {
        public static List<BE.CopiaDeSeguridad> Listar()
        {
            return DAL.CopiaSeguridadMapper.Listar();
        }

        public static int Backup(CopiaDeSeguridad param)
        {
            int resultado2 = DAL.CopiaSeguridadMapper.Backup(param);
            int resultado1 = 0;
            if (resultado2 == -1)
            {
                resultado1 = DAL.CopiaSeguridadMapper.Insertar(param);
                Bitacora("Backup", param);
            }
            return resultado1 + resultado2;
        }

        public static int Restaurar(CopiaDeSeguridad param)
        {
            int resultado1 = DAL.CopiaSeguridadMapper.Restaurar(param);
            Bitacora("Restaurar", param);
            return resultado1;
        }

        private static void Bitacora(string accion, CopiaDeSeguridad param)
        {
            Bitacora bitacora = new Bitacora();
            bitacora.Accion = accion;
            bitacora.Tabla = "Backup";
            bitacora.Dato = param.ToString();
            GestionarBitacora.Insertar(bitacora);
        }

    }
}
