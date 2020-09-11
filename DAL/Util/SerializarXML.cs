using System;
using System.IO;
using System.Xml.Serialization;

namespace Util
{
    public class SerializarXML
    {
        public static string Serializar<T>(T objeto)
        {
            XmlSerializer serializador = new XmlSerializer(objeto.GetType());
            using (StringWriter textWriter = new StringWriter())
            {
                serializador.Serialize(textWriter, objeto);
                return textWriter.ToString();
            }
        }
        public static T DesSerializar<T>(string mensaje)
        {
            XmlSerializer serializador = new XmlSerializer(typeof(T));
            T resultado;
            using (TextReader reader = new StringReader(mensaje))
            {
                resultado = (T) serializador.Deserialize(reader);
            }
            return  resultado;
        }

        public static T DesSerializar<T>(StreamReader file)
        {
            XmlSerializer serializador = new XmlSerializer(typeof(T));
            return (T)serializador.Deserialize(file);
        }
    }
}
