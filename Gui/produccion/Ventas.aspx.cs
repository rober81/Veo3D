using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class Ventas : System.Web.UI.Page
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
            VentaBLL bll = new VentaBLL();
            Grilla.DataSource = null;
            Grilla.DataSource = bll.Listar();
            Grilla.DataBind();
        }

        protected void Imprimir_Click(object sender, EventArgs e)
        {
            VentaBLL ventaBll = new VentaBLL();
            ImpresionBLL impBll = new ImpresionBLL();

            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                Impresion nuevo = new Impresion();
                nuevo.Venta = ventaBll.Buscar(Convert.ToInt32(id));
                if (!nuevo.Venta.Estado.Equals(Estados.Nuevo))
                    return;
                impBll.EnviarAImprimir(nuevo);
                CargarDatos();
            }
        }
    }
}