using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using BE;
namespace DAL
{
    public class ProductoMapper
    {
        public static string Tabla = "Producto";

        public static List<Producto> Listar()
        {
            Producto obj = null;
            List<Producto> lista = new List<Producto>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Producto();
                obj.Id = int.Parse(item["id"].ToString());
                obj.Nombre = item["nombre"].ToString();
                obj.Archivo = item["archivo"].ToString();
                obj.CantidadMaterial = int.Parse(item["cantidadMaterial"].ToString());
                obj.TiempoImpresion = int.Parse(item["tiempo"].ToString());
                obj.Imagen = item["imagen"].ToString();
                obj.Descripcion = item["descripcion"].ToString();
                obj.Tipo = item["tipo"].ToString();
                obj.Calificacion = int.Parse(item["calificacion"].ToString());
                obj.Precio = decimal.Parse(item["precio"].ToString());
                lista.Add(obj);
            }
            return lista;
        }

        public static Producto Buscar(Producto param)
        {
            Producto buscado = null;
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", param.Id);
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_buscar", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                buscado = new Producto();
                buscado.Id = int.Parse(item["id"].ToString());
                buscado.Nombre = item["nombre"].ToString();
                buscado.Archivo = item["archivo"].ToString();
                buscado.CantidadMaterial = int.Parse(item["cantidadMaterial"].ToString());
                buscado.TiempoImpresion = int.Parse(item["tiempo"].ToString());
                buscado.Imagen = item["imagen"].ToString();
                buscado.Descripcion = item["descripcion"].ToString();
                buscado.Tipo = item["tipo"].ToString();
                buscado.Calificacion = int.Parse(item["calificacion"].ToString());
                buscado.Precio = decimal.Parse(item["precio"].ToString());
            }
            return buscado;
        }

        private static SqlParameter[] crearParametros(Producto param)
        {
            SqlParameter[] parametros = new SqlParameter[9];
            parametros[0] = new SqlParameter("@id", param.Id);
            parametros[1] = new SqlParameter("@nombre", param.Nombre);
            parametros[2] = new SqlParameter("@archivo", param.Archivo);
            parametros[3] = new SqlParameter("@cantidadMaterial", param.CantidadMaterial);
            parametros[4] = new SqlParameter("@tiempo", param.TiempoImpresion);
            parametros[5] = new SqlParameter("@imagen", param.Imagen);
            parametros[6] = new SqlParameter("@descripcion", param.Descripcion);
            parametros[7] = new SqlParameter("@tipo", param.Tipo);
            parametros[8] = new SqlParameter("@calificacion", param.Calificacion);
            return parametros;
        }

        public static int Insertar(Producto param)
        {
            return Acceso.getInstance().escribir(Tabla + "_alta", crearParametros(param));
        }

        public static int Modificar(Producto param)
        {
            return Acceso.getInstance().escribir(Tabla + "_modificar", crearParametros(param));
        }

        public static int Baja(Producto param)
        {
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", param.Id);
            return Acceso.getInstance().escribir(Tabla + "_baja", parametros);
        }
        public List<Producto> ListarProductos()
        {
            //Receta
            // 1 al 4 redondo
            // 5 al 9 rectangular
            //10 al 14 cuadrado
            //Sol
            //15 aviador
            //16 a 19 cuadrado

            List<Producto> lista = new List<Producto>();
            Producto p1 = new Producto();
            p1.Archivo = "1.png";
            p1.Nombre = "Aries";
            p1.CantidadMaterial = 4;
            p1.TiempoImpresion = 2;
            lista.Add(p1);
            Producto p2 = new Producto();
            p2.Archivo = "2.png";
            p2.Nombre = "Tauro";
            p2.CantidadMaterial = 4;
            p2.TiempoImpresion = 2;
            lista.Add(p2);
            Producto p3 = new Producto();
            p3.Archivo = "3.png";
            p3.Nombre = "Geminis";
            p3.CantidadMaterial = 4;
            p3.TiempoImpresion = 2;
            lista.Add(p3);
            Producto p4 = new Producto();
            p4.Archivo = "4.png";
            p4.Nombre = "Cancer";
            p4.CantidadMaterial = 4;
            p4.TiempoImpresion = 2;
            lista.Add(p4);
            Producto p5 = new Producto();
            p5.Archivo = "5.png";
            p5.Nombre = "Leo";
            p5.CantidadMaterial = 4;
            p5.TiempoImpresion = 2;
            lista.Add(p5);
            Producto p6 = new Producto();
            p6.Archivo = "6.png";
            p6.Nombre = "Virgo";
            p6.CantidadMaterial = 4;
            p6.TiempoImpresion = 2;
            lista.Add(p6);
            Producto p7 = new Producto();
            p7.Archivo = "7.png";
            p7.Nombre = "Libra";
            p7.CantidadMaterial = 4;
            p7.TiempoImpresion = 2;
            lista.Add(p7);
            Producto p8 = new Producto();
            p8.Archivo = "8.png";
            p8.Nombre = "Escorpio";
            p8.CantidadMaterial = 4;
            p8.TiempoImpresion = 2;
            lista.Add(p8);
            Producto p9 = new Producto();
            p9.Archivo = "9.png";
            p9.Nombre = "Sagitario";
            p9.CantidadMaterial = 4;
            p9.TiempoImpresion = 2;
            lista.Add(p9);
            Producto p10 = new Producto();
            p10.Archivo = "10.png";
            p10.Nombre = "Capricornio";
            p10.CantidadMaterial = 4;
            p10.TiempoImpresion = 2;
            lista.Add(p10);
            Producto p11 = new Producto();
            p11.Archivo = "11.png";
            p11.Nombre = "Acuario";
            p11.CantidadMaterial = 4;
            p11.TiempoImpresion = 2;
            lista.Add(p11);
            Producto p12 = new Producto();
            p12.Archivo = "12.png";
            p12.Nombre = "Piscis";
            p12.CantidadMaterial = 4;
            p12.TiempoImpresion = 2;
            lista.Add(p12);
            return lista;
        }
    }
}