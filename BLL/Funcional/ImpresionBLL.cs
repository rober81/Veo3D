using System;
using BE;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class ImpresionBLL
    {
        public List<Impresion> Listar()
        {
            return ImpresionMapper.Listar();
        }

        public Impresion Buscar(Impresion imp)
        {
            return ImpresionMapper.Buscar(imp);
        }

        public Impresion Buscar(int imp)
        {
            return ImpresionMapper.Buscar(imp);
        }


        public int Modificar(Impresion imp)
        {
            return ImpresionMapper.Modificar(imp);
        }

        public int Baja(Impresion imp)
        {
            return ImpresionMapper.Baja(imp);
        }

        public int EnviarADomicilio(Venta venta)
        {
            //Actualizo la venta avisando que fue a domicilio
            VentaBLL vbll = new VentaBLL();
            venta.Estado = Estados.EnvioDomicilio;
            return vbll.Modificar(venta);
        }

        public int EnviarAImprimir(Impresion imp)
        {
            var maxPrioridad = 0;
            //Genero una impresion nueva
            imp.Venta.Estado = Estados.EnviadoAImprimir;
            imp.Estado = Estados.Nuevo;
            imp.FechaInicio = DateTime.Now;
            imp.FechaFin = DateTime.Now.AddDays(7);

            //Ubico la impresora y la prioridad
            imp.Impresora = ImpresoraLibre();
            var prioridadesImpresora = Listar().Where(x =>x.Impresora.Id == imp.Impresora.Id).ToList();
            if (prioridadesImpresora.Count > 0)
                maxPrioridad = prioridadesImpresora.Max(x => x.Prioridad);
            imp.Prioridad = maxPrioridad + 1;

            //Actualizo la venta avisando que fue a imprimir
            VentaBLL vbll = new VentaBLL();
            imp.Venta.Estado = Estados.EnviadoAImprimir;
            vbll.Modificar(imp.Venta);
            return ImpresionMapper.Guardar(imp);
        }

        public Impresora ImpresoraLibre()
        {
            ImpresoraBLL impBll = new ImpresoraBLL();
            Impresora masLibre = null;

            //Impresoras activas
            List<Impresora> impresoras = impBll.Listar().Where(i => i.Estado == 0).ToList();

            //Busco impresoras que no estan trabajando
            List<Impresion> impresiones = Listar().Where(x => !x.Estado.Equals(Estados.EnviadoAImprimir) && !x.Estado.Equals(Estados.Imprimiendo)).ToList();

            //Busco impresoras libres
            var impresorasLibres = impresoras.Where(p => impresiones.All(p2 => p2.Id != p.Id)).ToList();
            if (impresorasLibres.Count > 0)
            {
                masLibre = impresorasLibres.First();
                return masLibre;
            }

            //No Habia impresoras libres, busco las que tienen menos trabajo
            var ImpresorasActivas =
            from im in impresoras
            join siones in impresiones on im.Id equals siones.Id
            select siones;

            var CantidadXImpresora =
                from imp in ImpresorasActivas
                group imp by imp.Impresora into grupo
                select new
                {
                    Impresora = grupo.Key,
                    Count = grupo.Count(),
                };
            CantidadXImpresora.OrderBy(x => x.Count);
            masLibre = CantidadXImpresora.First().Impresora;
            return masLibre;
        }

        public void CambiarPrioridad(Impresion imp, int nueva)
        {
            var prioridadesImpresora = Listar().Where(x => x.Impresora.Id == imp.Impresora.Id).ToList();
            var listaOrdenada = prioridadesImpresora.OrderBy(x => x.Prioridad).ToList();
            var itemREmover = listaOrdenada.Where(x => x.Id == imp.Id).First();
            if (nueva > listaOrdenada.Count)
                nueva = listaOrdenada.Count - 1;
            if (nueva < 1)
                nueva = 1;

            listaOrdenada.Remove(itemREmover);
            nueva--;
            listaOrdenada.Insert(nueva, itemREmover);
            int numero = 1;
            foreach (var item in listaOrdenada)
            {
                item.Prioridad = numero++;
                ImpresionMapper.Modificar(item);
            }
        }
    }
}
