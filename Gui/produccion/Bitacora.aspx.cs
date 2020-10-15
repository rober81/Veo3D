using BLL;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class Bitacora : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GestionarBitacora gb = new GestionarBitacora();
                cargarTabla(gb.Listar());
                LtFechaDesde.Texto = DateTime.Today.AddMonths(-1).ToString("dd/MM/yyyy");
                LtFechaHasta.Texto = DateTime.Today.ToString("dd/MM/yyyy");
            }
            LtFechaDesde.EsFecha = true;
            LtFechaHasta.EsFecha = true;
        }

        private void cargarTabla(List<BE.Bitacora> lista)
        {
            GridView1.DataSource = null;
            GridView1.DataSource = lista;
            GridView1.DataBind();
        }

        protected void Btn_Click(object sender, EventArgs e)
        {
            List<BE.Bitacora> temp;
            GestionarBitacora gb = new GestionarBitacora();
            if (LtFechaDesde.Validar() && LtFechaHasta.Validar())
            {
                if (string.IsNullOrWhiteSpace(LblUsuario.Texto))
                    temp = gb.ListarFecha(LtFechaDesde.GetTextoDate(), LtFechaHasta.GetTextoDate());
                else
                    temp = gb.ListarFechaUsuario(LtFechaDesde.GetTextoDate(), LtFechaHasta.GetTextoDate(), LblUsuario.Texto);

                if (temp != null)
                    cargarTabla(temp);
            }
        }
    }
}