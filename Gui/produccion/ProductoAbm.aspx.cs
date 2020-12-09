using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gui.produccion
{
    public partial class ProductoAbm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PID.Txt.ReadOnly = true;
            if (!IsPostBack)
            {
                if (Session["ProductoId"] != null)
                {
                    int id = Convert.ToInt32(Session["ProductoId"].ToString());
                    CargarDatos(id);
                }
            }
        }

        private void CargarDatos(int id)
        {
            ProductoBLL bll = new ProductoBLL();
            BE.Producto b = new BE.Producto();
            b.Id = id;
            BE.Producto dato = bll.Buscar(b);
            PID.Texto = dato.Id.ToString();
            PNombre.Texto = dato.Nombre;
            PArchivo.Texto = dato.Archivo;
            PCantidadMaterial.Texto = dato.CantidadMaterial.ToString();
            PTiempoImpresion.Texto = dato.TiempoImpresion.ToString();
            PImagen.Texto = dato.Imagen;
            PDescripcion.Texto = dato.Descripcion;
            PTipo.Texto = dato.Tipo;
            PCalificacion.Texto = dato.Calificacion.ToString();
            PPrecio.Texto = dato.Precio.ToString("#.00");
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/produccion/Producto.aspx");
        }
        protected void Baja_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(PID.Texto))
            {
                ProductoBLL bll = new ProductoBLL();
                BE.Producto baja = new BE.Producto();
                baja.Id = Convert.ToInt32(PID.Texto);
                bll.Baja(baja);
            }
            Response.Redirect("/produccion/Producto.aspx");
        }
        protected void Aceptar_Click(object sender, EventArgs e)
        {
            bool valido = PNombre.Validar();
            valido = valido && PArchivo.Validar();
            valido = valido && PCantidadMaterial.Validar();
            valido = valido && PTiempoImpresion.Validar();
            valido = valido && PImagen.Validar();
            valido = valido && PDescripcion.Validar();
            valido = valido && PTipo.Validar();
            valido = valido && PCalificacion.Validar();
            valido = valido && PPrecio.Validar();
            if (valido)
            {
                ProductoBLL bll = new ProductoBLL();
                BE.Producto nuevo = new BE.Producto();
                nuevo.Nombre = PNombre.Texto;
                nuevo.Archivo = PArchivo.Texto;
                nuevo.CantidadMaterial = PCantidadMaterial.getTextoInt();
                nuevo.TiempoImpresion = PTiempoImpresion.getTextoInt();
                nuevo.Imagen = PImagen.Texto;
                nuevo.Descripcion = PDescripcion.Texto;
                nuevo.Tipo = PTipo.Texto;
                nuevo.Calificacion = PCalificacion.getTextoInt();
                nuevo.Precio = Convert.ToDecimal(PPrecio.Texto);
                int salida;
                if (string.IsNullOrEmpty(PID.Texto))
                {
                    nuevo.Id = 0;
                    salida = bll.Guardar(nuevo);
                }
                else
                {
                    nuevo.Id = PID.getTextoInt();
                    salida = bll.Modificar(nuevo);
                }
                if (salida == 1)
                    Response.Redirect("/produccion/Producto.aspx");
                else
                    Mensaje.ErrorMsg();
            }
        }
    }
}