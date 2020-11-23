using System;

namespace BE
{
    public class Usuario : Persona, iDigitoVerificador
    {

        public string Login { get; set; }
        public string Correo { get; set; }
        public string Password { get; set; }
        public string Identificador { get => Login;}

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

        public string getID()
        {
            return Login;
        }
    }
}