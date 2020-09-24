using System;
using System.Collections.Generic;
using System.Text;
using Util;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    class Acceso
    {
        protected SqlConnection conexion;
        private static Acceso instancia = null;
        private static Acceso instanciaBitacora = null;

        public static Acceso getInstance()
        {
            if (instancia == null)
            {
                instancia = new Acceso(Configuracion.getInstance().aplicacionDB);
            }
            return instancia;
        }

        public static Acceso getInstanceBitacora()
        {
            if (instanciaBitacora == null)
            {
                instanciaBitacora = new Acceso(Configuracion.getInstance().bitacoraDB);
            }
            return instanciaBitacora;
        }

        private Acceso(string db)
        {
            conexion = new SqlConnection("INITIAL CATALOG = " + db + "; DATA SOURCE =.\\" + Configuracion.getInstance().servidor + "; INTEGRATED SECURITY = SSPI");
        }

        public void abrir()
        {
            try
            {
                conexion.Open();

            }
            catch (SqlException e)
            {
                Log.Error("Error al abrir " + e.ToString());
                throw;
            }
        }

        public void cerrar()
        {
            try
            {
                conexion.Close();
            }
            catch (SqlException e)
            {
                Log.Error("Error al cerrar " + e.ToString());
                throw;
            }
        }

        public DataTable leer(string nombre, SqlParameter[] parametros)
        {
            DataTable tabla = new DataTable();
            try
            {
                abrir();
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand(nombre, conexion);
                adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (parametros != null)
                {
                    adapter.SelectCommand.Parameters.AddRange(parametros);
                }
                adapter.Fill(tabla);
            }
            catch (System.Exception e)
            {
                Log.Error("Error al Leer " + e.ToString());
            }
            finally
            {
                cerrar();
            }
            return tabla;
        }

        public int escribir(string nombre, SqlParameter[] parametros)
        {
            int filas = 0;
            try
            {
                abrir();
                SqlCommand cmd = new SqlCommand(nombre, conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                if (parametros != null)
                {
                    cmd.Parameters.AddRange(parametros);
                }
                filas = cmd.ExecuteNonQuery();
                cerrar();
            }
            catch (System.Exception e)
            {
                Log.Error("Error al Escribir " + e.ToString());
            }
            finally
            {
                cerrar();
            }
            return filas;
        }

        public int ejecutarSQL(string nombre, SqlParameter[] parametros)
        {
            int filas = 0;
            try
            {
                SqlCommand cmd = new SqlCommand(nombre, conexion);
                cmd.CommandType = CommandType.Text;
                if (parametros != null)
                {
                    cmd.Parameters.AddRange(parametros);
                }
                filas = cmd.ExecuteNonQuery();
            }
            catch (System.Exception e)
            {
                Log.Error("Error al Escribir " + e.ToString());
            }
            return filas;
        }
    }
}
