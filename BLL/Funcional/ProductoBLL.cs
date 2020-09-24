using System;
using System.Collections.Generic;
using System.Text;
using DAL;
using BE;

namespace BLL
{
    public class ProductoBLL
    {
        public List<Producto> ListarProductos()
        {
            ProductoMapper m = new ProductoMapper();
            return m.ListarProductos();
        }
    }
}