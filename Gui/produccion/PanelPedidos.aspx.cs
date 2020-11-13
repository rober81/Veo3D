using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class PanelPedidos : System.Web.UI.Page
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
            CompraBLL bll = new CompraBLL();
            Grilla.DataSource = null;
            Grilla.DataSource = bll.Listar();
            Grilla.DataBind();
        }
    }
}