using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.controles
{
    public partial class LabelTexto : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (EsNumero)
                txt.TextMode = TextBoxMode.Number;

            if (EsFecha)
                txt.TextMode = TextBoxMode.Date;

            if (_desHabilitado)
                DesHabilitar();
        }

        private string _idioma;

        public string ClaveIdioma
        {
            get { return _idioma; }
            set { _idioma = value; }
        }

        public string Label
        {
            get { return lbl.Text; }
            set { lbl.Text = value; }
        }

        public string Texto
        {
            get { return txt.Text; }
            set { txt.Text = value; }
        }

        public Label Lbl
        {
            get { return lbl; }
            set { lbl = value; }
        }

        public TextBox Txt
        {
            get { return txt; }
            set { txt = value; }
        }

        private bool _esValidado = true;
        public bool EsValidado
        {
            get { return _esValidado; }
            set { _esValidado = value; }
        }

        private bool _esNumero = false;
        public bool EsNumero
        {
            get { return _esNumero; }
            set { _esNumero = value; }
        }

        private bool _esFecha = false;
        public bool EsFecha
        {
            get { return _esFecha; }
            set { _esFecha = value; }
        }

        private bool _desHabilitado;

        public bool DesHabilitado
        {
            get { return _desHabilitado; }
            set { _desHabilitado = value; }
        }


        public bool Validar()
        {
            if (!EsValidado)
                return true;
            else if (EsNumero)
                return ValidarNumero();
            else if (EsFecha)
                return ValidarFecha();
            else
                return ValidarTexto();
        }

        public bool ValidarTexto()
        {
            if (string.IsNullOrWhiteSpace(txt.Text))
            {
                txt.ToolTip = "Error el campo es obligatorio";
                return NoValido();
            }
            else
            {
                return Valido();
            }
        }

        public bool ValidarNumero()
        {
            int resultado;
            if (int.TryParse(txt.Text, out resultado))
            {
                return Valido();
            }
            else
            {
                txt.ToolTip = "Error no es número";
                return NoValido();
            }
        }

        public bool ValidarFecha()
        {
            try
            {
                DateTime.Parse(txt.Text);
                return Valido();
            }
            catch
            {
                txt.ToolTip = "Error no es fecha";
                return NoValido();
            }
        }

        public bool ValidarRegex(string reg)
        {
            if ((new Regex(reg)).IsMatch(txt.Text))
            {
                return Valido();
            }
            else
            {
                txt.ToolTip = "Error no cumple el formato";
                return NoValido();
            }
        }

        private bool NoValido()
        {
            txt.BorderColor = Color.Red;
            txt.BorderWidth = 3;
            return false;
        }

        private bool Valido()
        {
            txt.BorderColor = ColorTranslator.FromHtml("#CED4DA");
            txt.BorderWidth = 1;
            return true;
        }

        private void DesHabilitar()
        {
            txt.Enabled = false;
        }

        private void Habilitar()
        {
            txt.Enabled = true;
        }

        public int getTextoInt()
        {
            int resultado = 0;
            int.TryParse(txt.Text, out resultado);
            return resultado;
        }

        public DateTime getTextoDate()
        {
            return Convert.ToDateTime(txt.Text);
        }

        public void Limpiar()
        {
            txt.Text = string.Empty;
            Valido();
        }
    }
}