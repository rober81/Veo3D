using System;
using System.Collections.Generic;
using System.Text;

namespace BE
{
    public class Producto
    {
        public string Nombre { get; set; }
        public string Archivo { get; set; }
        public Decimal cantidadMaterial { get; set; }
        public Decimal TiempoImpresion { get; set; }
        public string Tipo { get; set; }
    }
}