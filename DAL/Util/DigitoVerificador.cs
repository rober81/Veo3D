using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace Util
{
    public class DigitoVerificador
    {
        public static string CalcularDV(string param)
        {
            return getSHA1(param);
        }

        public static string getSHA1(string param)
        {
            SHA1CryptoServiceProvider sha1Obj = new SHA1CryptoServiceProvider();
            byte[] hacerHash = System.Text.Encoding.ASCII.GetBytes(param);
            hacerHash = sha1Obj.ComputeHash(hacerHash);
            string resultado = "";
            foreach (byte b in hacerHash)
                resultado += b.ToString("x2");
            return resultado;
        }
    }
}
