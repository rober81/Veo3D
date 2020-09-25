using System;
namespace BE
{
    public class Bitacora
    {
        public Bitacora()
        {
            this.Fecha = DateTime.Now;
            this.Tabla = "";
            this.Dato = "";
        }

        public DateTime Fecha { get; set; }

        public string FechaEjecucion => stringFecha();

        public string stringFecha()
        {
            return this.Fecha.ToString("d");
        }

        public string UsuarioBitacora => stringUSR();

        public string stringUSR()
        {
            return this.Usuario.Login;
        }
        public Usuario Usuario { get; set; }
        public string Tabla { get; set; }
        public string Accion { get; set; }
        public string Dato { get; set; }


    }
}