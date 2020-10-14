using BE;
using BLL;
using Gui.controles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.web
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarIdioma();
            CargarProductos();
            if (!IsPostBack)
            {

            }
        }

        private void CargarIdioma()
        {
            lblShop.Text = "Fabrica de anteojos 3D";

        }

        private void CargarProductos()
        {
            ProductoBLL productos = new ProductoBLL();
            List<Producto> lista = productos.ListarProductos();
            Random aleatorio = new Random();
            foreach (Producto item in lista)
            {
                ImagenProducto prod = (ImagenProducto) this.LoadControl("~/controles/ImagenProducto.ascx");
                prod.Imagen = item.Archivo;
                prod.Url = "~/web/detalle.aspx";
                prod.Estrellas = aleatorio.Next(1, 6);
                prod.Titulo = item.Nombre;
                prod.Precio = aleatorio.Next(1500, 3500); ;
                prod.Texto = "Este es un texto de descripcion";
                ListaProductos.Controls.Add(prod);
            }
        }
    }
}