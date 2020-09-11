using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public class BitacoraMapper
    {
        public static string Tabla = "Bitacora";

        public static List<BE.Bitacora> Listar()
        {
            BE.Bitacora obj = null;
            List<BE.Bitacora> lista = new List<BE.Bitacora>();
            DataTable tabla = SqlHelper.getInstanceBitacora().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new BE.Bitacora();
                obj.Usuario = new BE.Usuario(item["usuario"].ToString());
                obj.Fecha = DateTime.Parse(item["fecha"].ToString());
                obj.Tabla = item["tabla"].ToString();
                obj.Accion = item["accion"].ToString();
                obj.Dato = item["dato"].ToString();
                lista.Add(obj);
            }
            return lista;
        }

        public static int Insertar(BE.Bitacora bitacora)
        {
            SqlParameter[] parametros = new SqlParameter[6];
            parametros[0] = new SqlParameter("@usuario", bitacora.Usuario.ToString());
            parametros[1] = new SqlParameter("@fecha", bitacora.Fecha);
            parametros[1].DbType = DbType.DateTime;
            parametros[2] = new SqlParameter("@tabla", bitacora.Tabla);
            parametros[3] = new SqlParameter("@dato", bitacora.Dato);
            parametros[4] = new SqlParameter("@accion", bitacora.Accion);
            parametros[5] = new SqlParameter("@dvh", "dvh");
            return SqlHelper.getInstanceBitacora().escribir(Tabla + "_alta", parametros);
        }
    }
}