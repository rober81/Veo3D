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
        public Material Material { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }

        public string Cliente { get => Venta.NombreCompleto; }
        public string Producto { get => Venta.Personalizado.Producto.Nombre; }
        public string Archivo { get => Venta.Personalizado.Archivo; }
        public string MaterialNombre { get => Material.MaterialDato; }
        public string MaterialColor { get => Material.Color; }
        public string MaterialTipo { get => Material.Tipo; }
        public decimal CantMaterial { get => Venta.Personalizado.Producto.CantidadMaterial; }
        public decimal TiempoImpresion { get => Venta.Personalizado.Producto.TiempoImpresion; }
        public string Provincia { get => Venta.Provincia; }
        public string Localidad { get => Venta.Localidad; }
        public string Calle { get => Venta.Calle; }
        public string Puerta { get => Venta.Puerta; }
        public string Depto { get => Venta.Depto; }
        public string Envio { get => Venta.CodigoEnvio; }

        public override string ToString()
        {
            return Prioridad.ToString();
        }

    }
}
