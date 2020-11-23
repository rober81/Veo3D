using BLL;
using Gui.controles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class CambiasPass : System.Web.UI.Page
    {
        BE.Usuario usr = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            LblContrasenia.Txt.TextMode = TextBoxMode.Password;
            LblContraseniaRepetir.Txt.TextMode = TextBoxMode.Password;
            usr = GestionarSesion.getInstance().Usuario;
            LblContrasenia.Texto = string.Empty;
            LblContraseniaRepetir.Texto = string.Empty;
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }

        private void CargarDatos()
        {
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/produccion/indexProd.aspx");
        }

        protected void Aceptar_Click(object sender, EventArgs e)
        {
            bool valido = true;

            if (!LblContrasenia.Texto.Equals(LblContraseniaRepetir.Texto))
            {
                LblContraseniaRepetir.NoValido();
                return;
            }
            else LblContraseniaRepetir.Valido();

            valido = valido && LblContrasenia.Validar();
            valido = valido && LblContraseniaRepetir.Validar();
            if (valido)
            {
                BE.Usuario usr2 = new BE.Usuario();
                usr2.Login = usr.Login;
                usr2.Password = LblContrasenia.Texto;
                GestionarUsuario.CambiarPass(usr2);
                Response.Redirect("/produccion/indexProd.aspx");
            }
        }
    }
}