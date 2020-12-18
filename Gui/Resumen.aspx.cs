using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui
{
    public partial class Resumen : System.Web.UI.Page
    {
        BE.Venta item;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CompraFinalizada"] != null)
                {
                    item = (BE.Venta)Session["CompraFinalizada"];
                    CargarDatos(item);
                }
            }
        }

        private void CargarDatos(BE.Venta parametro)
        {
            LblTitulo.Text = parametro.Personalizado.Producto.Nombre;
            LblTexto.Text = parametro.Personalizado.Producto.Descripcion;
            LblPrecio.Text = parametro.Personalizado.Producto.Precio.ToString("$#0.00");
            LblAnchoMontura.Texto = parametro.Personalizado.AnchoMontura;
            LblPuente.Texto = parametro.Personalizado.Puente;
            LblAnchoCristales.Texto = parametro.Personalizado.AnchoCristales;
            LblAlturaCristales.Texto = parametro.Personalizado.AlturaCristales;
            LblLongitudPatillas.Texto = parametro.Personalizado.LongitudPatillas;
            LblCalle.Texto = parametro.Calle;
            LblPuerta.Texto = parametro.Puerta;
            LblDepto.Texto = parametro.Depto;
            LblLocalidad.Texto = parametro.Localidad;
            LblProvincia.Texto = parametro.Provincia;
            LblColor.Texto = parametro.Personalizado.Color;
        }

        protected void Volver_Click(object sender, EventArgs e)
        {
            Response.Redirect("/index.aspx");
        }

        protected void PDF_Click(object sender, EventArgs e)
        {
            string nombre = "Factura";
            List<BE.Venta> ventas = new List<Venta>();
            item = (BE.Venta)Session["CompraFinalizada"];
            ventas.Add(item);
            var datasource = ventas;

            var master = Master as masters.ventas;
            master.CrearReporte<BE.Venta>("PDF", nombre, datasource);
        }
    }
}