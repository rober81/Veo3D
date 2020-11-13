using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class CompraBLL
    {
        public List<Compra> Listar()
        {
            return CompraMapper.Listar();
        }

        public Compra Buscar(Compra com)
        {
            return null;
        }

        public int Guardar(Compra com)
        {
            com.Estado = "Nuevo";
            return CompraMapper.Guardar(com);
        }

        public int Modificar(Compra com)
        {
            return CompraMapper.Modificar(com);
        }

    }
}