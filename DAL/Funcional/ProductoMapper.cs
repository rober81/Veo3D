using System;
using System.Collections.Generic;
using System.Text;
using BE;
namespace DAL
{
    public class ProductoMapper
    {
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
                p1.Archivo = "1.jpg";
                p1.Nombre = "Aries";
                p1.cantidadMaterial = 4;
                p1.TiempoImpresion = 2;
                lista.Add(p1);
                Producto p2 = new Producto();
                p2.Archivo = "2.jpg";
                p2.Nombre = "Tauro";
                p2.cantidadMaterial = 4;
                p2.TiempoImpresion = 2;
                lista.Add(p2);
                Producto p3 = new Producto();
                p3.Archivo = "3.jpg";
                p3.Nombre = "Geminis";
                p3.cantidadMaterial = 4;
                p3.TiempoImpresion = 2;
                lista.Add(p3);
                Producto p4 = new Producto();
                p4.Archivo = "4.jpg";
                p4.Nombre = "Cancer";
                p4.cantidadMaterial = 4;
                p4.TiempoImpresion = 2;
                lista.Add(p4);
                Producto p5 = new Producto();
                p5.Archivo = "5.jpg";
                p5.Nombre = "Leo";
                p5.cantidadMaterial = 4;
                p5.TiempoImpresion = 2;
                lista.Add(p5);
            return lista;
        }
    }
}