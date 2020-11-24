using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class Prioridad : System.Web.UI.Page
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
        }
        protected void Bajar_Click(object sender, EventArgs e)
        {
            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                Modificar(id,1);
            }
        }
        protected void Subir_Click(object sender, EventArgs e)
        {
            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                Modificar(id,0);
            }
        }
        private void Modificar(string id, int sumar)
        {
            ImpresionBLL impBll = new ImpresionBLL();
            var impresion = impBll.Buscar(Convert.ToInt32(id));
            int nueva = impresion.Prioridad;
            if (sumar == 1)
                nueva++;
            else
                nueva--;
            impBll.CambiarPrioridad(impresion,nueva);
            CargarDatos();
        }
        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }
    }
}