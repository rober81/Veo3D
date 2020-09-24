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
            p1.Archivo = "1.png";
            p1.Nombre = "Aries";
            p1.cantidadMaterial = 4;
            p1.TiempoImpresion = 2;
            lista.Add(p1);
            Producto p2 = new Producto();
            p2.Archivo = "2.png";
            p2.Nombre = "Tauro";
            p2.cantidadMaterial = 4;
            p2.TiempoImpresion = 2;
            lista.Add(p2);
            Producto p3 = new Producto();
            p3.Archivo = "3.png";
            p3.Nombre = "Geminis";
            p3.cantidadMaterial = 4;
            p3.TiempoImpresion = 2;
            lista.Add(p3);
            Producto p4 = new Producto();
            p4.Archivo = "4.png";
            p4.Nombre = "Cancer";
            p4.cantidadMaterial = 4;
            p4.TiempoImpresion = 2;
            lista.Add(p4);
            Producto p5 = new Producto();
            p5.Archivo = "5.png";
            p5.Nombre = "Leo";
            p5.cantidadMaterial = 4;
            p5.TiempoImpresion = 2;
            lista.Add(p5);
            Producto p6 = new Producto();
            p6.Archivo = "6.png";
            p6.Nombre = "Virgo";
            p6.cantidadMaterial = 4;
            p6.TiempoImpresion = 2;
            lista.Add(p6);
            Producto p7 = new Producto();
            p7.Archivo = "7.png";
            p7.Nombre = "Libra";
            p7.cantidadMaterial = 4;
            p7.TiempoImpresion = 2;
            lista.Add(p7);
            Producto p8 = new Producto();
            p8.Archivo = "8.png";
            p8.Nombre = "Escorpio";
            p8.cantidadMaterial = 4;
            p8.TiempoImpresion = 2;
            lista.Add(p8);
            Producto p9 = new Producto();
            p9.Archivo = "9.png";
            p9.Nombre = "Sagitario";
            p9.cantidadMaterial = 4;
            p9.TiempoImpresion = 2;
            lista.Add(p9);
            Producto p10 = new Producto();
            p10.Archivo = "10.png";
            p10.Nombre = "Capricornio";
            p10.cantidadMaterial = 4;
            p10.TiempoImpresion = 2;
            lista.Add(p10);
            Producto p11 = new Producto();
            p11.Archivo = "11.png";
            p11.Nombre = "Acuario";
            p11.cantidadMaterial = 4;
            p11.TiempoImpresion = 2;
            lista.Add(p11);
            Producto p12 = new Producto();
            p12.Archivo = "12.png";
            p12.Nombre = "Piscis";
            p12.cantidadMaterial = 4;
            p12.TiempoImpresion = 2;
            lista.Add(p12);
            return lista;
        }
    }
}