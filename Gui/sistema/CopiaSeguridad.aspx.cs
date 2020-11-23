using BLL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class CopiaSeguridad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
                LtNombreArchivo.Texto = "Veo3D_DB_" + DateTime.Now.ToString("dd-MM-yyyy-hhmmss") + ".BAK";
                LtNombreArchivo.Txt.ReadOnly = true;
            }
        }
        private void CargarDatos()
        {
            string carpeta = ConfigurationManager.AppSettings["CarpetaBackup"].ToString();
            GridView1.DataSource = null;
            GridView1.DataSource = (from item in GestionarCopiaDeSeguridad.ListarArchivos() select new { Nombre = item.Nombre.Substring(carpeta.Length+1), Fecha = item.Fecha }).ToList();
            GridView1.DataBind();

        }

        protected void BtnCrear_Click(object sender, EventArgs e)
        {
            if (LtNombreArchivo.Validar())
            {
                try
                {
                    BE.CopiaDeSeguridad copia = new BE.CopiaDeSeguridad();
                    copia.Nombre = LtNombreArchivo.Texto;
                    copia.Fecha = DateTime.Now;
                    int res = BLL.GestionarCopiaDeSeguridad.Backup(copia);
                    if (res == 0 && File.Exists(copia.Nombre))
                    {
                        //Mensaje("msgBackOk");
                        CargarDatos();
                    }
                    else
                    {
                        //Mensaje("msgBackNo");
                    }
                }
                catch (Exception ex)
                {
                    GestionarError.loguear(ex.ToString());
                    //Mensaje("msgBackNo");
                }
            }
            LtNombreArchivo.Texto = "Veo3D_DB_" + DateTime.Now.ToString("dd-MM-yyyy-hhmmss") + ".BAK";
        }

        protected void BtnRestaurar_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow != null)
            {
                var nombre = GridView1.SelectedRow.Cells[1].Text;
                var fecha = GridView1.SelectedRow.Cells[2].Text;
                try
                {
                    if (true)
                    {
                        BE.CopiaDeSeguridad seleccionado = new BE.CopiaDeSeguridad();
                        string carpeta = ConfigurationManager.AppSettings["CarpetaBackup"].ToString();
                        seleccionado.Nombre = $@"{carpeta}\{nombre}";
                        BE.CopiaDeSeguridad copia = seleccionado;
                        if (File.Exists(copia.Nombre))
                        {
                            //BLL.GestionarCopiaDeSeguridad.Restaurar(copia);
                            //Mensaje("msgRestoreOk");
                            //BLL.GestionarSesion.getInstance().cerrarSesion();
                            Response.Redirect("/index.aspx");
                        }
                        else
                        {
                            //Mensaje("msgErrorArchivoNoExiste", "msgError");
                        }
                    }
                }
                catch (Exception ex)
                {
                    GestionarError.loguear(ex.ToString());
                    //Mensaje("msgRestoreNo", "msgError");
                }
            }
        }
    }
}