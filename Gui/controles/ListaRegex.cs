using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gui.controles
{
    public class ListaRegex
    {
        public static string Cuit = @"^(20|23|27|30|33)([0-9]{9}|-[0-9]{8}-[0-9]{1})$";
        public static string Email = @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
        public static string Contrasenia = @" ^ (?=.*[A - Za - z])(?=.*\d)[A - Za - z\d]{8,}$";
    }
}