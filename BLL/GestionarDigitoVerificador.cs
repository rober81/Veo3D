using System;
using System.Collections.Generic;

namespace BLL
{
    public class GestionarDigitoVerificador
    {
        public int calcularDigito(BE.iDigitoVerificador mensaje)
        {
            return Util.DigitoVerificador.CalcularDV(mensaje.getDVH());
        }

        protected string VerificarDVHLog(List<BE.iDigitoVerificador> lista, string tabla)
        {
            string resultado = Traducir("msgComprobando") + tabla + Environment.NewLine;
            int cantidad = 0;
            foreach (BE.iDigitoVerificador item in lista)
            {
                if (! calcularDigito(item).Equals(item.DVH))
                {
                    resultado += Traducir("msgErrorRegistro") + item.getID() + Environment.NewLine;
                }
                cantidad++;
            }
            resultado += Traducir("msgRegistrosComprobados") + cantidad + Environment.NewLine + Environment.NewLine;
            return resultado;
        }

        protected int VerificarDVH(List<BE.iDigitoVerificador> lista, string tabla)
        {
            int cantidad = 0;
            foreach (BE.iDigitoVerificador item in lista)
            {
                if (!calcularDigito(item).Equals(item.DVH))
                {
                    cantidad++;
                }
            }
            return cantidad;
        }

        public string VerificarDVVLog(List<BE.iDigitoVerificador> lista, string tabla)
        {
            string resultado = string.Empty;
            int cantidad = 0;
            List <BE.DigitoVerificador> listaDv = DAL.DigitoVerificadorMapper.Listar();
            foreach (BE.DigitoVerificador item in listaDv)
            {
                if (item.Tabla.Equals(tabla))
                {
                    int dvv = CalcularDVV(lista);
                    if (! item.DVV.Equals(dvv))
                        resultado += Traducir("msgErrorRegistro") + item.getID() + Environment.NewLine;
                    else
                        resultado += Traducir("msgRegistro") + item.getID() + " Ok" + Environment.NewLine;
                }
                cantidad++;
            }
            resultado += Traducir("msgRegistrosComprobados") + cantidad + Environment.NewLine + Environment.NewLine;
            return resultado;
        }

        public int VerificarDVV(List<BE.iDigitoVerificador> lista, string tabla)
        {
            int cantidad = 0;
            List<BE.DigitoVerificador> listaDv = DAL.DigitoVerificadorMapper.Listar();
            foreach (BE.DigitoVerificador item in listaDv)
            {
                if (item.Tabla.Equals(tabla))
                {
                    int dvv = CalcularDVV(lista);
                    if (!item.DVV.Equals(dvv))
                        cantidad++;
                }
            }
            return cantidad;
        }

        public static int CalcularDVV(List<BE.iDigitoVerificador> lista)
        {
            string cadena = string.Empty;
            foreach (var item in lista)
            {
                cadena += item.DVH;
            }
            return Util.DigitoVerificador.CalcularDV(cadena);
        }

        protected string Traducir(string texto)
        {
            return BLL.GestionarIdioma.getInstance().getTexto(texto);
        }

    }
}