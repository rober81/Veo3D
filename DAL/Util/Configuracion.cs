using BE;

namespace Util
{
    public class Configuracion
    {
        public string servidor { get; set; }
        public string aplicacionDB { get; set; }
        public string bitacoraDB { get; set; }
        public Idioma idioma { get; set; }

        private static Configuracion instancia = null;

        public static Configuracion getInstance()
        {
            if (instancia == null)
            {
                instancia = new Configuracion();
                instancia.aplicacionDB = "Veo3D";
                instancia.bitacoraDB = "Bitacora";
                instancia.idioma = new BE.Idioma("Español");
                instancia.servidor = "SQLEXPRESS";
            }
            return instancia;
        }

        private Configuracion()
        {

        }
    }
}
