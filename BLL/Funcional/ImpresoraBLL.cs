using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ImpresoraBLL
    {
        public List<Impresora> Listar()
        {
            return ImpresoraMapper.Listar();
        }

        public Impresora Buscar(Impresora imp)
        {
            return ImpresoraMapper.Buscar(imp);
        }

        public int Guardar(Impresora imp)
        {
            return ImpresoraMapper.Insertar(imp);
        }

        public int Modificar(Impresora imp)
        {
            return ImpresoraMapper.Modificar(imp);
        }

        public int Baja(Impresora imp)
        {
            return ImpresoraMapper.Baja(imp);
        }
    }
}
