﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    public class Venta : iDigitoVerificador
    {
        public int Id { get; set; }
        public ProductoPersonalizado Personalizado { get; set; }
        public string Calle { get; set; }
        public string Puerta { get; set; }
        public string Depto { get; set; }
        public string Localidad { get; set; }
        public string Provincia { get; set; }
        public string Estado { get; set; }
        public Usuario Usuario { get; set; }

        public string Identificador => Id.ToString();
    }
}