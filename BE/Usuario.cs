using System;

namespace BE
{
    public class Usuario : Persona, iDigitoVerificador
    {

        public string Login { get; set; }
        public string Correo { get; set; }
        public string Password { get; set; }
        public string NombreCompleto { get => $"{Apellido} {Nombre}"; }

        public string Identificador { get => Login; }

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

    }
}