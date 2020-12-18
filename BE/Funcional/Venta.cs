using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    [Serializable]
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
        public string CodigoPostal { get; set; }
        public Usuario Usuario { get; set; }

        public string NombreCompleto { get => Usuario.NombreCompleto; }
        public string Producto { get => Personalizado.Producto.Nombre; }
        public Decimal Precio { get => Personalizado.Producto.Precio; }

        public string Identificador => Id.ToString();
    }
}