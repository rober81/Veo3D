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
            int salida =  VentaMapper.Guardar(ven);
            GestionarDigitoVerificador bll = new GestionarDigitoVerificador();
            bll.GuardarDigitoVerificador("Venta");
            return salida;
        }

        public int Modificar(Venta ven)
        {
            int salida = VentaMapper.Modificar(ven);
            GestionarDigitoVerificador bll = new GestionarDigitoVerificador();
            bll.GuardarDigitoVerificador("Venta");
            return salida;
        }

        public int ModificarArchivo(Venta ven)
        {
            int salida = VentaMapper.ModificarArchivo(ven);
            GestionarDigitoVerificador bll = new GestionarDigitoVerificador();
            bll.GuardarDigitoVerificador("Venta");
            return salida;
        }

    }
}