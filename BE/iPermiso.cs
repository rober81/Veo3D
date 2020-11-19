using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    public interface iPermiso
    {
        int Id { get; set; }
        string Nombre { get; set; }
        List<iPermiso> Hijos { get; set; }
    }
}