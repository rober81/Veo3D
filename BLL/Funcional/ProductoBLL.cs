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

        public Producto Buscar(int prod)
        {
            Producto p = new Producto();
            p.Id = prod;
            return ProductoMapper.Buscar(p);
        }

        public int Guardar(Producto prod)
        {
            int salida = ProductoMapper.Insertar(prod);
            GestionarDigitoVerificador bll = new GestionarDigitoVerificador();
            bll.GuardarDigitoVerificador("Producto");
            return salida;
        }

        public int Modificar(Producto prod)
        {
            int salida = ProductoMapper.Modificar(prod);
            GestionarDigitoVerificador bll = new GestionarDigitoVerificador();
            bll.GuardarDigitoVerificador("Producto");
            return salida;
        }

        public int Baja(Producto prod)
        {
            int salida = ProductoMapper.Baja(prod);
            GestionarDigitoVerificador bll = new GestionarDigitoVerificador();
            bll.GuardarDigitoVerificador("Producto");
            return salida;
        }
    }
}