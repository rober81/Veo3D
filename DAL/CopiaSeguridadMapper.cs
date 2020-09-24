using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Util;

namespace DAL
{
    public class CopiaSeguridadMapper
    {
        public static string db = Configuracion.getInstance().aplicacionDB;
        public static string Tabla = "CopiaDeSeguridad";

        public static List<BE.CopiaDeSeguridad> Listar()
        {
            List<BE.CopiaDeSeguridad> lista = new List<BE.CopiaDeSeguridad>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_Leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                BE.CopiaDeSeguridad obj = new BE.CopiaDeSeguridad();
                obj.Nombre = item["nombre"].ToString();
                obj.Fecha = DateTime.Parse(item["fecha"].ToString());
                lista.Add(obj);
            }
            return lista;
        }

        public static int Insertar(BE.CopiaDeSeguridad copia)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@nombre", copia.Nombre);
            parametros[1] = new SqlParameter("@fecha", copia.Fecha);
            return Acceso.getInstance().escribir(Tabla + "_Alta", parametros);
        }

        public static int Backup(BE.CopiaDeSeguridad copia)
        {
            int r = 0;
            try
            {
                string back = String.Format("USE [master]; BACKUP DATABASE [{0}] TO DISK='{1}'", db, copia.Nombre);
                Acceso.getInstance().abrir();
                r = Acceso.getInstance().ejecutarSQL(back, null);
                Acceso.getInstance().cerrar();
            }
            catch (Exception e)
            {
                Log.Error("Error al hacer Backup " + e.ToString());
                throw;
            }
            return r;
        }

        public static int Restaurar(BE.CopiaDeSeguridad copia)
        {
            int r1, r2, r3;
            try
            {
                Acceso.getInstance().abrir();
                string antes = String.Format("ALTER DATABASE [{0}] SET Single_User WITH Rollback Immediate;", db);
                r1 = Acceso.getInstance().ejecutarSQL(antes, null);
                string restore = String.Format("USE [master] RESTORE DATABASE [{0}] FROM DISK='{1}' WITH  FILE = 1,  NOUNLOAD,  REPLACE,  STATS = 10", db, copia.Nombre);
                r2 = Acceso.getInstance().ejecutarSQL(restore, null);
                string despues = String.Format("ALTER DATABASE [{0}] SET Multi_User;", db);
                r3 = Acceso.getInstance().ejecutarSQL(despues, null);
                Acceso.getInstance().cerrar();
            }
            catch (Exception e)
            {
                Log.Error("Error al Restaurar " + e.ToString());
                throw;
            }
                return r1 + r2 + r3;
        }
    }
}