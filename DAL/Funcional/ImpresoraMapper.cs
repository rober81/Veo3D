using BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ImpresoraMapper
    {
        public static string Tabla = "Impresora";

        public static List<Impresora> Listar()
        {
            Impresora obj = null;
            List<Impresora> lista = new List<Impresora>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Impresora();
                obj.Id = int.Parse(item["id"].ToString());
                obj.Nombre = item["nombre"].ToString();
                obj.Marca = item["marca"].ToString();
                obj.Modelo = item["modelo"].ToString();
                lista.Add(obj);
            }
            return lista;
        }

        public static Impresora Buscar(Impresora param)
        {
            Impresora buscado = null;
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", param.Id);
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_buscar", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                buscado = new Impresora();
                buscado.Id = int.Parse(item["id"].ToString());
                buscado.Nombre = item["nombre"].ToString();
                buscado.Marca = item["marca"].ToString();
                buscado.Modelo = item["modelo"].ToString();
            }
            return buscado;
        }

        private static SqlParameter[] crearParametros(Impresora param)
        {
            SqlParameter[] parametros = new SqlParameter[5];
            parametros[0] = new SqlParameter("@id", param.Id);
            parametros[1] = new SqlParameter("@nombre", param.Nombre);
            parametros[2] = new SqlParameter("@marca", param.Marca);
            parametros[3] = new SqlParameter("@modelo", param.Modelo);
            parametros[4] = new SqlParameter("@estado", 0);
            return parametros;
        }

        public static int Insertar(Impresora param)
        {
            return Acceso.getInstance().escribir(Tabla + "_alta", crearParametros(param));
        }

        public static int Modificar(Impresora param)
        {
            return Acceso.getInstance().escribir(Tabla + "_modificar", crearParametros(param));
        }

        public static int Baja(Impresora param)
        {
            SqlParameter[] parametros = crearParametros(param);
            parametros[4] = new SqlParameter("@estado", 1);
            return Acceso.getInstance().escribir(Tabla + "_modificar", parametros);
        }
    }
}
