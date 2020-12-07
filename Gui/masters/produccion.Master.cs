using BE;
using BLL;
using Gui.controles;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.masters
{
    public partial class Produccion : MasterPage
    {
        private Usuario usuario;
        private HttpCookie cookieIdioma;
        private string defaultIdioma = "Español";
        GestionarPermisos permisosbll;
        List<iPermiso> permisos;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["Usuario"];
            if (usuario == null)
            {
                Response.Redirect("/index.aspx");
            }
            if (!IsPostBack)
            {
                CargarDatos();
                PermisosMenu();
                if (Request.Cookies["Idioma"] == null)
                    GrabarCookieIdioma("Español");
                else
                {
                    defaultIdioma = Server.UrlDecode(Request.Cookies["Idioma"].Value);
                    ComboIdioma.SelectedValue = defaultIdioma;
                    CambiarIdioma(defaultIdioma);
                }
            }
            
        }

        private void CargarIdioma(ControlCollection controles)
        {
            foreach (Control control in controles)
            {
                if (control.HasControls())
                {
                    CargarIdioma(control.Controls);
                } else
                {
                    IdiomaHelper.Traducir(control);
                }
            }
        }

        private void CargarDatos()
        {
            usuario = (Usuario)Session["Usuario"];
            if (usuario != null)
            {
                LblUsuarioNombre.Text = $"{usuario.Nombre} {usuario.Apellido}";
            }
            ComboIdioma.DataSource = null;
            ComboIdioma.DataSource = GestionarIdioma.getInstance().Listar();
            ComboIdioma.DataBind();
        }
        private void GrabarCookieIdioma(string idioma)
        {
            cookieIdioma = new HttpCookie("Idioma");
            cookieIdioma.Value = Server.UrlEncode(idioma);
            Response.Cookies.Add(cookieIdioma);
        }

        private void CambiarIdioma(string idioma)
        {
            Idioma unIdioma = new Idioma(idioma);
            GestionarIdioma.getInstance().CambiarIdioma(unIdioma);
            CargarIdioma(this.Controls);
        }

        protected void ComboIdioma_Change(object sender, EventArgs e)
        {
            GrabarCookieIdioma(ComboIdioma.SelectedValue);
            CambiarIdioma(ComboIdioma.SelectedValue);
        }
        protected void LinkCerrar_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            GestionarSesion.getInstance().cerrarSesion();
            FormsAuthentication.SignOut();
            Response.Redirect("/index.aspx");
        }

        protected void PermisosMenu()
        {
            permisosbll = new GestionarPermisos();
            permisos = permisosbll.ListarUsuarioPermiso(GestionarSesion.getInstance().Usuario);
            VerificarPermisos(this.Controls);
        }

        private void VerificarPermiso(Control control)
        {
            if (control == null || control.ID == null)
                return;
            if (control is HyperLink _link)
            {
                if (permisosbll.Buscar(permisos, control.ID))
                {
                    control.Visible = true;
                }
            }
        }

        private void VerificarPermisos(ControlCollection controles)
        {
            foreach (Control control in controles)
            {
                if (control.HasControls())
                {
                    VerificarPermisos(control.Controls);
                }
                else
                {
                    VerificarPermiso(control);
                }
            }
        }
        public void ShowToastr(Page page, string message, string title, string type = "info")
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "toastr_message",
                  String.Format("toastr.{0}('{1}', '{2}');", type.ToLower(), message, title), addScriptTags: true);
        }

        public void ToastInfo(Page page, string message, string title)
        {
            ShowToastr(page, message, title, "info");
        }
        public void ToastError(Page page, string message, string title)
        {
            ShowToastr(page, message, title, "error");
        }

        public void ToastExito(Page page, string message, string title)
        {
            ShowToastr(page, message, title, "success");
        }

        public void ToastExito(Page page, string message)
        {
            ShowToastr(page, message, "", "success");
        }

        public void CrearPDF<T>(string fileName, string reporte, IEnumerable<T> datasource)
        {
            CreateReport<T>("PDF", fileName, reporte, datasource);
        }

        public void CrearXLS<T>(string fileName, string reporte, IEnumerable<T> datasource)
        {
            CreateReport<T>("XLS", fileName, reporte, datasource); 
        }

        public void CreateReport<T>(string tipo, string fileName, string reporte, IEnumerable<T> datasource)
        {

            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;

            // Setup the report viewer object and get the array of bytes
            ReportViewer viewer = new ReportViewer();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.ReportPath = reporte;
            viewer.LocalReport.DataSources.Clear();
            //EL nombre del/los datasource usados en la creacion del reporte, debe ser respetado, porque figura en el XML
            viewer.LocalReport.DataSources.Add(new ReportDataSource("Dataset", datasource));

            byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
            Response.BinaryWrite(bytes); // create the file
            Response.Flush();
        }
    }
}