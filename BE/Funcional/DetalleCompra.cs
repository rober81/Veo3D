using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class DetalleCompra
    {
        public int Id { get; set; }
        public Material Material { get; set; }
        public DateTime Fecha { get; set; }
        public string Estado { get; set; }
        public int Cantidad { get; set; }
    }
}
