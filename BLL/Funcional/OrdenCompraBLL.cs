using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class OrdenCompraBLL
    {
        public List<BE.OrdenCompra> ListarOrdenes()
        {
            return ComprasMapper.ListarOrdenes();
        }

        public List<BE.DetalleCompra> ListarDetalle()
        {
            return ComprasMapper.ListarDetalle();
        }

        public int Guardar(BE.OrdenCompra p)
        {
            return ComprasMapper.Guardar(p);
        }

        public int Guardar(BE.DetalleCompra p, int o)
        {
            return ComprasMapper.GuardarDetalle(p,o);
        }
    }
}
