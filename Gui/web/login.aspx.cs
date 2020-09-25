using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.web
{
    public partial class login : System.Web.UI.Page
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
            lblUsuario.Text = "Usuario";
            lblContrasenia.Text = "Contraseña";
            btnAceptar.Text = "Aceptar";
            lblRecordarPass.Text = "Recordar Contraseña";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GestionarSesion.getInstance().iniciarSesion(txtUsuario.Text, txtContrasenia.Text);
            Usuario logueado = GestionarSesion.getInstance().Usuario;
            if (logueado != null)
            {
                Session["Usuario"] = logueado;
                Response.Redirect("~/web/index.aspx");
            }
        }

    }
}