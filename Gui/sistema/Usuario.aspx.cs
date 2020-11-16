using BLL;
using Gui.controles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class Usuario : System.Web.UI.Page
    {
        GestionarUsuario usrbll = new GestionarUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            LblContrasenia.Txt.TextMode = TextBoxMode.Password;
            LblContraseniaRepetir.Txt.TextMode = TextBoxMode.Password;
            if (!IsPostBack)
            {
                if (Session["UsuarioId"] != null)
                {
                    string usr = Session["UsuarioId"].ToString();
                    CargarDatos(usr);
                }
            }
        }

        private void CargarDatos(string id)
        {
            BE.Usuario usr = null;
            List<BE.Usuario> lista = GestionarUsuario.Listar();
            foreach (var item in lista)
            {
                if (item.Login.Equals(id))
                {
                    usr = item;
                }
            }
            if (usr == null) return;
            LblUsuario.Texto = usr.Login;
            LblCorreo.Texto = usr.Correo;
            LblContrasenia.Texto = usr.Password;
            LblContraseniaRepetir.Texto = usr.Password;
            INombre.Texto = usr.Nombre;
            LblApellido.Texto = usr.Apellido;
            LblDni.Texto = usr.Dni.ToString();
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/sistema/ListaUsuarios.aspx");
        }

        protected void Aceptar_Click(object sender, EventArgs e)
        {
            if (!LblContrasenia.Texto.Equals(LblContraseniaRepetir.Texto))
            {
                LblContraseniaRepetir.NoValido();
                return;
            }
            else LblContraseniaRepetir.Valido();

            bool valido = LblUsuario.Validar();
            valido = valido && LblContrasenia.Validar();
            valido = valido && LblCorreo.ValidarRegex(ListaRegex.Email);
            valido = valido && INombre.Validar();
            valido = valido && LblApellido.Validar();
            valido = valido && LblDni.Validar();
            if (valido)
            {
                BE.Usuario usr = new BE.Usuario();
                usr.Login = LblUsuario.Texto;
                usr.Password = LblContrasenia.Texto;
                usr.Correo = LblCorreo.Texto;
                usr.Nombre = INombre.Texto;
                usr.Apellido = LblApellido.Texto;
                usr.Dni = LblDni.getTextoInt();
                GestionarUsuario.Guardar(usr);
                Response.Redirect("/index.aspx");
            }
        }
    }
}