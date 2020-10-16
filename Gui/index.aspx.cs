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
                CargarProductos(TipoAnteojos.Receta);
            }
        }

        private void CargarProductos(string tipo)
        {
            ProductoBLL productos = new ProductoBLL();
            ListaProductos.Controls.Clear();
            List<Producto> lista = productos.Listar(tipo); //productos.ListarProductos();
            Random aleatorio = new Random();
            foreach (Producto item in lista)
            {
                ImagenProducto prod = (ImagenProducto) this.LoadControl("/controles/ImagenProducto.ascx");
                prod.ID = item.Id.ToString();
                prod.Imagen = $"/anteojos/{item.Imagen}";
                prod.Url = "/web/detalle.aspx";
                prod.Estrellas = item.Calificacion;
                prod.Titulo = item.Nombre;
                prod.Precio = aleatorio.Next(1500, 3500);
                prod.Texto = item.Descripcion;
                ListaProductos.Controls.Add(prod);
            }
        }

        protected void LinkReceta_Click(object sender, EventArgs e)
        {
            CargarProductos(TipoAnteojos.Receta);
        }
        protected void LinkSol_Click(object sender, EventArgs e)
        {
            CargarProductos(TipoAnteojos.Sol);
        }
        protected void LinkDeportivo_Click(object sender, EventArgs e)
        {
            CargarProductos(TipoAnteojos.Deportivo);
        }
        protected void LinkRetro_Click(object sender, EventArgs e)
        {
            CargarProductos(TipoAnteojos.Retro);
        }
    }
}