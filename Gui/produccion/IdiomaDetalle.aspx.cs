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
                    LblIdiomaSeleccionado.Text = $"{idiomaGenerado.Codigo} - {idiomaGenerado.Nombre}";
                    CargarDatos(idiomaGenerado);
                }
            }

        }

        private void CargarDatos(BE.Idioma idiomaGenerado)
        {
            GrillaIdiomas.DataSource = null;
            GrillaIdiomas.DataSource = idiomaGenerado.Detalle;
            GrillaIdiomas.DataBind();

        }

        protected void AgregarDetalleIdioma_Click(object sender, EventArgs e)
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
    }
}