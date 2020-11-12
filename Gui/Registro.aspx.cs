using BLL;
using Gui.controles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LblContrasenia.Txt.TextMode = TextBoxMode.Password;
            LblContraseniaRepetir.Txt.TextMode = TextBoxMode.Password;
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/index.aspx");
        }

        protected void Aceptar_Click(object sender, EventArgs e)
        {
            if (!LblContrasenia.Texto.Equals(LblContraseniaRepetir.Texto))
            {
                LblContraseniaRepetir.NoValido();
                return;
            }
            else LblContraseniaRepetir.Valido();

            bool valido = LblUsuario.Validar();
            valido = valido && LblContrasenia.Validar();
            valido = valido && LblCorreo.ValidarRegex(ListaRegex.Email);
            valido = valido && INombre.Validar();
            valido = valido && LblApellido.Validar();
            valido = valido && LblDni.Validar();
            if (valido)
            {
                BE.Usuario usr = new BE.Usuario();
                usr.Login = LblUsuario.Texto;
                usr.Password = LblContrasenia.Texto;
                usr.Correo = LblCorreo.Texto;
                usr.Nombre = INombre.Texto;
                usr.Apellido = LblApellido.Texto;
                usr.Dni = LblDni.getTextoInt();
                GestionarUsuario.Guardar(usr);
                Response.Redirect("/index.aspx");
            }
        }
    }
}