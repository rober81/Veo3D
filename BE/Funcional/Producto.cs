﻿using System;
using System.Collections.Generic;
using System.Text;

namespace BE
{
    [Serializable]
    public class Producto : iDigitoVerificador
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Archivo { get; set; }
        public Decimal CantidadMaterial { get; set; }
        public Decimal TiempoImpresion { get; set; }
        public string Imagen { get; set; }
        public string Descripcion { get; set; }
        public string Tipo { get; set; }
        public int Calificacion { get; set; }
        public Decimal Precio { get; set; }

        public string Identificador => Id.ToString();
    }
}