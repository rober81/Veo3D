using BE;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class PermisoMapper
    {
        public static string Tabla = "Permiso";
        public static string Tabla2 = "UsuarioPermiso";

        public static List<Permisos> ListarPermisos()
        {
            List<Permisos> lista = new List<Permisos>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                Permisos obj = new Permisos();
                obj.Id = int.Parse(item["id"].ToString());
                obj.Nombre = item["nombre"].ToString();
                obj.Padre = Buscar(int.Parse(item["padre"].ToString()));
                lista.Add(obj);
            }
            return lista;
        }

        public static Permisos Buscar(int id)
        {
            Permisos obj = null;
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", id);
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_buscar", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Permisos();
                obj.Id = int.Parse(item["id"].ToString());
                obj.Nombre = item["nombre"].ToString();
            }
            return obj;
        }

        public static int Insertar(Permisos per)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@nombre", per.Nombre);
            parametros[1] = new SqlParameter("@padre", per.Padre == null ? 0 : per.Padre.Id);
            int res = Acceso.getInstance().escribir(Tabla + "_alta", parametros);
            return res;
        }

        public static int Modificar(Permisos per)
        {
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = new SqlParameter("@nombre", per.Nombre);
            parametros[1] = new SqlParameter("@padre", per.Padre==null? 0: per.Padre.Id);
            parametros[2] = new SqlParameter("@id", per.Id);
            int res = Acceso.getInstance().escribir(Tabla + "_modificar", parametros);
            return res;
        }

        public static List<Permisos> ListarUsuarioPermiso(Usuario param)
        {
            List<Permisos> lista = new List<Permisos>(); ;
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@usuario", param.Login);
            DataTable tabla = Acceso.getInstance().leer(Tabla2 + "_leer", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                Permisos per = new Permisos();
                per.Id = int.Parse(item["permiso"].ToString());
                per.Nombre = item["nombre"].ToString();
                per.Padre = Buscar(int.Parse(item["padre"].ToString()));
                lista.Add(per);
            }
            return lista;
        }

        public static int InsertarUsuarioPermiso(Usuario param, iPermisos per)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@usuario", param.Login);
            parametros[1] = new SqlParameter("@perfil", per.Id);
            int res = Acceso.getInstance().escribir(Tabla2 + "_alta", parametros);
            return res;
        }

        public static int BorrarUsuarioPermiso(Usuario param)
        {
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@usuario", param.Login);
            return Acceso.getInstance().escribir(Tabla2 + "_borrar", parametros);
        }
    }
}