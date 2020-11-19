using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    public class Rol : iPermiso
    {
        private List<iPermiso> hijos = new List<iPermiso>();
        public int Id { get; set; }
        public string Nombre { get; set; }
        public List<iPermiso> Hijos { get; set; }

        public void Add(iPermiso param)
        {
            hijos.Add(param);
        }
        public void Remove(iPermiso param)
        {
            hijos.Remove(param);
        }

        public override string ToString()
        {
            return Id + " - " + Nombre;
        }
    }
}