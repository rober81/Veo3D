using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.controles
{
    public partial class ImagenProducto : System.Web.UI.UserControl
    {
        //public int Id { get; set; }
        public string Imagen { get; set; }
        public string Url { get; set; }
        public Decimal Precio { get; set; }
        public string Titulo { get; set; }
        public string Texto { get; set; }
        public int Estrellas { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Imagen = "../anteojos/1.png";
            Url = "~/web/detalle.aspx";
            Estrellas = 4;
            Titulo = "titulo personalizado";
            Precio = 50;
            Texto = "Este es un texto de descripcion";

            Image1.ImageUrl = Imagen;
            lblTitulo.Text = Titulo;
            lblPrecio.Text = "$" + Precio.ToString("#0.00");
            lblTexto.Text = Texto;
            lblEstrellas.Text = completarEstrellas();
            HyperLink1.NavigateUrl = Url;
            HyperLink2.NavigateUrl = Url;
        }

        string completarEstrellas()
        {
            string resultado = "";
            for (int i = 0; i < 5; i++)
            {
                if (i < Estrellas)
                    resultado += " &#9733;";
                else
                    resultado += " &#9734;";
            }
            return resultado;
        }
    }
}