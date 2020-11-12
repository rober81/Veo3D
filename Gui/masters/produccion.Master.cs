using BE;
using BLL;
using Gui.controles;
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
    public partial class produccion : System.Web.UI.MasterPage
    {
        private Usuario usuario;
        private HttpCookie cookieIdioma;
        private string defaultIdioma = "Español";
        GestionarPermisos permisosbll;
        List<iPermisos> permisos;
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
                foreach (var item in permisos)
                {
                    foreach (var itemHijo in item.Hijos)
                    {
                        if (itemHijo.Nombre.Equals(control.ID))
                        {
                            control.Visible = true;
                            return;
                        }
                    }
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
    }
}