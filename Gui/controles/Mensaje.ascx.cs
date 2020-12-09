using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.controles
{
    public partial class Mensaje : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void Informacion(string mensaje)
        {
            ResultadoDiv.Visible = true;
            ResultadoDiv.Attributes["class"] = "alert alert-info";
            ResultadoLabelTexto.Text = mensaje;
        }
        public void ErrorMsg(string mensaje)
        {
            ResultadoDiv.Visible = true;
            ResultadoDiv.Attributes["class"] = "alert alert-danger";
            ResultadoLabelTexto.Text = mensaje;
        }

        public void Exito(string mensaje)
        {
            ResultadoDiv.Attributes["class"] = "alert alert-success";
            ResultadoDiv.Visible = true;
            ResultadoLabelTexto.Text = mensaje;
        }
        public void ErrorMsg()
        {
            ResultadoDiv.Visible = true;
            ResultadoDiv.Attributes["class"] = "alert alert-danger";
            ResultadoLabelTexto.Text = GestionarIdioma.getInstance().GetTexto("MsgError"); ;
        }
        public void Exito()
        {
            ResultadoDiv.Attributes["class"] = "alert alert-success";
            ResultadoDiv.Visible = true;
            ResultadoLabelTexto.Text = GestionarIdioma.getInstance().GetTexto("MsgExito");
        }
    }
}