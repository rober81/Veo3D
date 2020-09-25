using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class Bitacora : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
                cargarTabla();
        }

        private void cargarTabla()
        {
            GestionarBitacora gestor = new GestionarBitacora();
            GridView1.DataSource = null;
            GridView1.DataSource = gestor.Listar();
            GridView1.DataBind();
        }
    }
}