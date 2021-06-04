using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace WebApplication4.src.Helper
{
    public static class Utilitarios
    {
        public static int divideTamanho(int tamanho)
        {
            return tamanho / 1024;
        }

        public static byte[] fileStreamByte(Stream inpStream, int tamanho)
        {
            byte[] fileData = null;
            using (var binaryReader = new BinaryReader(inpStream))
            {
                fileData = binaryReader.ReadBytes(tamanho);
            }
            return fileData;
        }

    }
}