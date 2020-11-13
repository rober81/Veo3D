﻿using BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class CompraMapper
    {
        public static string Tabla = "Compra";

        public static List<Compra> Listar()
        {
            Compra obj = null;
            List<Compra> lista = new List<Compra>();
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_leer", null);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Compra();
                obj.Personalizado = new ProductoPersonalizado(); ;
                obj.Id = int.Parse(item["id"].ToString());
                obj.Personalizado.AnchoMontura = item["anchomontura"].ToString();
                obj.Personalizado.Puente = item["puente"].ToString();
                obj.Personalizado.AnchoCristales = item["anchocristales"].ToString();
                obj.Personalizado.AlturaCristales = item["alturacristales"].ToString();
                obj.Personalizado.LongitudPatillas = item["longitudpatillas"].ToString();
                obj.Calle = item["calle"].ToString();
                obj.Puerta = item["puerta"].ToString();
                obj.Depto = item["depto"].ToString();
                obj.Localidad = item["localidad"].ToString();
                obj.Provincia = item["provincia"].ToString();
                obj.Estado = item["estado"].ToString();
                Producto param = new Producto();
                param.Id = int.Parse(item["producto"].ToString());
                obj.Personalizado.Producto = ProductoMapper.Buscar(param);
                lista.Add(obj);
            }
            return lista;
        }

        public static Compra Buscar(Compra param)
        {
            Compra obj = null;
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", param.Id);
            DataTable tabla = Acceso.getInstance().leer(Tabla + "_buscar", parametros);
            foreach (DataRow item in tabla.Rows)
            {
                obj = new Compra();
                obj.Personalizado = new ProductoPersonalizado(); ;
                obj.Id = int.Parse(item["id"].ToString());
                obj.Personalizado.AnchoMontura = item["anchomontura"].ToString();
                obj.Personalizado.Puente = item["puente"].ToString();
                obj.Personalizado.AnchoCristales = item["anchocristales"].ToString();
                obj.Personalizado.AlturaCristales = item["alturacristales"].ToString();
                obj.Personalizado.LongitudPatillas = item["longitudpatillas"].ToString();
                obj.Calle = item["calle"].ToString();
                obj.Puerta = item["puerta"].ToString();
                obj.Depto = item["depto"].ToString();
                obj.Localidad = item["localidad"].ToString();
                obj.Provincia = item["provincia"].ToString();
                obj.Estado = item["estado"].ToString();
                Producto paramp = new Producto();
                paramp.Id = int.Parse(item["producto"].ToString());
                obj.Personalizado.Producto = ProductoMapper.Buscar(paramp);
            }
            return obj;
        }

        private static SqlParameter[] crearParametros(Compra param)
        {
            SqlParameter[] parametros = new SqlParameter[13];
            parametros[0] = new SqlParameter("@id", param.Id);
            parametros[1] = new SqlParameter("@producto", param.Personalizado.Producto.Id);
            parametros[2] = new SqlParameter("@anchomontura", param.Personalizado.AnchoMontura);
            parametros[3] = new SqlParameter("@puente", param.Personalizado.Puente);
            parametros[4] = new SqlParameter("@anchocristales", param.Personalizado.AnchoCristales);
            parametros[5] = new SqlParameter("@alturacristales", param.Personalizado.AlturaCristales);
            parametros[6] = new SqlParameter("@longitudpatillas", param.Personalizado.LongitudPatillas);
            parametros[7] = new SqlParameter("@calle", param.Calle);
            parametros[8] = new SqlParameter("@puerta", param.Puerta);
            parametros[9] = new SqlParameter("@depto", param.Depto);
            parametros[10] = new SqlParameter("@localidad", param.Localidad);
            parametros[11] = new SqlParameter("@provincia", param.Provincia);
            parametros[12] = new SqlParameter("@estado", param.Estado);
            return parametros;
        }

        public static int Guardar(Compra param)
        {
            return Acceso.getInstance().escribir(Tabla + "_alta", crearParametros(param));
        }

        public static int Modificar(Compra param)
        {
            return Acceso.getInstance().escribir(Tabla + "_modificar", crearParametros(param));
        }

        public static int Baja(Compra param)
        {
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = new SqlParameter("@id", param.Id);
            return Acceso.getInstance().escribir(Tabla + "_baja", parametros);
        }
    }
}
