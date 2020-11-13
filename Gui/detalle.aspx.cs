using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.web
{
    public partial class detalle : System.Web.UI.Page
    {
        private Producto item;
        private ProductoBLL productos = new ProductoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                    int id = Convert.ToInt32(Request.QueryString["prod"]);
                    CargarDatos(id);
            }
        }

        private void CargarDatos(int id)
        {
            item = productos.Buscar(id);
            Session["Producto"] = item;
            IPLblTitulo.Text = item.Nombre;
            IPImagenProd.ImageUrl = $"/anteojos/{item.Imagen}";
            IPLblPrecio.Text = item.Precio.ToString("$#0.00");
            IPLblTexto.Text = item.Descripcion; ;
            IPLblEstrellas.Text = CompletarEstrellas(item.Calificacion);
        }

        string CompletarEstrellas(int estrellas)
        {
            string resultado = "";
            for (int i = 0; i < 5; i++)
            {
                if (i < estrellas)
                    resultado += " &#9733;";
                else
                    resultado += " &#9734;";
            }
            return resultado;
        }

        protected void Siguiente_Click(object sender, EventArgs e)
        {
            ProductoPersonalizado personal = new ProductoPersonalizado();
            personal.Producto = (Producto)Session["Producto"];
            personal.AnchoMontura = LblAnchoMontura.Texto;
            personal.Puente = LblPuente.Texto;
            personal.AnchoCristales = LblAnchoCristales.Texto;
            personal.AlturaCristales = LblAlturaCristales.Texto;
            personal.LongitudPatillas = LblLongitudPatillas.Texto;
            Session["ProductoPersonalizado"] = personal;
            Response.Redirect("/Compra.aspx");
        }
    }
}