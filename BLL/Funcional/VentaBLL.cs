﻿using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class VentaBLL
    {
        public List<Venta> Listar()
        {
            return VentaMapper.Listar();
        }

        public Venta Buscar(Venta ven)
        {
            return null;
        }

        public int Guardar(Venta ven)
        {
            ven.Estado = "Nuevo";
            return VentaMapper.Guardar(ven);
        }

        public int Modificar(Venta ven)
        {
            return VentaMapper.Modificar(ven);
        }

    }
}