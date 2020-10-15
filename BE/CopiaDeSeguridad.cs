using System;

namespace BE
{
    public class CopiaDeSeguridad
    {
        public CopiaDeSeguridad()
        {
        }
        public CopiaDeSeguridad(string cp)
        {
            this.Nombre = cp;
        }

        public string Nombre { get; set; }
        public DateTime Fecha { get; set; }
        public override string ToString()
        {
            return Nombre;
        }

        public override bool Equals(object obj)
        {
            CopiaDeSeguridad cp = obj as CopiaDeSeguridad;
            if (cp == null)
                return false;
            return Nombre.Equals(cp.Nombre);
        }
    }
}