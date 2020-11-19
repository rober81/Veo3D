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

        public List<iPermiso> ListarUsuarioPermiso(Usuario param)
        {
            List<iPermiso> lista = new List<iPermiso>(); ;
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@usuario", param.Login);
            DataTable tabla = Acceso.getInstance().leer(Tabla2 + "_leer", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                Permiso per = new Permiso();
                per.Id = int.Parse(item["id"].ToString());
                per.Nombre = item["nombre"].ToString();
                per.Hijos = BuscarHijos(per.Id);
                lista.Add(per);
            }
            return lista;
        }
        public List<iPermiso> BuscarHijos(int id)
        {
            List<iPermiso> lista = new List<iPermiso>();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@padre", id);
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_buscar", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                Permiso per = new Permiso();
                per.Id = int.Parse(item["id"].ToString());
                per.Nombre = item["nombre"].ToString();
                per.Hijos = BuscarHijos(per.Id);
                lista.Add(per);
            }
            return lista;
        }

        public List<Permiso> ListarPermiso()
        {
            List<Permiso> lista = new List<Permiso>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                Permiso per = new Permiso();
                per.Id = int.Parse(item["id"].ToString());
                per.Nombre = item["nombre"].ToString();
                per.Hijos = BuscarHijos(per.Id);
                lista.Add(per);
            }
            return lista;
        }

        public Permiso Buscar(int id)
        {
            Permiso obj = null;
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", id);
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_buscar", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Permiso();
                obj.Id = int.Parse(item["id"].ToString());
                obj.Nombre = item["nombre"].ToString();
            }
            return obj;
        }

        public int Guardar(Permiso per, int padre)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@nombre", per.Nombre);
            parametros[1] = new SqlParameter("@padre", padre);
            int res = Acceso.getInstance().escribir(Tabla + "_alta", parametros);
            return res;
        }

        public int Modificar(Permiso per, int padre)
        {
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = new SqlParameter("@nombre", per.Nombre);
            parametros[1] = new SqlParameter("@padre", padre);
            parametros[2] = new SqlParameter("@id", per.Id);
            int res = Acceso.getInstance().escribir(Tabla + "_modificar", parametros);
            return res;
        }



        public int GuardarUsuarioPermiso(Usuario param, iPermiso per)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@usuario", param.Login);
            parametros[1] = new SqlParameter("@permiso", per.Id);
            int res = Acceso.getInstance().escribir(Tabla2 + "_alta", parametros);
            return res;
        }

        public int BorrarUsuarioPermiso(Usuario param)
        {
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@usuario", param.Login);
            return Acceso.getInstance().escribir(Tabla2 + "_borrar", parametros);
        }
    }
}