using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class Permisos : System.Web.UI.Page
    {
        GestionarPermisos bll = new GestionarPermisos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }
        private void CargarDatos()
        {
            //GestionarDigitoVerificador bll = new GestionarDigitoVerificador();
            Grilla.DataSource = null;
            Grilla.DataSource = bll.ListarPerfiles();
            Grilla.DataBind();

            ComboPermisos.DataSource = null;
            ComboPermisos.DataSource = bll.ListarPerfiles();
            ComboPermisos.DataBind();
        }

        protected void Baja_Click(object sender, EventArgs e)
        {
            //bll.GuardarDigitoVerificador(ComboPermisos.SelectedValue);
        }
        protected void Agregar_Click(object sender, EventArgs e)
        {
            //textboxlog.Text = bll.VerificarDigitoVerificadorLog(ComboTabla.SelectedValue);
        }
    }
}