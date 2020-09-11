using System;
using System.Collections.Generic;
using System.Text;

namespace Util
{
    public class DigitoVerificador
    {
        public static int CalcularDV(string texto)
        {
            string Paridad = string.Empty;
            int Sum = 0;
            byte[] Reg = Encoding.UTF8.GetBytes(texto);
            for (int pos = Reg.Length - 1; pos >= 0; pos--)
            {
                Sum += ObtenerDigito(Reg[pos], pos);
            }
            int d = int.Parse(Sum.ToString().Substring(Sum.ToString().Length - 1));
            return (d == 0) ? 0 : (10 - d);
        }

        private static int ObtenerDigito(byte Digito, int Pos)
        {
            string Resto = string.Empty;
            Resto = (Pos % 2 == 0) ? "P" : "I";
            if (Resto == "P")
            {
                Digito *= 2;
            }

            if (Digito >= 10)
            {
                int Resultado = 0;
                switch (Digito.ToString().Length)
                {
                    case 2:
                        Resultado = int.Parse(Digito.ToString().Substring(0, 1)) +
                            int.Parse(Digito.ToString().Substring(1, 1));
                        break;
                    case 3:
                        Resultado = int.Parse(Digito.ToString().Substring(0, 1)) +
                            int.Parse(Digito.ToString().Substring(1, 1)) +
                            int.Parse(Digito.ToString().Substring(2, 1));
                        break;
                }
                if (Resultado > 10)
                {
                    Resultado = int.Parse(Resultado.ToString().Substring(0, 1)) +
                        int.Parse(Resultado.ToString().Substring(1, 1));
                }
                return Resultado;
            }
            return Digito;
        }
    }
}
