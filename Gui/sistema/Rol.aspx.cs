using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class Rol : System.Web.UI.Page
    {
        GestionarPermisos bll = new GestionarPermisos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }
        private void CargarDatos()
        {
            DataTable dataTable1 = new DataTable();
            dataTable1.TableName = "Permisos";
            dataTable1.Columns.Add("Usuario");
            dataTable1.Columns.Add("Permiso");

            foreach (var item in bll.ListarUsuarioPermiso())
            {
                dataTable1.Rows.Add(item.Item1.Login,item.Item2.Nombre);
            }
            
            Grilla.DataSource = null;
            Grilla.DataSource = dataTable1;
            Grilla.DataBind();

            ComboPermisos.DataSource = null;
            ComboPermisos.DataSource = bll.ListarPerfiles();
            ComboPermisos.DataBind();

            ComboUsuarios.DataSource = null;
            ComboUsuarios.DataSource = GestionarUsuario.Listar();
            ComboUsuarios.DataBind();
        }

        protected void Baja_Click(object sender, EventArgs e)
        {
            string id = Grilla.SelectedRow.Cells[1].Text;
            BE.Usuario usr = new BE.Usuario();
            usr.Login = id;
            int salida = bll.BorrarUsuarioPermiso(usr);
            CargarDatos();
            if (salida == 1)
                Mensaje.Exito();
            else
                Mensaje.ErrorMsg();
        }
        protected void Agregar_Click(object sender, EventArgs e)
        {
                BE.Permiso per = bll.ListarPerfiles().First(p => p.Nombre.Equals(ComboPermisos.SelectedValue));
                BE.Usuario usr = new BE.Usuario();
                usr.Login = ComboUsuarios.SelectedValue;  
                int salida = bll.GuardarUsuarioPermiso(usr, per);
                CargarDatos();
                if (salida == 1)
                    Mensaje.Exito();
                else
                    Mensaje.ErrorMsg();
        }
    }
}