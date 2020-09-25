using BE;
using DAL;
using System.Collections.Generic;

namespace BLL
{
    public class GestionarUsuario
    {
        public static BE.Usuario Login(Usuario usr)
        {
            return DAL.UsuarioMapper.Login(usr);
        }

        public static int Insertar(Usuario usr)
        {
            usr.Password = GestionarEncriptacion.Encriptar(usr.Password);
            int res = UsuarioMapper.Insertar(usr);
            //CalcularDVV();
            Bitacora("Insertar", usr);
            return res;
        }

        public static int Modificar(Usuario usr, bool yaEncriptado)
        {
            if (! yaEncriptado)
                usr.Password = GestionarEncriptacion.Encriptar(usr.Password);
            int res = UsuarioMapper.Modificar(usr);
            Bitacora("Modificar", usr);
            //CalcularDVV();
            return res;
        }

        public static List<Usuario> Listar()
        {
            return UsuarioMapper.Listar();
        }

        private static void Bitacora(string accion, Usuario param)
        {
            BE.Bitacora bitacora = new BE.Bitacora();
            bitacora.Accion = accion;
            bitacora.Tabla = "Usuario";
            bitacora.Dato = param.ToString();
            BLL.GestionarBitacora.Insertar(bitacora);
        }

        private static void CalcularDVV()
        {
            BE.DigitoVerificador digito = new BE.DigitoVerificador();
            digito.Tabla = "Usuario";
            List<BE.iDigitoVerificador> lista = new List<BE.iDigitoVerificador>();
            lista.AddRange(Listar());
            digito.DVV = GestionarDigitoVerificador.CalcularDVV(lista);
            DigitoVerificadorMapper.Modificar(digito);
        }
    }
}