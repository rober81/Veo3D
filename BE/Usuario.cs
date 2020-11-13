using System;

namespace BE {
	public class Usuario : Persona, iDigitoVerificador
    {

        public string Login { get; set; }
        public string Correo { get; set; }
        public string Password { get; set; }
        public string DVH { get; set; }

        public Usuario()
        {
        }

        public Usuario(string login)
        {
            this.Login = login;
        }

        public override string ToString()
        {
            return Login;
        }

        public string getDVH()
        {
            return Login + Password + Nombre + Apellido + Dni + Correo;
        }

        public string getID()
        {
            return Login;
        }
    }
}