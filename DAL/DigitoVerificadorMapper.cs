using BE;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class DigitoVerificadorMapper
    {
        public static string Tabla = "Digitoverificador";
        public static string Tabla2 = "DigitoVerificadorDetalle";

        public List<DigitoVerificador> Listar()
        {
            List<DigitoVerificador> lista = new List<DigitoVerificador>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                DigitoVerificador obj = new DigitoVerificador();
                obj.Tabla = item["tabla"].ToString();
                obj.DVV = item["DVV"].ToString();
                obj.Detalle = BuscarDetalle(obj.Tabla);
                lista.Add(obj);
            }
            return lista;
        }

        public DigitoVerificador Buscar(string ta)
        {
            DigitoVerificador obj = new DigitoVerificador();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@tabla", ta);
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_buscar", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                obj.Tabla = item["tabla"].ToString();
                obj.DVV = item["DVV"].ToString();
                obj.Detalle = BuscarDetalle(obj.Tabla);
            }
            return obj;
        }

        public int Guardar(DigitoVerificador param)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@tabla", param.Tabla);
            parametros[1] = new SqlParameter("@dvv", param.DVV);
            int retorno = Acceso.getInstance().escribir(Tabla + "_alta", parametros);
            foreach (var item in param.Detalle)
            {
                Guardar(item);
            }
            return retorno;
        }


        public int Guardar(DigitoVerificadorDetalle param)
        {
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = new SqlParameter("@tabla", param.Tabla);
            parametros[1] = new SqlParameter("@idtabla", param.IdTabla);
            parametros[2] = new SqlParameter("@dvh", param.DVH);
            return Acceso.getInstance().escribir(Tabla2 + "_alta", parametros);
        }

        public List<DigitoVerificadorDetalle> BuscarDetalle(string ta)
        {
            List<DigitoVerificadorDetalle> lista = new List<DigitoVerificadorDetalle>();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@tabla", ta);
            DataTable tabla = Acceso.getInstance().leer(Tabla2 + "_buscar", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                DigitoVerificadorDetalle obj = new DigitoVerificadorDetalle();
                obj.Tabla = item["tabla"].ToString();
                obj.IdTabla = item["idtabla"].ToString();
                obj.DVH = item["DVH"].ToString();
                lista.Add(obj);
            }
            return lista;
        }
    }
}