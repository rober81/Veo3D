using BLL;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.controles
{
    public class IdiomaHelper
    {
        public static void Traducir(Control control)
        {
            if (control == null || control.ID == null)
                return;
            string traduccion = GestionarIdioma.getInstance().getTexto(control.ID);
            if (string.IsNullOrWhiteSpace(traduccion))
                return;

            if (control is ITextControl conTxt)
                conTxt.Text = traduccion;
            if (control is HyperLink conBtn)
                conBtn.Text = traduccion;
        }
    }
}