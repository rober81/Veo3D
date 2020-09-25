using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.masters
{
    public partial class produccion : System.Web.UI.MasterPage
    {
        Usuario usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["Usuario"];
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }

        private void CargarDatos()
        {
            usuario = (Usuario)Session["Usuario"];
            lblUsuario.Text = "Usuario";
            if (usuario != null)
            {
                lblUsuario.Text = $"{usuario.Nombre} {usuario.Apellido}";
            }

            lblTituloTablero.Text = "VEO3D Admin";

        }
    }
}