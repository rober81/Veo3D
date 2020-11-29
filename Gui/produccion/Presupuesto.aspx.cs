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
            ResultadoDiv.Visible = false;
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }
        private void CargarDatos()
        {
            ImpresionBLL bll = new ImpresionBLL();
            Grilla.DataSource = null;
            Grilla.DataSource = bll.Listar().Where(i => ! i.Estado.Equals(Estados.Finalizado)).OrderBy(x => x.Prioridad).ToList();
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
            ImpresionBLL impBll = new ImpresionBLL();
            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                BE.Impresion seleccionado = impBll.Buscar(Convert.ToInt32(id));
                var valor = seleccionado.Venta.Personalizado.Producto.CantidadMaterial * seleccionado.Material.CostoxMetro;

                ResultadoDiv.Visible = true;
                LblCalculo.Text = $"Tiempo: {seleccionado.Venta.Personalizado.Producto.TiempoImpresion} horas \n Valor: ${valor}.-";
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

        protected void Terminado_Click(object sender, EventArgs e)
        {
            ImpresionBLL impBll = new ImpresionBLL();
            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                BE.Impresion modificado = impBll.Buscar(Convert.ToInt32(id));
                if (!modificado.Estado.Equals(Estados.Imprimiendo))
                    return;
                modificado.Estado = Estados.Finalizado;
                impBll.Modificar(modificado);
                impBll.EnviarADomicilio(modificado.Venta);
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
        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }
    }
}