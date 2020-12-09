using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class Permisos : System.Web.UI.Page
    {
        GestionarPermisos bll = new GestionarPermisos();
        List<BE.Permiso> lista = null;
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
            Grilla.DataSource = bll.ListarPerfiles();
            Grilla.DataBind();

            List<BE.Permiso> lista = new List<BE.Permiso>();
            BE.Permiso nulo = new BE.Permiso();
            nulo.Id = 0;
            nulo.Nombre = "Ninguno";
            lista.Add(nulo);
            lista.AddRange(bll.ListarPerfiles());
            ComboPermisos.DataSource = null;
            ComboPermisos.DataSource = lista;
            ComboPermisos.DataBind();
        }

        protected void Baja_Click(object sender, EventArgs e)
        {
            string id = Grilla.SelectedRow.Cells[1].Text;
            BE.Permiso per = new BE.Permiso();
            per.Id = Convert.ToInt32(id);
            try
            {
                int salida = bll.Borrar(per);
                CargarDatos();
                if (salida > 0)
                    Mensaje.Exito();
                else
                    Mensaje.ErrorMsg();
            }
            catch (Exception)
            {
                Mensaje.ErrorMsg();
            }
        }
        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }

        protected void Agregar_Click(object sender, EventArgs e)
        {
            if (! string.IsNullOrWhiteSpace(TxtPermiso.Texto))
            {
                BE.Permiso per = new BE.Permiso();
                per.Nombre = TxtPermiso.Texto;
                string padre = ComboPermisos.SelectedValue;
                BE.Permiso padrePermiso = null;
                if (!padre.Equals("Ninguno"))
                {
                    lista = bll.ListarPerfiles();
                    padrePermiso = lista.FirstOrDefault( p => p.Nombre == ComboPermisos.SelectedValue);
                }
                int salida = bll.Insertar(per, padrePermiso != null? padrePermiso.Id:0);
                CargarDatos();
                if (salida > 0)
                    Mensaje.Exito();
                else
                    Mensaje.ErrorMsg();
            }
        }
    }
}