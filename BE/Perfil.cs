﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE
{
    public class Perfil : iPermisos
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
    }
}