﻿using BLL;
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
        BE.Usuario usr = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            LblContrasenia.Txt.TextMode = TextBoxMode.Password;
            LblContraseniaRepetir.Txt.TextMode = TextBoxMode.Password;
            if (Session["UsuarioId"] != null)
            {
                string id = Session["UsuarioId"].ToString();
                usr = GestionarUsuario.Listar().Where(u => u.Login.Equals(id)).First();
            }
            else
            {
                LblRegistroUsuario.Visible = true;
            }
            if (!IsPostBack)
            {
                CargarDatos();
                LblModificarUsuario.Visible = true;
                LblContrasenia.Visible = false;
                LblContraseniaRepetir.Visible = false;
                LblContrasenia.EsValidado = false;
                LblContraseniaRepetir.EsValidado = false;
            }
        }

        private void CargarDatos()
        {
            LblUsuario.Texto = usr.Login;
            LblCorreo.Texto = usr.Correo;
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
            bool valido = LblUsuario.Validar();

            if (usr == null)
            {
                if (!LblContrasenia.Texto.Equals(LblContraseniaRepetir.Texto))
                {
                    LblContraseniaRepetir.NoValido();
                    return;
                }
                else LblContraseniaRepetir.Valido();
                valido = valido && LblContrasenia.Validar();
                valido = valido && LblCorreo.ValidarRegex(ListaRegex.Email);
            }

            valido = valido && INombre.Validar();
            valido = valido && LblApellido.Validar();
            valido = valido && LblDni.Validar();
            if (valido)
            {
                BE.Usuario usr2 = new BE.Usuario();
                usr2.Login = LblUsuario.Texto;
                usr2.Password = LblContrasenia.Texto;
                usr2.Correo = LblCorreo.Texto;
                usr2.Nombre = INombre.Texto;
                usr2.Apellido = LblApellido.Texto;
                usr2.Dni = LblDni.getTextoInt();
                if (usr == null)
                    GestionarUsuario.Guardar(usr2);
                else
                {
                    GestionarUsuario.Modificar(usr2, true);
                }
                Response.Redirect("/sistema/ListaUsuarios.aspx");
            }
        }
    }
}