using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class DigitoVerificador : System.Web.UI.Page
    {
        GestionarDigitoVerificador bll = new GestionarDigitoVerificador();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }

        private void CargarDatos()
        {
            GestionarDigitoVerificador bll = new GestionarDigitoVerificador();
            Grilla.DataSource = null;
            Grilla.DataSource = bll.Listar();
            Grilla.DataBind();

            ComboTabla.DataSource = null;
            ComboTabla.DataSource = bll.ListarTablas();
            ComboTabla.DataBind();
        }

        protected void Generar_Click(object sender, EventArgs e)
        {
            int salida = bll.GuardarDigitoVerificador(ComboTabla.SelectedValue);
            Mensaje.Exito();
            CargarDatos();
        }
        protected void Verificar_Click(object sender, EventArgs e)
        {
            textboxlog.Text = bll.VerificarDigitoVerificadorLog(ComboTabla.SelectedValue);
        }

        protected void Grilla_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells[2].Text.Equals("Estado"))
                return;
            if (e.Row.Cells[2].Text.Equals("Correcto"))
            {
                e.Row.CssClass = "table-success";
            } else
            {
                e.Row.CssClass = "table-danger";
            }
        }
    }
}