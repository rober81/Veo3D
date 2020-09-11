using System.Data.SqlClient;
using System.Data;
using Util;

namespace DAL
{
    public class SqlHelper
    {
        protected SqlConnection conexion;
        private static SqlHelper instancia = null;
        private static SqlHelper instanciaBitacora = null;

        public static SqlHelper getInstance()
        {
            if (instancia == null)
            {
                instancia = new SqlHelper(Configuracion.getInstance().aplicacionDB);
            }
            return instancia;
        }

        public static SqlHelper getInstanceBitacora()
        {
            if (instanciaBitacora == null)
            {
             instanciaBitacora = new SqlHelper(Configuracion.getInstance().bitacoraDB);
            }
            return instanciaBitacora;
        }

        private SqlHelper(string db)
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
            } finally{
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
            } finally{
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
