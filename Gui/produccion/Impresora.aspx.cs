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

        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
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
        protected void XLS_Click(object sender, EventArgs e)
        {
            Exportar("XLS");
        }
        protected void PDF_Click(object sender, EventArgs e)
        {
            Exportar("PDF");
        }
        private void Exportar(string tipo)
        {
            string nombre = "Impresoras";
            ImpresoraBLL bll = new ImpresoraBLL();
            var datasource = bll.Listar();

            var master = Master as masters.Produccion;
            master.CrearReporte<BE.Impresora>(tipo, nombre, datasource);
        }
    }
}