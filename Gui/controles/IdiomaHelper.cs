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

            if (control.ID == "lbl")
            {
                LabelTexto ctr = (LabelTexto)control.Parent;
                ctr.Label = GestionarIdioma.getInstance().GetTexto(ctr.ID);
                return;
            }
            string tradu = GestionarIdioma.getInstance().GetTexto(control.ID);
            if (string.IsNullOrWhiteSpace(tradu))
                return;
            if (control is Label _lbl)
                _lbl.Text = tradu;
            if (control is HyperLink _link)
                _link.Text = tradu;
            if (control is Button _btn)
                _btn.Text = tradu;
        }
    }
}