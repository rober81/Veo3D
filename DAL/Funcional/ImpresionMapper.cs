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
    public class ImpresionMapper
    {
        public static string Tabla = "Impresion";

        public static List<Impresion> Listar()
        {
            Impresion obj = null;
            List<Impresion> lista = new List<Impresion>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Impresion();
                obj.Id = int.Parse(item["id"].ToString());
                obj.Venta = VentaMapper.Buscar(Convert.ToInt32(item["venta"].ToString()));
                obj.Impresora = ImpresoraMapper.Buscar(Convert.ToInt32(item["impresora"].ToString()));
                obj.Prioridad = Convert.ToInt32(item["prioridad"].ToString());
                obj.Estado = item["estado"].ToString();
                obj.FechaInicio = Convert.ToDateTime(item["fechainicio"].ToString());
                obj.FechaFin = Convert.ToDateTime(item["fechafin"].ToString());
                lista.Add(obj);
            }
            return lista;
        }

        public static Impresion Buscar(Impresion param)
        {
            return Buscar(param.Id);
        }

        public static Impresion Buscar(int param)
        {
            Impresion obj = null;
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", param);
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_buscar", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Impresion();
                obj.Id = int.Parse(item["id"].ToString());
                obj.Venta = VentaMapper.Buscar(Convert.ToInt32(item["venta"].ToString()));
                obj.Impresora = ImpresoraMapper.Buscar(Convert.ToInt32(item["impresora"].ToString()));
                obj.Prioridad = Convert.ToInt32(item["prioridad"].ToString());
                obj.Estado = item["estado"].ToString();
                obj.FechaInicio = Convert.ToDateTime(item["fechainicio"].ToString());
                obj.FechaFin = Convert.ToDateTime(item["fechafin"].ToString());
            }
            return obj;
        }

        private static SqlParameter[] CrearParametros(Impresion param)
        {
            SqlParameter[] parametros = new SqlParameter[7];
            parametros[0] = new SqlParameter("@id", param.Id);
            parametros[1] = new SqlParameter("@venta", param.Venta.Id);
            parametros[2] = new SqlParameter("@impresora", param.Impresora.Id);
            parametros[3] = new SqlParameter("@prioridad", param.Prioridad);
            parametros[4] = new SqlParameter("@estado", param.Estado);
            parametros[5] = new SqlParameter("@fechainicio", param.FechaInicio);
            parametros[6] = new SqlParameter("@fechafin", param.FechaFin);
            return parametros;
        }

        public static int Guardar(Impresion param)
        {
            return Acceso.getInstance().escribir(Tabla + "_alta", CrearParametros(param));
        }

        public static int Modificar(Impresion param)
        {
            return Acceso.getInstance().escribir(Tabla + "_modificar", CrearParametros(param));
        }

        public static int Baja(Impresion param)
        {
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", param.Id);
            return Acceso.getInstance().escribir(Tabla + "_baja", parametros);
        }
    }
}
