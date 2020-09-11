using System;

namespace BE
{
    public class DigitoVerificador : iDigitoVerificador
    {
        public string Tabla { get; set; }
        public int DVH { get; set; }
        public int DVV { get; set; }

        public string getDVH()
        {
            return Tabla + DVV;
        }

        public string getID()
        {
            return Tabla;
        }
    }
}