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
    public class VentaMapper
    {
        public static string Tabla = "Venta";

        public static List<Venta> Listar()
        {
            Venta obj = null;
            List<Venta> lista = new List<Venta>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Venta();
                obj.Personalizado = new ProductoPersonalizado(); ;
                obj.Id = int.Parse(item["id"].ToString());
                obj.Personalizado.AnchoMontura = item["anchomontura"].ToString();
                obj.Personalizado.Puente = item["puente"].ToString();
                obj.Personalizado.AnchoCristales = item["anchocristales"].ToString();
                obj.Personalizado.AlturaCristales = item["alturacristales"].ToString();
                obj.Personalizado.LongitudPatillas = item["longitudpatillas"].ToString();
                obj.Personalizado.Archivo = item["archivo"].ToString();
                obj.Calle = item["calle"].ToString();
                obj.Puerta = item["puerta"].ToString();
                obj.Depto = item["depto"].ToString();
                obj.Localidad = item["localidad"].ToString();
                obj.Provincia = item["provincia"].ToString();
                obj.Estado = item["estado"].ToString();
                obj.Usuario = UsuarioMapper.Buscar(item["usuario"].ToString());
                obj.CodigoPostal = item["codigoPostal"].ToString();
                Producto param = new Producto();
                param.Id = int.Parse(item["producto"].ToString());
                obj.Personalizado.Producto = ProductoMapper.Buscar(param);
                lista.Add(obj);
            }
            return lista;
        }

        public static Venta Buscar(Venta param)
        {
            return Buscar(param.Id);
        }

        public static Venta Buscar(int param)
        {
            Venta obj = null;
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", param);
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_buscar", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Venta();
                obj.Personalizado = new ProductoPersonalizado(); ;
                obj.Id = int.Parse(item["id"].ToString());
                obj.Personalizado.AnchoMontura = item["anchomontura"].ToString();
                obj.Personalizado.Puente = item["puente"].ToString();
                obj.Personalizado.AnchoCristales = item["anchocristales"].ToString();
                obj.Personalizado.AlturaCristales = item["alturacristales"].ToString();
                obj.Personalizado.LongitudPatillas = item["longitudpatillas"].ToString();
                obj.Personalizado.Archivo = item["archivo"].ToString();
                obj.Calle = item["calle"].ToString();
                obj.Puerta = item["puerta"].ToString();
                obj.Depto = item["depto"].ToString();
                obj.Localidad = item["localidad"].ToString();
                obj.Provincia = item["provincia"].ToString();
                obj.Estado = item["estado"].ToString();
                obj.Usuario = UsuarioMapper.Buscar(item["usuario"].ToString());
                obj.CodigoPostal = item["codigoPostal"].ToString();
                Producto paramp = new Producto();
                paramp.Id = int.Parse(item["producto"].ToString());
                obj.Personalizado.Producto = ProductoMapper.Buscar(paramp);
            }
            return obj;
        }

        private static SqlParameter[] crearParametros(Venta param)
        {
            SqlParameter[] parametros = new SqlParameter[16];
            parametros[0] = new SqlParameter("@id", param.Id);
            parametros[1] = new SqlParameter("@producto", param.Personalizado.Producto.Id);
            parametros[2] = new SqlParameter("@anchomontura", param.Personalizado.AnchoMontura);
            parametros[3] = new SqlParameter("@puente", param.Personalizado.Puente);
            parametros[4] = new SqlParameter("@anchocristales", param.Personalizado.AnchoCristales);
            parametros[5] = new SqlParameter("@alturacristales", param.Personalizado.AlturaCristales);
            parametros[6] = new SqlParameter("@longitudpatillas", param.Personalizado.LongitudPatillas);
            parametros[7] = new SqlParameter("@calle", param.Calle);
            parametros[8] = new SqlParameter("@puerta", param.Puerta);
            parametros[9] = new SqlParameter("@depto", param.Depto);
            parametros[10] = new SqlParameter("@localidad", param.Localidad);
            parametros[11] = new SqlParameter("@provincia", param.Provincia);
            parametros[12] = new SqlParameter("@estado", param.Estado);
            parametros[13] = new SqlParameter("@usuario", param.Usuario.Login);
            parametros[14] = new SqlParameter("@archivo", param.Personalizado.Archivo);
            parametros[15] = new SqlParameter("@codigoPostal", param.CodigoPostal);
            return parametros;
        }

        public static int Guardar(Venta param)
        {
            return Acceso.getInstance().escribir(Tabla + "_alta", crearParametros(param));
        }

        public static int Modificar(Venta param)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@id", param.Id);
            parametros[1] = new SqlParameter("@estado", param.Estado);
            return Acceso.getInstance().escribir(Tabla + "_modificar", parametros);
        }

        public static int ModificarArchivo(Venta param)
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@id", param.Id);
            parametros[1] = new SqlParameter("@archivo", param.Personalizado.Archivo);
            return Acceso.getInstance().escribir(Tabla + "_modificar_archivo", parametros);
        }

        public static int Baja(Venta param)
        {
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", param.Id);
            return Acceso.getInstance().escribir(Tabla + "_baja", parametros);
        }
    }
}
