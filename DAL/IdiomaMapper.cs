using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class IdiomaMapper
    {
        public static string Tabla = "Idioma";
        public static string Tabla2 = "IdiomaDetalle";

        public static List<BE.Idioma> Listar()
        {
            List<BE.Idioma> lista = new List<BE.Idioma>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                lista.Add(new BE.Idioma(item["nombre"].ToString(), item["codigo"].ToString()));
            }
            return lista;
        }

        public static void CargarDetalle(BE.Idioma unIdioma)
        {
            Dictionary<string, string> lista = new Dictionary<string, string>();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@idioma", unIdioma.Nombre);
            DataTable tabla = Acceso.getInstance().leer(Tabla2 + "_leer", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                lista.Add(item["clave"].ToString(), item["texto"].ToString());
            }
            unIdioma.Detalle = lista;
        }

        public static int Insertar(BE.Idioma param)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@idioma", param.Nombre);
            parametros[1] = new SqlParameter("@codigo", param.Codigo);
            return Acceso.getInstance().escribir(Tabla + "_alta", parametros);
        }

        public static int InsertarDetalle(BE.IdiomaDetalle detalle)
        {
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = new SqlParameter("@idioma", detalle.Idioma);
            parametros[1] = new SqlParameter("@clave", detalle.Clave);
            parametros[2] = new SqlParameter("@texto", detalle.Texto);
            return Acceso.getInstance().escribir(Tabla2 + "_alta", parametros);
        }
    }
}