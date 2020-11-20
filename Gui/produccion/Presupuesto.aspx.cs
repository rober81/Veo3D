using BLL;
using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class Presupuesto : System.Web.UI.Page
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
            Grilla.DataSource = bll.Listar().OrderBy(x => x.Impresora.Nombre).ThenBy(x => x.Prioridad).ToList();//.Where(i => i.Estado.Equals(Estados.EnviadoAImprimir));
            Grilla.DataBind();

            MaterialBLL mbll = new MaterialBLL();
            ComboMaterial.DataSource = null;
            ComboMaterial.DataValueField = "Id";
            ComboMaterial.DataTextField = "MaterialCompleto";
            ComboMaterial.DataSource = mbll.Listar();
            ComboMaterial.DataBind();
        }

        protected void Cambiar_Click(object sender, EventArgs e)
        {
            MaterialBLL mbll = new MaterialBLL();
            ImpresionBLL impBll = new ImpresionBLL();
            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                BE.Impresion modificado = impBll.Buscar(Convert.ToInt32(id));
                modificado.Material = mbll.Buscar(Convert.ToInt32(ComboMaterial.SelectedItem.Value));
 
                if (modificado.Estado.Equals(Estados.Imprimiendo))
                    return;
                impBll.Modificar(modificado);
                CargarDatos();
            }
        }

        protected void Calcular_Click(object sender, EventArgs e)
        {
            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
               
            }
        }

        protected void Primario_Click(object sender, EventArgs e)
        {
            ImpresionBLL impBll = new ImpresionBLL();
            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                BE.Impresion modificado =  impBll.Buscar(Convert.ToInt32(id));
                if (!modificado.Estado.Equals(Estados.Nuevo))
                    return;
                modificado.Estado = Estados.Imprimiendo;
                impBll.Modificar(modificado);
                ActualizarStockMaterial(modificado);
                CargarDatos();
            }
        }

        private void ActualizarStockMaterial(BE.Impresion impre)
        {
            MaterialBLL bll = new MaterialBLL();
            Decimal cantidad = impre.Venta.Personalizado.Producto.CantidadMaterial;
            BE.Material mat = impre.Material;
            mat.Stock = mat.Stock - Convert.ToInt32(cantidad);
            bll.Modificar(mat);
        }
    }
}