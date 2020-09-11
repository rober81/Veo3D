using System;
namespace BE
{
    public class Bitacora
    {
        public Bitacora()
        {
            this.Fecha = DateTime.Now;
            this.Tabla = "";
            this.Dato = "";
        }

        public DateTime Fecha { get; set; }
        public Usuario Usuario { get; set; }
        public string Tabla { get; set; }
        public string Accion { get; set; }
        public string Dato { get; set; }
    }
}