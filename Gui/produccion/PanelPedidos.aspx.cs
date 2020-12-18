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
            ImpresionBLL bll = new ImpresionBLL();
            Grilla.DataSource = null;
            Grilla.DataSource = bll.Listar().Where(i => i.Estado.Equals(Estados.Finalizado)).ToList();
            Grilla.DataBind();
        }
        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Visible = false;
        }

        protected void XLS_Click(object sender, EventArgs e)
        {
            Exportar("XLS");
        }
        protected void PDF_Click(object sender, EventArgs e)
        {
            Exportar("PDF");
        }
        private void Exportar(string tipo)
        {
            string nombre = "Historial";
            ImpresionBLL bll = new ImpresionBLL();
            var datasource = bll.Listar().Where(i => i.Estado.Equals(Estados.Finalizado)).ToList();

            var master = Master as masters.Produccion;
            master.CrearReporte<BE.Impresion>(tipo, nombre, datasource);
        }
    }
}