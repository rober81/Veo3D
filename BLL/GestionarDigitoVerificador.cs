using Newtonsoft.Json;
using System;
using BE;
using System.Collections.Generic;
using System.Security.Cryptography;
using DAL;
using System.Linq;

namespace BLL
{
    public class GestionarDigitoVerificador
    {
        public List<DigitoVerificador> Listar()
        {
            DigitoVerificadorMapper maper = new DigitoVerificadorMapper();
            List<DigitoVerificador> lista = maper.Listar();
            foreach (var item in lista)
            {
                item.Estado = VerificarDigitoVerificador(item.Tabla) ? "Correcto" : "Error";
            }
            return lista;
        }

        public List<string> ListarTablas()
        {
            List<string> lista = new List<string>();
            lista.Add("Compra");
            lista.Add("Producto");
            lista.Add("Usuario");
            lista.Add("Impresora");
            return lista;
        }

        public string CalcularDigito(Object obj)
        {
            string jsonString;
            jsonString = JsonConvert.SerializeObject(obj);
            return getSHA1(jsonString);
        }

        public static string getSHA1(string param)
        {
            SHA1CryptoServiceProvider sha1Obj = new SHA1CryptoServiceProvider();
            byte[] hacerHash = System.Text.Encoding.ASCII.GetBytes(param);
            hacerHash = sha1Obj.ComputeHash(hacerHash);
            string resultado = "";
            foreach (byte b in hacerHash)
                resultado += b.ToString("x2");
            return resultado;
        }

        public DigitoVerificador GenerarDigitoVerificador(string tabla)
        {
            List<iDigitoVerificador> lista = null;
            if ("Compra".Equals(tabla))
            {
                CompraBLL cbll = new CompraBLL();
                lista = cbll.Listar().ToList<iDigitoVerificador>();
            }
            if ("Producto".Equals(tabla))
            {
                ProductoBLL pbll = new ProductoBLL();
                lista = pbll.Listar().ToList<iDigitoVerificador>();
            }
            if ("Usuario".Equals(tabla))
            {
                lista = GestionarUsuario.Listar().ToList<iDigitoVerificador>();            }
            if ("Impresora".Equals(tabla))
            {
                ImpresoraBLL ibll = new ImpresoraBLL();
                lista = ibll.Listar().ToList<iDigitoVerificador>();
            }

            DigitoVerificador dv = new DigitoVerificador();
            dv.Tabla = tabla;
            dv.DVV = CalcularDigito(lista);
            dv.Detalle = new List<DigitoVerificadorDetalle>();
            foreach (var item in lista)
            {
                DigitoVerificadorDetalle dvd = new DigitoVerificadorDetalle();
                dvd.Tabla = tabla;
                dvd.IdTabla = item.Identificador;
                dvd.DVH = CalcularDigito(item);
                dv.Detalle.Add(dvd);
            }
            return dv;
        }

        public int GuardarDigitoVerificador(string tabla)
        {
            DigitoVerificador dv = GenerarDigitoVerificador(tabla);
            DigitoVerificadorMapper mapper = new DigitoVerificadorMapper();
            return mapper.Guardar(dv);
        }

        public bool VerificarDigitoVerificador(string tabla)
        {
            DigitoVerificador calculado = GenerarDigitoVerificador(tabla);
            DigitoVerificadorMapper mapper = new DigitoVerificadorMapper();
            bool respuesta = true;
            try
            {
                DigitoVerificador leido = mapper.Buscar(tabla);
                if (!calculado.DVV.Equals(leido.DVV))
                {
                    respuesta = false;
                }
                foreach (var itemCalculado in calculado.Detalle)
                {
                    foreach (var itemLeido in leido.Detalle)
                    {
                        if (itemCalculado.Tabla.Equals(itemLeido.Tabla) && itemCalculado.IdTabla.Equals(itemLeido.IdTabla))
                        {
                            if (!itemCalculado.DVH.Equals(itemLeido.DVH))
                            {
                                respuesta = false;
                            }
                        }
                    }
                }
                return respuesta;
            }
            catch (Exception)
            {
                return false;
            }
        }


        public string VerificarDigitoVerificadorLog(string tabla)
        {
                DigitoVerificador calculado = GenerarDigitoVerificador(tabla);
                DigitoVerificadorMapper mapper = new DigitoVerificadorMapper();
                string respuesta = "Comenzando Verificación:\n";
            try
            {
                DigitoVerificador leido = mapper.Buscar(tabla);
                respuesta += $"    Controlando Tabla: {tabla}\n";
                if (!calculado.DVV.Equals(leido.DVV))
                {
                    respuesta += "        ERROR Digito Verificador Vertical Distinto\n";
                    respuesta += $"            Calculado={calculado.DVV} Cantidad Registros:{calculado.Detalle.Count}\n";
                    respuesta += $"            Guardado={leido.DVV} Cantidad Registros:{leido.Detalle.Count}\n";
                }
                else
                {
                    respuesta += "    Digito Verificador Vertical Ok\n";
                }
                respuesta += "    Verificando Digito Horizontal:\n";
                foreach (var itemLeido in leido.Detalle) 
                {
                    foreach  (var itemCalculado in calculado.Detalle)
                        {
                        if (itemCalculado.Tabla.Equals(itemLeido.Tabla) && itemCalculado.IdTabla.Equals(itemLeido.IdTabla))
                        {
                            respuesta += $"        Controlando registro:{itemCalculado.IdTabla}";
                            if (! itemCalculado.DVH.Equals(itemLeido.DVH))
                            {
                                respuesta += $"\n            ERROR DVH Calculado: {itemCalculado.DVH}\n";
                                respuesta += $"            ERROR DVH Guardado: {itemCalculado.DVH}\n";
                            } else
                            {
                                respuesta += $" Ok.\n";
                            }
                        }
                    }
                }
                respuesta += "Finalizado.";
                return respuesta;

            }
            catch (Exception)
            {
                respuesta += "\nSe produjo un error en el proceso.";
                return respuesta;
            }
        }

    }
}