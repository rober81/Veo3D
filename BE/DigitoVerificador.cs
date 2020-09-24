using System;

namespace BE
{
    public class DigitoVerificador : iDigitoVerificador
    {
        public string Tabla { get; set; }
        public string DVH { get; set; }
        public string DVV { get; set; }

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