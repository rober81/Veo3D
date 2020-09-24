using BE;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class PerfilMapper
    {
        public static string Tabla = "Perfil";
        public static string Tabla2 = "UsuarioPerfil";

        public static List<Perfiles> ListarPerfiles()
        {
            List<Perfiles> lista = new List<Perfiles>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                Perfiles obj = new Perfiles();
                obj.Id = int.Parse(item["id"].ToString());
                obj.Nombre = item["nombre"].ToString();
                obj.Padre = Buscar(int.Parse(item["padre"].ToString()));
                lista.Add(obj);
            }
            return lista;
        }

        public static Perfiles Buscar(int id)
        {
            Perfiles obj = null;
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", id);
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_buscar", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Perfiles();
                obj.Id = int.Parse(item["id"].ToString());
                obj.Nombre = item["nombre"].ToString();
            }
            return obj;
        }

        public static int Insertar(Perfiles perfil)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@nombre", perfil.Nombre);
            parametros[1] = new SqlParameter("@padre", perfil.Padre == null ? 0 : perfil.Padre.Id);
            int res = Acceso.getInstance().escribir(Tabla + "_alta", parametros);
            return res;
        }

        public static int Modificar(Perfiles perfil)
        {
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = new SqlParameter("@nombre", perfil.Nombre);
            parametros[1] = new SqlParameter("@padre", perfil.Padre==null? 0: perfil.Padre.Id);
            parametros[2] = new SqlParameter("@id", perfil.Id);
            int res = Acceso.getInstance().escribir(Tabla + "_modificar", parametros);
            return res;
        }

        public static List<Perfiles> ListarUsuarioPerfil(Usuario param)
        {
            List<Perfiles> lista = new List<Perfiles>(); ;
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@usuario", param.Login);
            DataTable tabla = Acceso.getInstance().leer(Tabla2 + "_leer", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                Perfiles per = new Perfiles();
                per.Id = int.Parse(item["perfil"].ToString());
                per.Nombre = item["nombre"].ToString();
                per.Padre = Buscar(int.Parse(item["padre"].ToString()));
                lista.Add(per);
            }
            return lista;
        }

        public static int InsertarUsuarioPerfil(Usuario param, iPermisos perfil)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@usuario", param.Login);
            parametros[1] = new SqlParameter("@perfil", perfil.Id);
            int res = Acceso.getInstance().escribir(Tabla2 + "_alta", parametros);
            return res;
        }

        public static int BorrarUsuarioPerfil(Usuario param)
        {
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@usuario", param.Login);
            return Acceso.getInstance().escribir(Tabla2 + "_borrar", parametros);
        }
    }
}