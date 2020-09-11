using BE;
using DAL;
using System.Collections.Generic;
using System.Linq;

namespace BLL
{
    public class GestionarRolesPerfiles
    {
        public List<iPermisos> arbol { get; set; }
        List<Perfiles> lista = PerfilMapper.ListarPerfiles();

        public GestionarRolesPerfiles()
        {
            arbol = new List<iPermisos>();
            armarArbol();
        }

        private void armarArbol()
        {
            foreach (Perfiles item in lista)
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
            foreach (Perfiles item in lista)
            {
                if (item.Padre == null || item.Padre.Id == punto.Id)
                {
                    Perfil perfil = new Perfil();
                    perfil.Id = item.Id;
                    perfil.Nombre = item.Nombre;
                    punto.Add(perfil);
                }

            }
        }

        public List<Perfiles> ListarPerfiles()
        {
            lista = PerfilMapper.ListarPerfiles();
            return lista;
        }

        public List<Perfiles> ListarPerfilesPadres()
        {
            var filtro = from item in lista
                         where item.Padre == null
                         select item;
            return filtro.ToList<Perfiles>();
        }

        public int Insertar(Perfiles param)
        {
            int res = PerfilMapper.Insertar(param);
            Bitacora("Insertar", param);
            return res;
        }

        public int Modificar(Perfiles param)
        {
            int res = PerfilMapper.Modificar(param);
            Bitacora("Modificar", param);
            return res;
        }

        public List<iPermisos> ListarUsuarioPerfil(Usuario param)
        {
            List<Perfiles> lista = PerfilMapper.ListarUsuarioPerfil(param);
            List<iPermisos> permisosDelUsuario = new List<iPermisos>();
            foreach (Perfiles item in lista)
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
            PerfilMapper.BorrarUsuarioPerfil(param);
            int res = 0;
            foreach ( var item in perfiles)
            {
                res += PerfilMapper.InsertarUsuarioPerfil(param, item);
            }
            Bitacora("Insertar", param);
            return res;
        }

        private void Bitacora(string accion, Perfiles param)
        {
            BE.Bitacora bitacora = new BE.Bitacora();
            bitacora.Accion = accion;
            bitacora.Tabla = "Perfil";
            bitacora.Dato = param.ToString();
            BLL.GestionarBitacora.Insertar(bitacora);
        }

        private void Bitacora(string accion, Usuario param)
        {
            BE.Bitacora bitacora = new BE.Bitacora();
            bitacora.Accion = accion;
            bitacora.Tabla = "UsuarioPerfil";
            bitacora.Dato = param.ToString();
            BLL.GestionarBitacora.Insertar(bitacora);
        }

        public List<string> ListarPermisos()
        {
            List<string> lista = new List<string>();
            lista.Add("MenuPacienteAlta");
            lista.Add("MenuPacienteModificar");
            lista.Add("MenuConsulta");
            lista.Add("MenuEntrenamientos");
            lista.Add("MenuEjercicios");
            lista.Add("MenuEntrenamientos");
            lista.Add("MenuPatologias");
            lista.Add("MenuTratamientos");
            lista.Add("MenuUsuarios");
            lista.Add("MenuRoles");
            lista.Add("MenuPerfiles");
            lista.Add("MenuIdioma");
            lista.Add("MenuBitacora");
            lista.Add("MenuCopiaSeguridad");
            lista.Add("MenuDigitoVerificador");
            lista.Add("MenuPacienteAlta");
            lista.Add("MenuPacienteModificar");
            return lista;
        }
    }
}