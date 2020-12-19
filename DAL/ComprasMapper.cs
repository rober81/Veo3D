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
    public class ComprasMapper
    {
        public static string Tabla = "OrdenCompra";
        public static string TablaDetalle = "DetalleCompras";

        public static List<OrdenCompra> ListarOrdenes()
        {
            OrdenCompra obj = null;
            List<OrdenCompra> lista = new List<OrdenCompra>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new OrdenCompra();
                obj.Id = int.Parse(item["id"].ToString());
                obj.Descripcion = item["descripcion"].ToString();
                obj.Fecha = DateTime.Parse(item["fecha"].ToString());
                lista.Add(obj);
            }
            return lista;
        }

        public static List<DetalleCompra> ListarDetalle()
        {
            DetalleCompra obj = null;
            List<DetalleCompra> lista = new List<DetalleCompra>();
            DataTable tabla = Acceso.getInstance().leer("Detale_Compras_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new DetalleCompra();
                obj.Id = int.Parse(item["id"].ToString());
                obj.Material = MaterialMapper.Buscar(Convert.ToInt32(item["material"].ToString()));
                obj.Fecha = DateTime.Parse(item["fecha"].ToString());
                obj.Estado = item["estado"].ToString();
                obj.Cantidad = int.Parse(item["cantidad"].ToString());
                lista.Add(obj);
            }
            return lista;
        }

        private static SqlParameter[] crearParametrosDetalle(DetalleCompra param,int ord)
        {
            SqlParameter[] parametros = new SqlParameter[6];
            parametros[0] = new SqlParameter("@id", param.Id);
            parametros[1] = new SqlParameter("@material", param.Material.Id);
            parametros[2] = new SqlParameter("@fecha", param.Fecha);
            parametros[3] = new SqlParameter("@estado", param.Estado);
            parametros[4] = new SqlParameter("@catidad", param.Cantidad);
            parametros[5] = new SqlParameter("@ordenCompra", ord);
            return parametros;
        }

        private static SqlParameter[] crearParametros(OrdenCompra param)
        {
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = new SqlParameter("@id", param.Id);
            parametros[1] = new SqlParameter("@descripcion", param.Descripcion);
            parametros[2] = new SqlParameter("@fecha", param.Fecha);
            return parametros;
        }

        public static int Guardar(OrdenCompra param)
        {
            return Acceso.getInstance().escribir("Detale_Compras_guardar", crearParametros(param));
        }

        public static int GuardarDetalle(DetalleCompra param, int ord)
        {
            return Acceso.getInstance().escribir(TablaDetalle, crearParametrosDetalle(param, ord));
        }
    }
}
