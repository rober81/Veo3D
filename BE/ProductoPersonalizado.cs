using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    public class ProductoPersonalizado
    {
        public Producto Producto { get; set; }
        public int AnchoMontura { get; set; }
        public int Puente { get; set; }
        public int AnchoCristales { get; set; }
        public int AlturaCristales { get; set; }
        public int LongitudPatillas { get; set; }
    }
}