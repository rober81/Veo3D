using System;

namespace BE
{
    [Serializable]
    public class Usuario : Persona, iDigitoVerificador
    {

        public string Login { get; set; }
        public string Correo { get; set; }
        public string Password { get; set; }
        public string NombreCompleto { get => $"{Apellido} {Nombre}"; }

        public string Identificador { get => Login; }

        public override string ToString()
        {
            return Login;
        }

    }
}