using BE;
using DAL;
using System.Collections.Generic;
using System.Linq;

namespace BLL
{
    public class GestionarPermisos
    {
        public List<iPermisos> arbol { get; set; }
        List<Permisos> lista = PermisoMapper.ListarPermisos();

        public GestionarPermisos()
        {
            arbol = new List<iPermisos>();
            armarArbol();
        }

        private void armarArbol()
        {
            foreach (Permisos item in lista)
            {
                if (item.Padre == null || item.Padre.Id == 0)
                {
                    Rol rol = new Rol();
                    rol.Id = item.Id;
                    rol.Nombre = item.Nombre;
                    arbol.Add(rol);
                    Buscar(rol);
                }
            }
        }

        private void Buscar(Rol punto)
        {
            foreach (Permisos item in lista)
            {
                if (item.Padre == null || item.Padre.Id == punto.Id)
                {
                    Permiso perfil = new Permiso();
                    perfil.Id = item.Id;
                    perfil.Nombre = item.Nombre;
                    punto.Add(perfil);
                }

            }
        }

        public List<Permisos> ListarPerfiles()
        {
            lista = PermisoMapper.ListarPermisos();
            return lista;
        }

        public List<Permisos> ListarPerfilesPadres()
        {
            var filtro = from item in lista
                         where item.Padre == null
                         select item;
            return filtro.ToList<Permisos>();
        }

        public int Insertar(Permisos param)
        {
            int res = PermisoMapper.Insertar(param);
            Bitacora("Insertar", param);
            return res;
        }

        public int Modificar(Permisos param)
        {
            int res = PermisoMapper.Modificar(param);
            Bitacora("Modificar", param);
            return res;
        }

        public List<iPermisos> ListarUsuarioPermiso(Usuario param)
        {
            List<Permisos> lista = PermisoMapper.ListarUsuarioPermiso(param);
            List<iPermisos> permisosDelUsuario = new List<iPermisos>();
            foreach (Permisos item in lista)
            {
                foreach (iPermisos item2 in arbol)
                {
                    if (item.Id == item2.Id)
                        permisosDelUsuario.Add(item2);
                }
            }
            return permisosDelUsuario;
        }

        public int InsertarUsuarioPerfil(Usuario param, List<iPermisos> perfiles)
        {
            PermisoMapper.BorrarUsuarioPermiso(param);
            int res = 0;
            foreach ( var item in perfiles)
            {
                res += PermisoMapper.InsertarUsuarioPermiso(param, item);
            }
            Bitacora("Insertar", param);
            return res;
        }

        private void Bitacora(string accion, Permisos param)
        {
            BE.Bitacora bitacora = new BE.Bitacora();
            bitacora.Accion = accion;
            bitacora.Tabla = "Permiso";
            bitacora.Dato = param.ToString();
            BLL.GestionarBitacora.Insertar(bitacora);
        }

        private void Bitacora(string accion, Usuario param)
        {
            BE.Bitacora bitacora = new BE.Bitacora();
            bitacora.Accion = accion;
            bitacora.Tabla = "UsuarioPermiso";
            bitacora.Dato = param.ToString();
            BLL.GestionarBitacora.Insertar(bitacora);
        }

        public List<string> ListarPermisos()
        {
            List<string> lista = new List<string>();
            lista.Add("LinkUsuario");
            lista.Add("LinkIdioma");
            lista.Add("LinkRol");
            lista.Add("LinkPermisos");
            lista.Add("LinkRealizar");
            lista.Add("LinkBitacora");
            lista.Add("LinkDigitoVerificador");
            lista.Add("LinkLogErrores");
            lista.Add("LinkProductos");
            lista.Add("LinkPrecios");
            lista.Add("LinkImpresoras");
            lista.Add("LinkMateriales");
            lista.Add("LinkReportes");
            lista.Add("LinkPedidos");
            lista.Add("LinkEnvios");
            lista.Add("LinkPanelCompras");
            lista.Add("LinkRegistrarOrden");
            lista.Add("LinkReporteOrden");
            lista.Add("LinkPrioridad");
            lista.Add("LinkPresupuesto");
            lista.Add("LinkReportePresupuesto");
            lista.Add("LinkPriorizacion");
            lista.Add("LinkPanelPedidos");
            return lista;
        }
    }
}