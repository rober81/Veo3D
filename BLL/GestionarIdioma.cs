using BE;
using Google.Cloud.Translation.V2;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Script.Serialization;
using Util;

namespace BLL
{
    public class GestionarIdioma
    {
        public BE.Idioma IdiomaSeleccionado { get; private set; }
        private static GestionarIdioma _instancia = null;

        private GestionarIdioma() {
        }

        public static GestionarIdioma getInstance()
        {
            if (_instancia == null)
                _instancia = new GestionarIdioma();
            return _instancia;
        }

        public List<BE.Idioma> Listar()
        {
            return DAL.IdiomaMapper.Listar();
        }

        public void Cargar(BE.Idioma unIdioma)
        {
            DAL.IdiomaMapper.CargarDetalle(unIdioma);
        }

        public void CambiarIdioma(BE.Idioma unIdioma)
        {
            Cargar(unIdioma);
            IdiomaSeleccionado = unIdioma;
            Configuracion.getInstance().idioma = new BE.Idioma(unIdioma.Nombre);
        }

        public string GetTexto (string clave)
        {
            string resultado;
            try
            {
                resultado = IdiomaSeleccionado.Detalle[clave];
            }
            catch (KeyNotFoundException)
            {
                resultado = string.Empty;
                //Util.Log.Error("Falta traducir idioma:" + IdiomaSeleccionado.Nombre + " clave:" + clave);
            }
            return resultado;
        }

        public int insertar(Idioma param)
        {
            Bitacora("Insertar", param);
            int respuesta = DAL.IdiomaMapper.Insertar(param);
            return respuesta;
        }

        public int insertarDetalle(IdiomaDetalle unDetalle)
        {
            Bitacora("Insertar", unDetalle);
            int respuesta = DAL.IdiomaMapper.InsertarDetalle(unDetalle);
            return respuesta;
        }

        private void Bitacora(string accion, Idioma param)
        {
            BE.Bitacora bitacora = new BE.Bitacora();
            bitacora.Accion = accion;
            bitacora.Tabla = "Idioma";
            bitacora.Dato = param.ToString();
            BLL.GestionarBitacora.Insertar(bitacora);
        }

        private void Bitacora(string accion, IdiomaDetalle param)
        {
            BE.Bitacora bitacora = new BE.Bitacora();
            bitacora.Accion = accion;
            bitacora.Tabla = "IdiomaDetalle";
            bitacora.Dato = param.ToString();
            BLL.GestionarBitacora.Insertar(bitacora);
        }

        public Idioma CrearIdioma(string nombre,string codigoIdioma)
        {
            Idioma nuevo = new Idioma(nombre);
            nuevo.Detalle = new Dictionary<string, string>();
            Idioma original = new Idioma("Español");
            Cargar(original);
            foreach (var item in original.Detalle)
            {
                nuevo.Detalle.Add(item.Key, TranslateText(nombre, codigoIdioma));
                return nuevo;
            }
            return nuevo;
        }

        public string TranslateText(string texto, string idioma)
        {
            JavaScriptSerializer json = new JavaScriptSerializer();
            HttpClient httpClient = new HttpClient();
            string traduccion = string.Empty;

            try
            {
                string url = String.Format("https://translate.googleapis.com/translate_a/single?client=gtx&sl={0}&tl={1}&dt=t&q={2}","es", idioma, Uri.EscapeUriString(texto));
                string respuestaJson = httpClient.GetStringAsync(url).Result;
                var jsonData = json.Deserialize<List<dynamic>>(respuestaJson);
                var items = jsonData[0];

                foreach (object item in items)
                {
                    IEnumerable translationLineObject = item as IEnumerable;
                    IEnumerator translationLineString = translationLineObject.GetEnumerator();
                    translationLineString.MoveNext();
                    traduccion += string.Format(" {0}", Convert.ToString(translationLineString.Current));
                }

                if (traduccion.Length > 1)
                    traduccion = traduccion.Substring(1);
            }
            catch (Exception e)
            {
                GestionarError.loguear(e.ToString());
            }
            return traduccion;
        }

    }
}
