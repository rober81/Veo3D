using BE;
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
            return VentaMapper.Buscar(ven);
        }

        public Venta Buscar(int ven)
        {
            return VentaMapper.Buscar(ven);
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

        public int ModificarArchivo(Venta ven)
        {
            return VentaMapper.ModificarArchivo(ven);
        }

    }
}