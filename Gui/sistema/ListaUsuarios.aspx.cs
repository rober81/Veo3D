using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.sistema
{
    public partial class ListaUsuarios : System.Web.UI.Page
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
            Grilla.DataSource = null;
            Grilla.DataSource = GestionarUsuario.Listar();
            Grilla.DataBind();
        }

        protected void Nuevo_Click(object sender, EventArgs e)
        {
            Session["UsuarioId"] = null;
            Response.Redirect("/sistema/Usuario.aspx");
        }
        protected void Modificar_Click(object sender, EventArgs e)
        {
            if (Grilla.SelectedRow != null)
            {
                string id = Grilla.SelectedRow.Cells[1].Text;
                Session["UsuarioId"] = id;
                Response.Redirect("/sistema/Usuario.aspx");
            }
        }
    }
}