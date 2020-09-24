using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.masters
{
    public partial class ventas : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarIdioma();
            }
        }

        private void CargarIdioma()
        {
            lblLogin.Text = "Login";
            lblHome.Text = "Inicio";
            lblAdministracion.Text = "Administración";
            lblContacto.Text = "Contacto";
        }

    }
}