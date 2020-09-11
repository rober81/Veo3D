namespace BE
{
    public class IdiomaDetalle
    {
        public string Idioma { get; set; }
        public string Clave { get; set; }
        public string Texto { get; set; }

        public override string ToString()
        {
            return Idioma +" " + Clave + " " + Texto;
        }
    }
}