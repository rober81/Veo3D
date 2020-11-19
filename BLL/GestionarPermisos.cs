using BE;
using DAL;
using System.Collections.Generic;
using System.Linq;

namespace BLL
{
    public class GestionarPermisos
    {
        readonly PermisoMapper mapper = new PermisoMapper();
        List<string> listaDefinida = null;

        public GestionarPermisos()
        {
            GenerarListarPermisos();
        }


        public List<Permiso> ListarPerfiles()
        {
            return mapper.ListarPermiso(); ;
        }

        public int Insertar(Permiso per)
        {
            int res = mapper.Guardar(per, 0);
            Bitacora("Insertar", per);
            return res;
        }

        public int Modificar(Permiso per)
        {
            int res = mapper.Modificar(per, 0);
            Bitacora("Modificar", per);
            return res;
        }

        public List<iPermiso> ListarUsuarioPermiso(Usuario usr)
        {
            List<iPermiso> lista = mapper.ListarUsuarioPermiso(usr);
            return lista;
        }

        public bool Buscar(List<iPermiso> permisos, string nombre)
        {
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

        public int InsertarUsuarioPerfil(Usuario usr, List<iPermiso> perfiles)
        {
            mapper.BorrarUsuarioPermiso(usr);
            int res = 0;
            foreach (var item in perfiles)
            {
                res += mapper.GuardarUsuarioPermiso(usr, item);
            }
            Bitacora("Insertar", usr);
            return res;
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
            listaDefinida = new List<string>();
            listaDefinida.Add("LinkUsuario");
            listaDefinida.Add("LinkIdioma");
            listaDefinida.Add("LinkRol");
            listaDefinida.Add("LinkPermisos");
            listaDefinida.Add("LinkRealizar");
            listaDefinida.Add("LinkBitacora");
            listaDefinida.Add("LinkDigitoVerificador");
            listaDefinida.Add("LinkProductos");
            listaDefinida.Add("LinkPrecios");
            listaDefinida.Add("LinkImpresoras");
            listaDefinida.Add("LinkMateriales");
            listaDefinida.Add("LinkReportes");
            listaDefinida.Add("LinkPedidos");
            listaDefinida.Add("LinkEnvios");
            listaDefinida.Add("LinkPanelCompras");
            listaDefinida.Add("LinkRegistrarOrden");
            listaDefinida.Add("LinkReporteOrden");
            listaDefinida.Add("LinkPrioridad");
            listaDefinida.Add("LinkPresupuesto");
            listaDefinida.Add("LinkPriorizacion");
            listaDefinida.Add("LinkPanelPedidos");
            listaDefinida.Add("LinkReportePresupuesto");
            return listaDefinida;
        }
    }
}