using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BE;

namespace BLL
{
    public class GestionarSesion
    {
        private BE.Usuario usuario;
        private List<BE.iPermiso> permisos = new List<BE.iPermiso>();

        private static GestionarSesion _instancia = null;

        private GestionarSesion() { }

        public static GestionarSesion getInstance()
        {
            if (_instancia == null)
                _instancia = new GestionarSesion();
            return _instancia;
        }

        public Usuario Usuario
        {
            get
            {
                return this.usuario;
            }
        }

        public Boolean iniciarSesion(String paramUser, String paramPass)
        {
            BE.Usuario usr = new BE.Usuario();
            usr.Login = paramUser;
            usr.Password = GestionarEncriptacion.Encriptar(paramPass);
            this.usuario = GestionarUsuario.Login(usr);
            if (this.usuario != null)
            {
                BE.Bitacora bitacora = new Bitacora();
                bitacora.Usuario = this.usuario;
                bitacora.Accion = "Inicia Sesion";
                GestionarBitacora.Insertar(bitacora);
                //GestionarRolesPerfiles roles = new GestionarRolesPerfiles();
                //permisos = roles.ListarUsuarioPerfil(this.usuario);
                return true;
            } else
            {
                return false;
            }
        }

        public void cerrarSesion()
        {
            if (this.usuario != null) //al cambiar de usuario y cerrar es null
            {
            BE.Bitacora bitacora = new Bitacora();
            bitacora.Usuario = this.usuario;
            bitacora.Accion = "Cierra Sesion";
            GestionarBitacora.Insertar(bitacora);
            this.usuario = null;
            }
        }

        public bool VerificarPermisos(string permiso)
        {
            bool resultado = permisos.Where(p => p.Hijos.Any(h => h.Nombre.Equals(permiso))).ToList().Count > 0;
            return resultado;
        }
    }
}