﻿using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{

    public partial class indexProd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //usr = (Usuario)Session["Usuario"];
            if (!IsPostBack)
            {
                CargarIdioma();
            }
        }

        private void CargarIdioma()
        {
           //lblShop.Text = "Fabrica de anteojos 3D";

        }
    }
}