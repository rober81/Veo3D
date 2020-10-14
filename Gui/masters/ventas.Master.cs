using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.masters
{
    public partial class ventas : System.Web.UI.MasterPage
    {
        Usuario usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["Usuario"];
            if (usuario == null)
            {
                linkAdministracion.Visible = false;
                linkCerrar2.Visible = false;
                linkLogin.Visible = true;
            }
            else
            {
                linkAdministracion.Visible = true;
                linkCerrar2.Visible = true;
                linkLogin.Visible = false;
            }

            CargarIdioma();
            if (!IsPostBack)
            {
            }

            //PRUEBA
            linkAdministracion.Visible = true;
        }

        private void CargarIdioma()
        {
            lblLogin.Text = "Login";
            lblHome.Text = "Inicio";
            lblAdministracion.Text = "Administración";
            lblContacto.Text = "Contacto";
            lblCerrar.Text = "Cerrar Sesión";
        }

        public void linkCerrar_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            GestionarSesion.getInstance().cerrarSesion();
            linkLogin.Visible = true;
            linkCerrar2.Visible = false;
            FormsAuthentication.SignOut();
            Response.Redirect("/index.aspx");
        }
    }
}