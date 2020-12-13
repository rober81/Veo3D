using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BLL
{
    public class GestionarPermisos
    {
        readonly PermisoMapper mapper = new PermisoMapper();

        public List<string> ListaDefinida { get; set; }

        public GestionarPermisos()
        {
            GenerarListarPermisos();
        }


        public List<Permiso> ListarPerfiles()
        {
            return mapper.ListarPermiso(); ;
        }

        public int Insertar(Permiso per, int padre)
        {
            int res = mapper.Guardar(per, padre);
            Bitacora("Insertar", per);
            return res;
        }

        public int Modificar(Permiso per)
        {
            int res = mapper.Modificar(per, 0);
            Bitacora("Modificar", per);
            return res;
        }

        public int Borrar(Permiso per)
        {
            int res = mapper.Baja(per);
            Bitacora("Borrar", per);
            return res;
        }

        public List<iPermiso> ListarUsuarioPermiso(Usuario usr)
        {
            List<iPermiso> lista = mapper.ListarUsuarioPermiso(usr);
            return lista;
        }

        public List<Tuple<Usuario, iPermiso>> ListarUsuarioPermiso()
        {
            List<Tuple<Usuario, iPermiso>> lista = mapper.ListarUsuarioPermiso();
            return lista;
        }

        public bool Buscar(string nombre)
        {
            List<iPermiso> permisos = GestionarSesion.getInstance().Permisos;
            if (permisos == null)
                return false;
            foreach (var item in permisos)
            {
                if (item.Nombre == nombre)
                    return true;
                if (Buscar(item, nombre) != null)
                    return true;
            }
            return false;
        }

        public iPermiso Buscar(iPermiso padre, string nombre)
        {
            if (padre == null)
                return null;

            if (padre.Nombre == nombre)
                return padre;

            foreach (var hijo in padre.Hijos)
            {
                var encontrado = Buscar(hijo, nombre);
                if (encontrado != null)
                    return encontrado;
            }
            return null;
        }

        public bool TieneAdmin()
        {
            List<iPermiso> permisos = GestionarSesion.getInstance().Permisos.Where(x => ! x.Nombre.Equals("Cliente")).ToList();
            if (permisos.Count > 0)
                    return true;
            return false;
        }

        public int GuardarUsuarioPermiso(Usuario usr, iPermiso per)
        {
            int res = 0;
            //res += mapper.BorrarUsuarioPermiso(usr);
            res += mapper.GuardarUsuarioPermiso(usr, per);

            Bitacora("Insertar Permiso", usr);
            return res;
        }

        public int BorrarUsuarioPermiso(Usuario usr)
        {
            return mapper.BorrarUsuarioPermiso(usr);
        }

        private void Bitacora(string accion, Permiso per)
        {
            BE.Bitacora bitacora = new BE.Bitacora();
            bitacora.Accion = accion;
            bitacora.Tabla = "Permiso";
            bitacora.Dato = per.ToString();
            BLL.GestionarBitacora.Insertar(bitacora);
        }

        private void Bitacora(string accion, Usuario per)
        {
            BE.Bitacora bitacora = new BE.Bitacora();
            bitacora.Accion = accion;
            bitacora.Tabla = "UsuarioPermiso";
            bitacora.Dato = per.ToString();
            BLL.GestionarBitacora.Insertar(bitacora);
        }

        public List<string> GenerarListarPermisos()
        {
            ListaDefinida = new List<string>();
            ListaDefinida.Add("LinkUsuario");
            ListaDefinida.Add("LinkIdioma");
            ListaDefinida.Add("LinkRol");
            ListaDefinida.Add("LinkPermisos");
            ListaDefinida.Add("LinkRealizar");
            ListaDefinida.Add("LinkBitacora");
            ListaDefinida.Add("LinkDigitoVerificador");
            ListaDefinida.Add("LinkProductos");
            ListaDefinida.Add("LinkPrecios");
            ListaDefinida.Add("LinkImpresoras");
            ListaDefinida.Add("LinkMateriales");
            ListaDefinida.Add("LinkReportes");
            ListaDefinida.Add("LinkPedidos");
            ListaDefinida.Add("LinkEnvios");
            ListaDefinida.Add("LinkPanelCompras");
            ListaDefinida.Add("LinkRegistrarOrden");
            ListaDefinida.Add("LinkReporteOrden");
            ListaDefinida.Add("LinkPrioridad");
            ListaDefinida.Add("LinkPresupuesto");
            ListaDefinida.Add("LinkPriorizacion");
            ListaDefinida.Add("LinkPanelPedidos");
            ListaDefinida.Add("LinkReportePresupuesto");
            return ListaDefinida;
        }
    }
}