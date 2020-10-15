using System;
using System.Collections.Generic;
using System.Text;
using DAL;
using BE;
using System.Linq;

namespace BLL
{
    public class ProductoBLL
    {
        public List<Producto> Listar()
        {
            return ProductoMapper.Listar();
        }

        public List<Producto> Listar(string tipo)
        {
            return ProductoMapper.Listar().Where(p => p.Tipo.Equals(tipo)).ToList();
        }

        public Producto Buscar(Producto prod)
        {
            return ProductoMapper.Buscar(prod);
        }

        public int Guardar(Producto prod)
        {
            return ProductoMapper.Insertar(prod);
        }

        public int Modificar(Producto prod)
        {
            return ProductoMapper.Modificar(prod);
        }

        public int Baja(Producto prod)
        {
            return ProductoMapper.Baja(prod);
        }
    }
}