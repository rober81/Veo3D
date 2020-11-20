using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    public class Material
    {
        public int Id { get; set; }
        public string Marca { get; set; }
        public string Color { get; set; }
        public string Tipo { get; set; }
        public int Peso { get; set; }
        public int Metros { get; set; }
        public int Stock { get; set; }
        public decimal CostoxMetro { get; set; }

        public override string ToString()
        {
            return $"Marca: {Marca} Color: {Color} Tipo: {Tipo} Cant Stock: {Stock} m"; 
        }

        public string MaterialCompleto => ToString();

    }
}