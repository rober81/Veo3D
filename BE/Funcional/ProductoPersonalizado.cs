using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    [Serializable]
    public class ProductoPersonalizado
    {
        public Producto Producto { get; set; }
        public string Archivo { get; set; }
        public string AnchoMontura { get; set; }
        public string Puente { get; set; }
        public string AnchoCristales { get; set; }
        public string AlturaCristales { get; set; }
        public string LongitudPatillas { get; set; }
    }
}