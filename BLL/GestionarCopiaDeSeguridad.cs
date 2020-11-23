using BE;
using System.Collections.Generic;
using System.IO;

namespace BLL
{
    public class GestionarCopiaDeSeguridad
    {
        private static string carpetaBackup = @"c:\Veo3DBack";
        public static List<BE.CopiaDeSeguridad> Listar()
        {
            return DAL.CopiaSeguridadMapper.Listar();
        }
        public static List<BE.CopiaDeSeguridad> ListarArchivos()
        {
            string[] filePaths = Directory.GetFiles(carpetaBackup, "*.BAK",SearchOption.AllDirectories);
            List<BE.CopiaDeSeguridad> registros = new List<BE.CopiaDeSeguridad>();
            foreach (var item in filePaths)
            {
                CopiaDeSeguridad arch = new CopiaDeSeguridad(item);
                arch.Nombre = item;
                arch.Fecha = File.GetCreationTime(item);
                registros.Add(arch);
            }
            return registros;
        }


        public static int Backup(CopiaDeSeguridad param)
        {
            if (!System.IO.Directory.Exists(carpetaBackup))
            {
                System.IO.Directory.CreateDirectory(carpetaBackup);
            }
            param.Nombre = carpetaBackup + "\\" + param.Nombre;
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
