using BE;
using BLL;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class Envios : System.Web.UI.Page
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
            Grilla.DataSource = bll.Listar().Where(x => x.Estado.Equals(Estados.EnviarADomicilio) && ! x.Estado.Equals(Estados.EnvioDomicilio)).ToList();
            Grilla.DataBind();
        }

        protected void Aceptar_Click(object sender, EventArgs e)
        {
            VentaBLL ventaBll = new VentaBLL();
            ImpresionBLL impBll = new ImpresionBLL();

            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                Venta venta = ventaBll.Buscar(Convert.ToInt32(id));
                if (!venta.Estado.Equals(Estados.EnvioDomicilio))
                    return;
                impBll.EnviadoADomicilio(venta);
                CargarDatos();
            }
        }

        protected void Generar_Click(object sender, EventArgs e)
        {
            VentaBLL ventaBll = new VentaBLL();
            string id = Grilla.SelectedRow.Cells[1].Text;
            Venta venta = ventaBll.Buscar(Convert.ToInt32(id));
            var master = Master as masters.Produccion;
            master.CrearPDF<Venta>("Etiquetas.pdf", @"Reportes\ReporteEtiqueta.rdlc", ventaBll.Listar().Where(x => x.Estado.Equals(Estados.EnviarADomicilio) && !x.Estado.Equals(Estados.EnvioDomicilio)).ToList());
        }

        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }
    }
}