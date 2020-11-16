using BLL;
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
    public partial class LabelTexto : UserControl
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

        private bool _esDecimal = false;
        public bool EsDecimal
        {
            get { return _esDecimal; }
            set { _esDecimal = value; }
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
            else if (EsDecimal)
                return ValidarDecimal();
            else if (EsFecha)
                return ValidarFecha();
            else
                return ValidarTexto();
        }

        public bool ValidarTexto()
        {
            if (string.IsNullOrWhiteSpace(Texto))
            {
                bool retorno = NoValido();
                txt.ToolTip = GestionarIdioma.getInstance().GetTexto("MsgObligatorio");
                return retorno;
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
                txt.ToolTip = GestionarIdioma.getInstance().GetTexto("MsgErrorNumero");
                return NoValido();
            }
        }

        public bool ValidarDecimal()
        {
            decimal resultado;
            if (decimal.TryParse(txt.Text, out resultado))
            {
                return Valido();
            }
            else
            {
                txt.ToolTip = GestionarIdioma.getInstance().GetTexto("MsgErrorNumero");
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
                txt.ToolTip = GestionarIdioma.getInstance().GetTexto("MsgErrorFecha");
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
                txt.ToolTip = GestionarIdioma.getInstance().GetTexto("MsgErrorFormato");
                return NoValido();
            }
        }

        public bool NoValido()
        {
            txt.BorderColor = Color.Red;
            txt.BorderWidth = 3;
            return false;
        }

        public bool Valido()
        {
            txt.BorderColor = ColorTranslator.FromHtml("#CED4DA");
            txt.BorderWidth = 1;
            return true;
        }

        public void DesHabilitar()
        {
            txt.Enabled = false;
        }

        public void Habilitar()
        {
            txt.Enabled = true;
        }

        public int getTextoInt()
        {
            int resultado = 0;
            int.TryParse(txt.Text, out resultado);
            return resultado;
        }

        public DateTime GetTextoDate()
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