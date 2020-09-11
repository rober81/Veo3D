using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    public class Rol : iPermisos
    {
        private List<iPermisos> hijos = new List<iPermisos>();
        public int Id { get; set; }
        public string Nombre { get; set; }

        public List<iPermisos> Hijos
        {
            get
            {
                return this.hijos;
            }
        }

        public void Add(iPermisos param)
        {
            hijos.Add(param);
        }
        public void Remove(iPermisos param)
        {
            hijos.Remove(param);
        }

        public override string ToString()
        {
            return Id + " - " + Nombre;
        }
    }
}