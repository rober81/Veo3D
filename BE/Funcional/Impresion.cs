using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Impresion
    {
        public int Id { get; set; }
        public Venta Venta { get; set; }
        public Impresora Impresora { get; set; }
        public int Prioridad { get; set; }
        public string Estado { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }

        public override string ToString()
        {
            return Prioridad.ToString();
        }

    }
}
