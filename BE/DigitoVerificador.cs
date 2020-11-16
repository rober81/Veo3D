using System;
using System.Collections.Generic;

namespace BE
{
    public class DigitoVerificador
    {
        public string Tabla { get; set; }
        public string DVV { get; set; }
        public string Estado { get; set; }
        public List<DigitoVerificadorDetalle> Detalle { get; set; }
    }
}