﻿using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class Impresora : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }

        private void CargarDatos()
        {
            ImpresoraBLL bll = new ImpresoraBLL();
            Grilla.DataSource = null;
            Grilla.DataSource = bll.Listar();
            Grilla.DataBind();
        }

        protected void Nuevo_Click(object sender, EventArgs e)
        {
            Session["ImpresoraId"] = null;
            Response.Redirect("/produccion/ImpresoraAbm.aspx");
        }
        protected void Modificar_Click(object sender, EventArgs e)
        {
            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                Session["ImpresoraId"] = id;
                Response.Redirect("/produccion/ImpresoraAbm.aspx");
            }
        }
    }
}