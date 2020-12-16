using BE;
using BLL;
using Gui.controles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.masters
{
    public partial class ventas : System.Web.UI.MasterPage
    {
        protected Usuario usuario;
        HttpCookie cookieIdioma;
        protected void Page_Load(object sender, EventArgs e)
        {
            PermisosMenu();
            if (Session["Usuario"] == null)
            {
                LinkAdministracion.Visible = false;
                LinkCerrar2.Visible = false;
                LinkLogin.Visible = true;
                LinkRegistro.Visible = true;
            }
            else
            {
                usuario = (Usuario)Session["Usuario"];
                //LinkAdministracion.Visible = true;
                LinkCerrar2.Visible = true;
                LinkLogin.Visible = false;
                LinkRegistro.Visible = false;
            }

            if (!IsPostBack)
            {
                CargarDatos();
                string defaultIdioma = "Español";
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

        private void CargarIdioma(ControlCollection controles)
        {
            foreach (Control control in controles)
            {
                if (control.HasControls())
                {
                    CargarIdioma(control.Controls);
                }
                else
                {
                    IdiomaHelper.Traducir(control);
                }
            }
        }

        private void CargarDatos()
        {
            ComboIdioma.DataSource = null;
            ComboIdioma.DataSource = GestionarIdioma.getInstance().Listar();
            ComboIdioma.DataBind();
        }

        protected void ComboIdioma_Change(object sender, EventArgs e)
        {
            GrabarCookieIdioma(ComboIdioma.SelectedValue);
            CambiarIdioma(ComboIdioma.SelectedValue);
        }

        public void LinkCerrar_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            GestionarSesion.getInstance().CerrarSesion();
            LinkLogin.Visible = true;
            LinkCerrar2.Visible = false;
            FormsAuthentication.SignOut();
            Response.Redirect("/index.aspx");
        }

        protected void PermisosMenu()
        {
            GestionarPermisos permisosbll = new GestionarPermisos();
            BE.Usuario usr = GestionarSesion.getInstance().Usuario;
            LinkAdministracion.Visible = false;
            if (usr != null)
            {
                if (permisosbll.TieneAdmin())
                {
                    LinkAdministracion.Visible = true;
                }
            }
        }


    }
}