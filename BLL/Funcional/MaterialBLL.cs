using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class MaterialBLL
    {
        public List<Material> Listar()
        {
            return MaterialMapper.Listar();
        }

        public Material Buscar(Material mat)
        {
            return MaterialMapper.Buscar(mat);
        }

        public int Guardar(Material mat)
        {
            return MaterialMapper.Insertar(mat);
        }

        public int Modificar(Material mat)
        {
            return MaterialMapper.Modificar(mat);
        }

        public int Baja(Material mat)
        {
            return MaterialMapper.Baja(mat);
        }
    }
}
