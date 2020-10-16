using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class MaterialAbm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MID.Txt.ReadOnly = true;
            if (!IsPostBack)
            {
                if (Session["MaterialId"] != null)
                {
                    int id = Convert.ToInt32(Session["MaterialId"].ToString());
                    CargarDatos(id);
                }
            }
        }

        private void CargarDatos(int id)
        {
            MaterialBLL bll = new MaterialBLL();
            BE.Material buscar = new BE.Material();
            buscar.Id = id;
            BE.Material dato = bll.Buscar(buscar);
            MID.Texto = dato.Id.ToString();
            MMarca.Texto = dato.Marca;
            MColor.Texto = dato.Color;
            MTipo.Texto = dato.Tipo;
            MPeso.Texto = dato.Peso.ToString();
            MMetros.Texto = dato.Metros.ToString();
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/produccion/Material.aspx");
        }
        protected void Baja_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(MID.Texto))
            {
                MaterialBLL bll = new MaterialBLL();
                BE.Material baja = new BE.Material();
                baja.Id = MID.getTextoInt();
                bll.Baja(baja);
            }
            Response.Redirect("/produccion/Material.aspx");
        }
        protected void Aceptar_Click(object sender, EventArgs e)
        {
            bool valido = MMarca.Validar();
            valido = valido && MColor.Validar();
            valido = valido && MTipo.Validar();
            valido = valido && MPeso.Validar();
            valido = valido && MMetros.Validar();
            if (valido)
            {
                MaterialBLL bll = new MaterialBLL();
                BE.Material nuevo = new BE.Material();
                nuevo.Marca = MMarca.Texto;
                nuevo.Color = MColor.Texto;
                nuevo.Tipo = MTipo.Texto;
                nuevo.Peso = MPeso.getTextoInt();
                nuevo.Metros = MMetros.getTextoInt();
                if (string.IsNullOrEmpty(MID.Texto))
                {
                    nuevo.Id = 0;
                    bll.Guardar(nuevo);
                } else
                {
                    nuevo.Id = MID.getTextoInt();
                    bll.Modificar(nuevo);
                }
                Response.Redirect("/produccion/Material.aspx");
            }
        }
    }
}