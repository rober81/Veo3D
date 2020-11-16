using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    public class Permiso : iPermisos
    {

        public int Id { get; set; }
        public string Nombre { get; set; }

        public List<iPermisos> Hijos
        {
            get
            {
                return null;
            }
        }

        public string Identificador => Id.ToString();
    }
}