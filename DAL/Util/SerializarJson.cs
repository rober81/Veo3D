using Newtonsoft.Json;
using System;
using System.IO;

namespace Util
{
    public class SerializarJson
    {
        public static string Serializar(Object objeto)
        {
            string resultado = JsonConvert.SerializeObject(objeto);
            return resultado;
        }
        public static T DesSerializar<T>(string mensaje)
        {
            T resultado = JsonConvert.DeserializeObject<T>(mensaje);
            return resultado;
        }

        public static T DesSerializar<T>(StreamReader file)
        {
            JsonSerializer serializer = new JsonSerializer();
            return (T)serializer.Deserialize(file, typeof(T));
        }
    }
}
