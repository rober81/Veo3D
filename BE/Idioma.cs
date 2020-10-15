using System.Collections.Generic;

namespace BE
{
    public class Idioma
    {
        public Idioma(string nombre)
        {
            this.Nombre = nombre;
        }
        public Idioma(string nombre, string codigo)
        {
            this.Nombre = nombre;
            this.Codigo = codigo;
        }
        public string Nombre { get; set; }
        public string Codigo { get; set; }
        public Dictionary<string, string> Detalle { get; set; }

        public override string ToString()
        {
            return Nombre;
        }

        public override bool Equals(object obj)
        {
            Idioma cmp = obj as Idioma;
            if (cmp == null)
                return false;
            return Nombre.Equals(cmp.Nombre);
        }

        public override int GetHashCode()
        {
            return 289764928 + EqualityComparer<string>.Default.GetHashCode(Nombre);
        }
    }
}