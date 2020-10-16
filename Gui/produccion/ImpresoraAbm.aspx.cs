using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class ImpresoraAbm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IID.Txt.ReadOnly = true;
            if (!IsPostBack)
            {
                if (Session["ImpresoraId"] != null)
                {
                    int id = Convert.ToInt32(Session["ImpresoraId"].ToString());
                    CargarDatos(id);
                }
            }
        }

        private void CargarDatos(int id)
        {
            ImpresoraBLL bll = new ImpresoraBLL();
            BE.Impresora buscar = new BE.Impresora();
            buscar.Id = id;
            BE.Impresora dato = bll.Buscar(buscar);
            IID.Texto = dato.Id.ToString();
            INombre.Texto = dato.Nombre;
            IMarca.Texto = dato.Marca;
            IModelo.Texto = dato.Modelo;
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/produccion/Impresora.aspx");
        }
        protected void Baja_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(IID.Texto))
            {
                ImpresoraBLL bll = new ImpresoraBLL();
                BE.Impresora baja = new BE.Impresora();
                baja.Id = IID.getTextoInt();
                bll.Baja(baja);
            }
            Response.Redirect("/produccion/Impresora.aspx");
        }
        protected void Aceptar_Click(object sender, EventArgs e)
        {
            bool valido = INombre.Validar();
            valido = valido && IMarca.Validar();
            valido = valido && IModelo.Validar();
            if (valido)
            {
                ImpresoraBLL bll = new ImpresoraBLL();
                BE.Impresora nuevo = new BE.Impresora();
                nuevo.Nombre = INombre.Texto;
                nuevo.Marca = IMarca.Texto;
                nuevo.Modelo = IModelo.Texto;
                if (string.IsNullOrEmpty(IID.Texto))
                {
                    nuevo.Id = 0;
                    bll.Guardar(nuevo);
                }
                else
                {
                    nuevo.Id = IID.getTextoInt();
                    bll.Modificar(nuevo);
                }
                Response.Redirect("/produccion/Impresora.aspx");
            }
        }
    }
}