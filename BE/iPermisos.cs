using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    public interface iPermisos
    {
        int Id { get; set; }
        string Nombre { get; set; }
        List<iPermisos> Hijos { get;}
    }
}