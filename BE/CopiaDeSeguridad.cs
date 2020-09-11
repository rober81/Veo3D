using System;

namespace BE
{
    public class CopiaDeSeguridad
    {
        public string Nombre { get; set; }
        public DateTime Fecha { get; set; }
        public override string ToString()
        {
            return Nombre;
        }
    }
}