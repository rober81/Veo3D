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
    public class MaterialMapper
    {
        public static string Tabla = "Material";

        public static List<Material> Listar()
        {
            Material obj = null;
            List<Material> lista = new List<Material>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Material();
                obj.Id = int.Parse(item["id"].ToString());
                obj.Marca = item["marca"].ToString();
                obj.Color = item["color"].ToString();
                obj.Tipo = item["tipo"].ToString();
                obj.Peso = int.Parse(item["peso"].ToString());
                obj.Metros = int.Parse(item["metros"].ToString());
                obj.Stock = int.Parse(item["stock"].ToString());
                obj.CostoxMetro = decimal.Parse(item["costom"].ToString());
                lista.Add(obj);
            }
            return lista;
        }

        public static Material Buscar(Material param)
        {
            Material buscado = null;
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", param.Id);
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_buscar", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                buscado = new Material();
                buscado.Id = int.Parse(item["id"].ToString());
                buscado.Marca = item["marca"].ToString();
                buscado.Color = item["color"].ToString();
                buscado.Tipo = item["tipo"].ToString();
                buscado.Peso = int.Parse(item["peso"].ToString());
                buscado.Metros = int.Parse(item["metros"].ToString());
                buscado.Stock = int.Parse(item["stock"].ToString());
                buscado.CostoxMetro = decimal.Parse(item["costom"].ToString());
            }
            return buscado;
        }

        private static SqlParameter[] crearParametros(Material param)
        {
            SqlParameter[] parametros = new SqlParameter[8];
            parametros[0] = new SqlParameter("@id", param.Id);
            parametros[1] = new SqlParameter("@marca", param.Marca);
            parametros[2] = new SqlParameter("@color", param.Color);
            parametros[3] = new SqlParameter("@tipo", param.Tipo);
            parametros[4] = new SqlParameter("@peso", param.Peso);
            parametros[5] = new SqlParameter("@metros", param.Metros);
            parametros[6] = new SqlParameter("@stock", param.Stock);
            parametros[7] = new SqlParameter("@costom", param.CostoxMetro);
            return parametros;
        }

        public static int Insertar(Material param)
        {
            return Acceso.getInstance().escribir(Tabla + "_alta", crearParametros(param));
        }

        public static int Modificar(Material param)
        {
            return Acceso.getInstance().escribir(Tabla + "_modificar", crearParametros(param));
        }

        public static int Baja(Material param)
        {
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", param.Id);
            return Acceso.getInstance().escribir(Tabla + "_baja", parametros);
        }
    }
}
