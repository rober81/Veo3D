using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }

        private void CargarDatos()
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TxtUsuario.Text = "administrador";
            TxtContrasenia.Text = "administrador";
            if (!string.IsNullOrWhiteSpace(TxtUsuario.Text) && !string.IsNullOrWhiteSpace(TxtContrasenia.Text)){
                GestionarSesion.getInstance().iniciarSesion(TxtUsuario.Text, TxtContrasenia.Text);
                Usuario logueado = GestionarSesion.getInstance().Usuario;
                if (logueado != null)
                {
                    Session["Usuario"] = logueado;
                    FormsAuthentication.SetAuthCookie(logueado.Login, ChkPass.Checked);
                    Response.Redirect("~/index.aspx",true);
                }
            }
        }

    }
}