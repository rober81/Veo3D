﻿using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using BE;

namespace DAL
{
    public class UsuarioMapper
    {
        public static string Tabla = "Usuario";

        public static Usuario Login(Usuario unUsuario)
        {
            Usuario obj = null;
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@usuario", unUsuario.Login);
            parametros[1] = new SqlParameter("@pass", unUsuario.Password);
            DataTable tabla = SqlHelper.getInstance().leer(Tabla + "_login", parametros);
            foreach (DataRow item in tabla.Rows) {
                obj = new Usuario();
                obj.Login = item["usuario"].ToString();
                obj.Password = item["password"].ToString();
                obj.Nombre = item["nombre"].ToString();
                obj.Apellido = item["apellido"].ToString();
                obj.Correo = item["correo"].ToString();
                obj.Dni = int.Parse(item["dni"].ToString());
                obj.DVH = int.Parse(item["Dvh"].ToString());
            }
            return obj;
        }

        public static List<Usuario> Listar()
        {
            Usuario obj = null;
            List<Usuario> lista = new List<Usuario>();
            DataTable tabla = SqlHelper.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Usuario();
                obj.Login = item["usuario"].ToString();
                obj.Password = item["password"].ToString();
                obj.Nombre = item["nombre"].ToString();
                obj.Apellido = item["apellido"].ToString();
                obj.Correo = item["correo"].ToString();
                obj.Dni = int.Parse(item["dni"].ToString());
                obj.DVH = int.Parse(item["Dvh"].ToString());
                lista.Add(obj);
            }
            return lista;
        }

        private static SqlParameter[] crearParametros(Usuario param)
        {
            SqlParameter[] parametros = new SqlParameter[7];
            parametros[0] = new SqlParameter("@usuario", param.Login);
            parametros[1] = new SqlParameter("@pass", param.Password);
            parametros[2] = new SqlParameter("@nombre", param.Nombre);
            parametros[3] = new SqlParameter("@apellido", param.Apellido);
            parametros[4] = new SqlParameter("@correo", param.Correo);
            parametros[5] = new SqlParameter("@dni", param.Dni);
            parametros[6] = new SqlParameter("@dvh", Util.DigitoVerificador.CalcularDV(param.getDVH()));
            return parametros;
        }

        public static int Insertar(Usuario param)
        {
            return SqlHelper.getInstance().escribir(Tabla + "_alta", crearParametros(param));
        }

        public static int Modificar(Usuario param)
        {
            return SqlHelper.getInstance().escribir(Tabla + "_modificar", crearParametros(param));
        }
    }
}