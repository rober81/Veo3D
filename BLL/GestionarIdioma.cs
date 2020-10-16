using BE;
using Google.Cloud.Translation.V2;
using System.Collections.Generic;
using Util;

namespace BLL
{
    public class GestionarIdioma
    {
        public BE.Idioma IdiomaSeleccionado { get; private set; }
        private static GestionarIdioma _instancia = null;
        private TranslationClient client;

        private GestionarIdioma() {
            /*
            client = new TranslationClientBuilder
            {
                JsonCredentials = @"{
                  ""type"": ""service_account"",
                  ""project_id"": ""veo3d-292606"",
                  ""private_key_id"": ""1e2a5b982bd10ea3a6be9a7d2af9f39fdc0cf41d"",
                  ""private_key"": ""-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCNCDN1T7IovYJm\nU2FGhUMqaHz6EGXIHKtr8IDum903z4okOF5MsAWm8u1K3PgZjRoZD/fetBmZVtFu\nVIEj1yjONN1Lm9a9T784FPAxWaSC9dK4F0yyCK1bzEu0q8tv6uMdJQ8OMFZFsRDE\ncdYZzu4VphO9wiDElzoX3NkHstM32/Ap9tPHB3UqLU27GIEMvr85KqOWplpEwQ5D\nV8lcckAJHPUMAUYcAhgHN7ey24qWimVfqrhPRMcV22P3ptT3teD62j1jVwII0iO1\nfErNA7+GNhJ2MWWPqV6TPijX4ILNAt8VLLRRcJAp8fAsn/9JJBrFCcaLLvWtVRLC\n7yT6v8FTAgMBAAECggEAKb03nYyMqcoMgcRDkd921WI/OrMHrIXvpe5z+ipe+lmO\nBNI59nBR++sBl5p2Qvmjs68qKNsciGlNal3QKo9PIFg89leU4kpryWlI/RIOwkOG\nrb0XkclHpVd9QGdnuiPGO6XwIr7jiZSx5bHbL6Ayjm2sggimMgifxNgz0zd1k54v\nj2il3K7r+W0jIigo4+9M90ARxPb5YZwbXwuNIoTFNHIGrN/IZLNgvB9Hbby4UbfA\nEKY4cIpQshTzy/4jEESG8en8aaV8UVDz8RbIsdut/h61gcmU43476vCMMBgF19xr\n33ev8H9h1Sxv+uBvJBt7wqafvG26QhWx2hjbYfNP4QKBgQDGQNootSMKbViXaJkj\noaNYD5Y6DlNJV1lVPstUcyX2jdKz3elON9yKVdGCLM6PuW8Zm6zrtIFJrA/ZOf+4\nNU2kL0bh+pMQsSwMkn3P5a3G9yAS7Y6JaC+5BDTAEs8SP7TE1tarz7yDMh/q+F8h\nw2F4EbWNZfc5fKTmj6+GnKhIFQKBgQC2HIft/uA8zUm//jG3iYObcq+xh8lmclJh\nfvC1+r9vbLqc2HtCAhWJr+u7ZZSHXsTLk1ZtOLAmnTHwMv07gb1MtPeivUOgXyD6\np1BJsNjZpoRy74tiSmJEPkFUfQBBg4IbxqgwarGk5ykCoFFqh3fGXIDol/kw68rI\nKFZM+W4VxwKBgCKQd/iU7BELU2DCacCek73sqcJhcP/ebMLB+e01Ti8YNt4JGH38\nm0S7BZXufezs5YPPcmx9wfS4POMgi4bwNCMl4vPPHgjQ+t8OQ0UVxCBmQX9LT4iB\nU6CsLQ43uUZzOO8AjdjSlQlCmfH7b4qRZ9LpM3/9gQbSxmU0M+QCOAypAoGAP6cr\nT+GliTsMCyKTSB61tJDankfi+n79EnznMARsA0tS0t3L/19xHcYytDamOsbCLJHc\nRKLq1yRcvyNjZfhMLVKXt/dFevmlMldm9crtkO3mH7Jg2sM7I7VK6ngircOEp6bB\nROMWIph1uihFLOIa2Gee2y27eQEByQJoX9FTTCMCgYAXP5OlLEpBtkXGyp74s/HI\nlVQupC983mH7wrqItVk99VrHAs1l/L/XBdHRfk551g2eot+5bxZv+yJInYCUSbGp\nSgK7XmbbG21JgwdqpUbrkMrn7EYI8LEB8lSDrL/9uIH6nXyu1yUOi3zdwot7Q6Fg\nbqAjK3MCiKrj5/1ENQjk1w==\n-----END PRIVATE KEY-----\n"",
                  ""client_email"": ""traducir@veo3d-292606.iam.gserviceaccount.com"",
                  ""client_id"": ""117263169605524974002"",
                  ""auth_uri"": ""https://accounts.google.com/o/oauth2/auth"",
                  ""token_uri"": ""https://oauth2.googleapis.com/token"",
                  ""auth_provider_x509_cert_url"": ""https://www.googleapis.com/oauth2/v1/certs"",
                  ""client_x509_cert_url"": ""https://www.googleapis.com/robot/v1/metadata/x509/traducir%40veo3d-292606.iam.gserviceaccount.com""
                }"
            }.Build();
            */
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
                nuevo.Detalle.Add(item.Key, item.Value);
            }
            return nuevo;
        }

        public string TranslateText(string texto, string idioma)
        {
            var response = client.TranslateText(
                text: texto,
                targetLanguage: idioma,
                sourceLanguage: "es");
            return response.TranslatedText;
        }

    }
}
