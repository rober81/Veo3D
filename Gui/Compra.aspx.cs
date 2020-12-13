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
    public partial class Compra : System.Web.UI.Page
    {
        private ProductoBLL productos = new ProductoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ProductoPersonalizado"] != null)
                {
                    ProductoPersonalizado item = (ProductoPersonalizado)Session["ProductoPersonalizado"];
                    CargarDatos(item);
                }

            }
            bool logueado = GestionarSesion.getInstance().Usuario != null;
            GestionarPermisos permisosbll = new GestionarPermisos();
            bool permisoCliente = permisosbll.Buscar("Cliente");
            LblNoLogueado.Visible = !logueado;
            LblNoLogueadoCliente.Visible = logueado && !permisoCliente;
            BtnMercadopago.Visible = logueado && permisoCliente;
        }

        private void CargarDatos(ProductoPersonalizado prod)
        {
            LblTitulo.Text = prod.Producto.Nombre;
            LblTexto.Text = prod.Producto.Descripcion;
            LblPrecio.Text = prod.Producto.Precio.ToString("$#0.00");
            LblAnchoMontura.Texto = prod.AnchoMontura;
            LblPuente.Texto = prod.Puente;
            LblAnchoCristales.Texto = prod.AnchoCristales;
            LblAlturaCristales.Texto = prod.AlturaCristales;
            LblLongitudPatillas.Texto = prod.LongitudPatillas;
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/index.aspx");
        }

        protected void Comprar_Click(object sender, EventArgs e)
        {
            BE.Venta compra = new BE.Venta();
            if (string.IsNullOrEmpty(LblCalle.Texto))
            {
                LblCalle.NoValido();
                return;
            } else LblCalle.Valido();

            if (string.IsNullOrEmpty(LblPuerta.Texto))
            {
                LblPuerta.NoValido();
                return;
            }  else LblPuerta.Valido();

            if (string.IsNullOrEmpty(LblDepto.Texto))
            {
                LblDepto.NoValido();
                return;
            } else LblDepto.Valido();

            if (string.IsNullOrEmpty(LblLocalidad.Texto))
            {
                LblLocalidad.NoValido();
                return;
            } else LblPuerta.Valido();

            if (string.IsNullOrEmpty(LblProvincia.Texto))
            {
                LblProvincia.NoValido();
                return;
            } else LblProvincia.Valido();

            compra.Calle = LblCalle.Texto;
            compra.Puerta = LblPuerta.Texto;
            compra.Depto = LblDepto.Texto;
            compra.Localidad = LblLocalidad.Texto;
            compra.Provincia = LblProvincia.Texto;
            compra.Personalizado = (ProductoPersonalizado)Session["ProductoPersonalizado"];
            compra.Usuario = (Usuario)Session["Usuario"];
            VentaBLL compraBll = new VentaBLL();
            compraBll.Guardar(compra);
            Session["CompraFinalizada"] = compra;
            Response.Redirect("/Resumen.aspx");
        }
    }
}