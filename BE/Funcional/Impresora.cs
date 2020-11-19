using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    public class Impresora : iDigitoVerificador
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public int Estado { get; set; }
        public List<Impresion> Impresiones { get; set; }

        public string Identificador => Id.ToString();
    }
}