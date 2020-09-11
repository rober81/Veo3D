using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    public class Perfiles : iPermisos
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public Perfiles Padre { get; set; }

        public override string ToString()
        {
            return Id + " - " + Nombre;
        }

        public List<iPermisos> Hijos
        {
            get
            {
                throw new NotImplementedException();
            }
        }
    }
}