using BEFuncional;
using iTextSharp.text.pdf;
using System;
using System.IO;

namespace Util
{
    public class GeneradorPDF
    {
        private string fileName;
        string raizApp;
        string template;

        public GeneradorPDF(string fileName)
        {
            raizApp = AppDomain.CurrentDomain.BaseDirectory + @"\";
            template = raizApp + "plantilla.pdf";
            this.fileName = fileName;
        }

        public void LeerTemplate(Consulta consulta)
        {

            string textoPatologias = ArmarCuerpoPatologias(consulta);
            string segundaPatologia = ContarLineas(textoPatologias, 7);
            string textoTRatamientos = ArmarCuerpoTratamientos(consulta);
            string segundaTratamientos = ContarLineas(textoTRatamientos, 26);

            ArmarPagina(consulta.Paciente.Dni.ToString(),
                         consulta.Paciente.Nombre + " " + consulta.Paciente.Apellido,
                         consulta.Fecha.ToString("dd/MM/yyyy"),
                         consulta.Resumen,
                         textoPatologias,
                         textoTRatamientos);
        }

        private void ArmarPagina(string dni, string nombre, string fecha, string resumen, string textoPatologias, string textoTRatamientos)
        {
            try
            {
                PdfReader pdfReader = new PdfReader(template);
                PdfStamper pdfStamper = new PdfStamper(pdfReader, new FileStream(fileName, FileMode.Create));

                AcroFields pdfFormFields = pdfStamper.AcroFields;
                pdfFormFields.SetField("DNI", dni);
                pdfFormFields.SetField("Nombre", nombre);
                pdfFormFields.SetField("Fecha", fecha);

                pdfFormFields.SetFieldProperty("Resumen", "setfflags", TextField.MULTILINE, null);
                pdfFormFields.SetField("Resumen", "Resumen: " + resumen);

                pdfFormFields.SetFieldProperty("ListaPatologias", "setfflags", TextField.MULTILINE, null);
                pdfFormFields.SetField("ListaPatologias", textoPatologias);

                pdfFormFields.SetFieldProperty("ListaTratamientos", "setfflags", TextField.MULTILINE, null);
                pdfFormFields.SetField("ListaTratamientos", textoTRatamientos);

                pdfStamper.FormFlattening = true;

                pdfStamper.Close();
                pdfReader.Close();
            }
            catch (Exception ex)
            {
                Log.Error(ex.ToString());
                throw;
            }
        }

        public string ArmarCuerpoPatologias(Consulta consulta)
        {
            string cadena = string.Empty;
            foreach (var detalle in consulta.Detalle)
            {
                if (detalle.Item is Patologia)
                {
                    cadena += GenerarDato(detalle.Item);
                    cadena += string.IsNullOrWhiteSpace(detalle.Observaciones) ? string.Empty : "Observaciones: " + detalle.Observaciones + "\n";
                }
            }
            return cadena;
        }

        public string ArmarCuerpoTratamientos(Consulta consulta)
        {
            string sTratamiento = "Tratamientos:\n";
            foreach (var detalle in consulta.Detalle)
            {
                if (detalle.Item is Tratamiento)
                {
                    sTratamiento += GenerarDato(detalle.Item);
                    sTratamiento += string.IsNullOrWhiteSpace(detalle.Observaciones) ? string.Empty : "Observaciones: " + detalle.Observaciones + "\n";
                    sTratamiento += string.IsNullOrWhiteSpace(detalle.Resultado) ? string.Empty : "Resultado: " + detalle.Resultado + "\n";
                }
            }
            string sEntrenamiento = "Entrenamientos:\n";
            foreach (var detalle in consulta.Detalle)
            {
                if (detalle.Item is Entrenamiento)
                {
                    sEntrenamiento += GenerarDato(detalle.Item);
                    sEntrenamiento += string.IsNullOrWhiteSpace(detalle.Observaciones) ? string.Empty : "Observaciones: " + detalle.Observaciones + "\n";
                    sEntrenamiento += string.IsNullOrWhiteSpace(detalle.Resultado) ? string.Empty : "Resultado: " + detalle.Resultado + "\n";
                }
            }
            string sEjercicio = "Ejercicios:\n";
            foreach (var detalle in consulta.Detalle)
            {
                if (detalle.Item is Ejercicio)
                {
                    sEjercicio += GenerarEjercicio((Ejercicio)detalle.Item);
                    sEjercicio += string.IsNullOrWhiteSpace(detalle.Observaciones) ? string.Empty : "Observaciones: " + detalle.Observaciones + "\n";
                    sEjercicio += string.IsNullOrWhiteSpace(detalle.Resultado) ? string.Empty : "Resultado: " + detalle.Resultado + "\n";
                }
            }
            string resultado = sTratamiento.Equals("Tratamientos:\n") ? string.Empty : sTratamiento + "\n";
            resultado += sEntrenamiento.Equals("Entrenamientos:\n") ? string.Empty : sEntrenamiento + "\n";
            resultado += sEjercicio.Equals("Ejercicios:\n") ? string.Empty : sEjercicio + "\n";
            return resultado;
        }

        public string GenerarDato(DatoBase item)
        {
            string cadena = "Nombre: " + item.Nombre + "\n";
            cadena += "Descripción: " + item.Descripcion + "\n";
            return cadena;
        }

        public string GenerarEjercicio(Ejercicio item)
        {
            string cadena = GenerarDato(item);
            cadena += "Cantidad: " + item.Cantidad + "\n";
            cadena += "Repeticiones: " + item.Repeticiones ;
            return cadena;
        }

        public string ContarLineas(string texto, int cantidad)
        {
            int largoLinea = 95;
            int largo = 0;
            int contar = 0;
            int total = 0;
            for (int i = 0; i < texto.Length; i++)
            {
                largo++;
                total++;
                char letra = texto[i];
                if (letra.Equals('\n'))
                {
                    contar++;
                    largo = 0;
                }
                if (largoLinea == largo)
                {
                    contar++;
                    largo = 0;
                }
                if (contar == cantidad)
                    return texto.Substring(total);
            }
            return string.Empty;
        }
    }
}
