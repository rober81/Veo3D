using System;
using System.Collections.Generic;
using System.Linq;

namespace BLL
{
    public class GestionarBitacora
    {
        List<BE.Bitacora> lista;

        public GestionarBitacora()
        {
            lista = DAL.BitacoraMapper.Listar(); ;
        }

        public List<BE.Bitacora> Listar()
        {
            return lista;
        }

        public List<BE.Bitacora> ListarFecha(DateTime desde, DateTime hasta)
        { 
            IEnumerable<BE.Bitacora> temp = from bitacora in lista
                                            where bitacora.Fecha > desde
                                            && bitacora.Fecha < hasta
                                            select bitacora;
            return temp.ToList<BE.Bitacora>();
        }

        public List<BE.Bitacora> ListarUsuario(BE.Usuario usr)
        {
            IEnumerable<BE.Bitacora> temp = from bitacora in lista
                                            where bitacora.Usuario.Login.Equals(usr.Login)
                                            select bitacora;
            return temp.ToList<BE.Bitacora>();
        }

        public List<BE.Bitacora> ListarFechaUsuario(DateTime desde, DateTime hasta, BE.Usuario usr)
        {
            IEnumerable<BE.Bitacora> temp = from bitacora in lista
                                            where bitacora.Fecha > desde
                                            && bitacora.Fecha < hasta
                                            && bitacora.Usuario.Login.Equals(usr.Login)
                                            select bitacora;
            return temp.ToList<BE.Bitacora>();
        }

        public static void Insertar(BE.Bitacora bitacora)
        {
            bitacora.Usuario = GestionarSesion.getInstance().Usuario;
            int filas = DAL.BitacoraMapper.Insertar(bitacora);
            if (filas == 0)
            {
                GestionarError.loguear("Error al guardar la Bitacora");
            }
        }
    }
}
