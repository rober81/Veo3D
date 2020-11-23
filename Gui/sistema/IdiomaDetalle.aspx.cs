using BLL;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class IdiomaDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IdiomaNuevo"] != null)
                {
                    BE.Idioma idiomaGenerado = (BE.Idioma)Session["IdiomaNuevo"];
                    LblIdiomaSeleccionado.Text = $"{idiomaGenerado.Codigo}  {idiomaGenerado.Nombre.ToUpper()}";
                    CargarDatos(idiomaGenerado);
                }
            }

        }

        private void CargarDatos(BE.Idioma idiomaGenerado)
        {
            Grilla.DataSource = null;
            Grilla.DataSource = idiomaGenerado.Detalle;
            Grilla.DataBind();

        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            if (Session["IdiomaNuevo"] != null)
            {
                BE.Idioma idiomaGenerado = (BE.Idioma)Session["IdiomaNuevo"];
                foreach (var item in idiomaGenerado.Detalle)
                {
                    BE.IdiomaDetalle detalle = new BE.IdiomaDetalle
                    {
                        Idioma = idiomaGenerado.Nombre,
                        Clave = item.Key,
                        Texto = item.Value
                    };
                    GestionarIdioma.getInstance().insertarDetalle(detalle);
                }
            }
        }

        protected void Borrar_Click(Object sender, GridViewDeleteEventArgs e)
        {
            Debug.WriteLine("borrar");
        }
        protected void Editar_Click(Object sender, GridViewEditEventArgs e)
        {
            Grilla.EditIndex = e.NewEditIndex;
            BE.Idioma idiomaGenerado = (BE.Idioma)Session["IdiomaNuevo"];
            CargarDatos(idiomaGenerado);
        }
        protected void Actualizar_Click(Object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = Grilla.Rows[e.RowIndex];
            Grilla.EditIndex = e.RowIndex;
            Grilla.DataBind();
            TextBox TxtEditar = row.FindControl("TxtEditar") as TextBox;
            BE.Idioma idiomaGenerado = (BE.Idioma)Session["IdiomaNuevo"];
            string id = row.Cells[1].Text;
            //string id = Grilla.DataKeys[gvrow.RowIndex][1].ToString();
            idiomaGenerado.Detalle[id] = TxtEditar.Text;
            Session["IdiomaNuevo"] = idiomaGenerado;
            Grilla.EditIndex = -1;
            CargarDatos(idiomaGenerado);
        }

        protected void Actualizado_Click(Object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void Cancelar_Click(Object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            Grilla.EditIndex = e.RowIndex;
            Grilla.DataBind();
            Grilla.EditIndex = -1;
            BE.Idioma idiomaGenerado = (BE.Idioma)Session["IdiomaNuevo"];
            CargarDatos(idiomaGenerado);
        }

        protected void CancelarBoton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/sistema/Idioma.aspx");
        }
    }
}