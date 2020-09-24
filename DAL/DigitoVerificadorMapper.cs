using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class DigitoVerificadorMapper
    {
        public static string Tabla = "Digitoverificador";

        public static List<BE.DigitoVerificador> Listar()
        {
            List<BE.DigitoVerificador> lista = new List<BE.DigitoVerificador>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                BE.DigitoVerificador obj = new BE.DigitoVerificador();
                obj.Tabla = item["tabla"].ToString();
                obj.DVH = item["DVH"].ToString();
                obj.DVV = item["DVV"].ToString();
                lista.Add(obj);
            }
            return lista;
        }

        private static SqlParameter[] crearParametros(BE.DigitoVerificador param)
        {
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = new SqlParameter("@tabla", param.Tabla);
            parametros[1] = new SqlParameter("@dvv", param.DVV);
            parametros[2] = new SqlParameter("@dvh", Util.DigitoVerificador.CalcularDV(param.getDVH()));
            return parametros;
        }

        public static int Insertar(BE.DigitoVerificador param)
        {
            return Acceso.getInstance().escribir(Tabla + "_alta", crearParametros(param));
        }

        public static int Modificar(BE.DigitoVerificador param)
        {
            return Acceso.getInstance().escribir(Tabla + "_modificar", crearParametros(param));
        }
    }
}