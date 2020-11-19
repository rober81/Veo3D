using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    public class Permiso : iPermiso
    {
        public int Id { get; set; }
        public string Nombre { get; set; }


        public List<iPermiso> Hijos { get; set; }
        
        public string Identificador => Id.ToString();
    }
}