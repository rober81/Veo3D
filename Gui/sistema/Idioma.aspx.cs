using BLL;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class Idioma : System.Web.UI.Page
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
            GrillaIdiomas.DataSource = null;
            GrillaIdiomas.DataSource = GestionarIdioma.getInstance().Listar();
            GrillaIdiomas.DataBind();

        }

        protected void BorrarIdioma_Click(Object sender, GridViewDeleteEventArgs e)
        {
            Debug.WriteLine("borrar");
        }
        protected void EditarIdioma_Click(Object sender, GridViewEditEventArgs e)
        {
            Debug.WriteLine("editar");
        }
        protected void ActualizarIdioma_Click(Object sender, GridViewUpdateEventArgs e)
        {
            Debug.WriteLine("actualizar");
        }
        protected void CancelarIdioma_Click(Object sender, GridViewCancelEditEventArgs e)
        {
            Debug.WriteLine("cancelar");
        }
        protected void CrearIdioma_Click(object sender, EventArgs e)
        {
            if (LtNombre.Validar() && LtCodigoIdioma.Validar())
            {
                BE.Idioma nuevo = new BE.Idioma(LtNombre.Texto, LtCodigoIdioma.Texto);
                GestionarIdioma.getInstance().insertar(nuevo);
                LtNombre.Texto = string.Empty;
                LtCodigoIdioma.Texto = string.Empty;
                CargarDatos();
            }
        }

        protected void Modificar_Click(object sender, EventArgs e)
        {
            if (GrillaIdiomas.SelectedRow != null)
            {
                var idioma = GrillaIdiomas.SelectedRow.Cells[1].Text;
                var codigo = GrillaIdiomas.SelectedRow.Cells[2].Text;
                BE.Idioma seleccionado = new BE.Idioma(idioma);
                GestionarIdioma.getInstance().Cargar(seleccionado);
                Session["IdiomaNuevo"] = seleccionado;
                Response.Redirect("/sistema/IdiomaDetalle.aspx");
            }
        }

        protected void AgregarDetalleIdioma_Click(object sender, EventArgs e)
        {
            if (GrillaIdiomas.SelectedRow != null)
            {
                var idioma = GrillaIdiomas.SelectedRow.Cells[1].Text;
                var codigo = GrillaIdiomas.SelectedRow.Cells[2].Text;
                BE.Idioma nuevo = GestionarIdioma.getInstance().CrearIdioma(idioma, codigo);
                Session["IdiomaNuevo"] = nuevo;
                Response.Redirect("/sistema/IdiomaDetalle.aspx");
            }
        }
    }
}