﻿using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui
{
    public partial class Resumen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CompraFinalizada"] != null)
                {
                    BE.Compra item = (BE.Compra)Session["CompraFinalizada"];
                    CargarDatos(item);
                }
            }
        }

        private void CargarDatos(BE.Compra parametro)
        {
            LblTitulo.Text = parametro.Personalizado.Producto.Nombre;
            LblTexto.Text = parametro.Personalizado.Producto.Descripcion;
            LblPrecio.Text = parametro.Personalizado.Producto.Precio.ToString("$#0.00");
            LblAnchoMontura.Texto = parametro.Personalizado.AnchoMontura;
            LblPuente.Texto = parametro.Personalizado.Puente;
            LblAnchoCristales.Texto = parametro.Personalizado.AnchoCristales;
            LblAlturaCristales.Texto = parametro.Personalizado.AlturaCristales;
            LblLongitudPatillas.Texto = parametro.Personalizado.LongitudPatillas;
            LblCalle.Texto = parametro.Calle;
            LblPuerta.Texto = parametro.Puerta;
            LblDepto.Texto = parametro.Depto;
            LblLocalidad.Texto = parametro.Localidad;
            LblProvincia.Texto = parametro.Provincia;
        }

        protected void Volver_Click(object sender, EventArgs e)
        {
            Response.Redirect("/index.aspx");
        }
    }
}