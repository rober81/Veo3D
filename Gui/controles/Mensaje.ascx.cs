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
            //if(!IsPostBack)
                //ResultadoDiv.Visible = false;
        }

        public void ResultadoInfo(string mensaje)
        {
            ResultadoDiv.Visible = true;
            ResultadoDiv.Attributes["class"] = "alert alert-info w-75";
            ResultadoLabelTexto.Text = mensaje;
        }
        public void ResultadoError(string mensaje)
        {
            ResultadoDiv.Visible = true;
            ResultadoDiv.Attributes["class"] = "alert alert-danger w-75";
            ResultadoLabelTexto.Text = mensaje;
        }

        public void ResultadoExito(string mensaje)
        {
            ResultadoDiv.Attributes["class"] = "alert alert-success w-75";
            ResultadoDiv.Visible = true;
            ResultadoLabelTexto.Text = mensaje;
        }
    }
}