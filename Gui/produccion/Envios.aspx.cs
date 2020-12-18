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
            var listado = bll.Listar().Where(x => x.Estado.Equals(Estados.EnviarADomicilio) && !x.Estado.Equals(Estados.EnvioDomicilio)).ToList();
            Grilla.DataSource = null;
            Grilla.DataSource = listado;
            Grilla.DataBind();
            LblCodigoEnvio.Visible = true;
            if (listado.Count == 0)
                LblCodigoEnvio.Visible = false;

        }

        protected void Aceptar_Click(object sender, EventArgs e)
        {
            VentaBLL ventaBll = new VentaBLL();

            var valido = LblCodigoEnvio.Validar();
            if (Grilla.SelectedRow != null && valido)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                Venta venta = ventaBll.Buscar(Convert.ToInt32(id));
                venta.CodigoEnvio = LblCodigoEnvio.Texto;
                if (venta.Estado.Equals(Estados.EnvioDomicilio))
                    return;
                ventaBll.ModificarEnvio(venta);
                ventaBll.EnviadoADomicilio(venta);
                LblCodigoEnvio.Texto = string.Empty;
                CargarDatos();
            }
        }

        protected void Generar_Click(object sender, EventArgs e)
        {
           string nombre = "Etiqueta";
            VentaBLL bll = new VentaBLL();
            var datasource = bll.Listar().Where(x => x.Estado.Equals(Estados.EnviarADomicilio) && !x.Estado.Equals(Estados.EnvioDomicilio)).ToList();

            var master = Master as masters.Produccion;
            master.CrearReporte<BE.Venta>("PDF", nombre, datasource);
        }

        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }
    }
}