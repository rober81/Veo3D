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
            int salida = ImpresoraMapper.Insertar(imp);
            GestionarDigitoVerificador bll = new GestionarDigitoVerificador();
            bll.GuardarDigitoVerificador("Impresora");
            return salida;
        }

        public int Modificar(Impresora imp)
        {
            int salida = ImpresoraMapper.Modificar(imp);
            GestionarDigitoVerificador bll = new GestionarDigitoVerificador();
            bll.GuardarDigitoVerificador("Impresora");
            return salida;
        }

        public int Baja(Impresora imp)
        {
            int salida = ImpresoraMapper.Baja(imp);
            GestionarDigitoVerificador bll = new GestionarDigitoVerificador();
            bll.GuardarDigitoVerificador("Impresora");
            return salida;
        }

    }
}
