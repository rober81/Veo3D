using BE;
using BLL;
using Gui.controles;
using System;
using System.Collections.Generic;

namespace Gui.web
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            CargarProductos();
        }

        private void CargarProductos()
        {
            ProductoBLL productos = new ProductoBLL();
            List<Producto> lista = productos.ListarProductos();
            Random aleatorio = new Random();
            foreach (Producto item in lista)
            {
                ImagenProducto prod = (ImagenProducto) this.LoadControl("/controles/ImagenProducto.ascx");
                prod.Imagen = item.Archivo;
                prod.Url = "/web/detalle.aspx";
                prod.Estrellas = aleatorio.Next(1, 6);
                prod.Titulo = item.Nombre;
                prod.Precio = aleatorio.Next(1500, 3500); ;
                prod.Texto = "Este es un texto de descripcion";
                ListaProductos.Controls.Add(prod);
            }
        }
    }
}