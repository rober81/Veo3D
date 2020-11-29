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
            Grilla.DataSource = bll.Listar().Where(x => x.Estado.Equals(Estados.Nuevo)).ToList();
            Grilla.DataBind();

            MaterialBLL mbll = new MaterialBLL();
            ComboMaterial.DataSource = null;
            ComboMaterial.DataValueField = "Id";
            ComboMaterial.DataTextField = "MaterialCompleto";
            ComboMaterial.DataSource = mbll.Listar();
            ComboMaterial.DataBind();
        }

        protected void Archivo_Click(object sender, EventArgs e)
        {
            VentaBLL ventaBll = new VentaBLL();
            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                Venta ven = ventaBll.Buscar(Convert.ToInt32(id));

                if (!string.IsNullOrWhiteSpace(LblArchivo.Texto))
                {
                    ven.Personalizado.Archivo = LblArchivo.Texto;
                    ventaBll.ModificarArchivo(ven);
                }
                CargarDatos();
            }
        }

        protected void Imprimir_Click(object sender, EventArgs e)
        {
            VentaBLL ventaBll = new VentaBLL();
            ImpresionBLL impBll = new ImpresionBLL();
            MaterialBLL mbll = new MaterialBLL();

            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                Impresion nuevo = new Impresion();
                nuevo.Venta = ventaBll.Buscar(Convert.ToInt32(id));
                int mater = Convert.ToInt32(ComboMaterial.SelectedItem.Value);
                nuevo.Material = mbll.Buscar(mater);
                if (string.IsNullOrWhiteSpace(LblArchivo.Texto))
                {
                    nuevo.Venta.Personalizado.Archivo = LblArchivo.Texto;
                }
                if (!nuevo.Venta.Estado.Equals(Estados.Nuevo))
                    return;
                impBll.EnviarAImprimir(nuevo);
                CargarDatos();
            }
        }
        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }
    }
}