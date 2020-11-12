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
            CompletarDatos();
            if (!IsPostBack)
            {
            }
        }

        private void CompletarDatos()
        {
            IPLblTitulo.Text = Titulo;
            IPLblPrecio.Text = Precio.ToString("$#0.00");
            IPLblTexto.Text = Texto;
            IPLblEstrellas.Text = CompletarEstrellas();
            Url = "/detalle.aspx?prod=" + this.ID;
            IPLinkDetalle.NavigateUrl = Url;
            IPLinkDetalle2.NavigateUrl = Url;
            IPImagenProd.ImageUrl = Imagen;
        }

        string CompletarEstrellas()
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