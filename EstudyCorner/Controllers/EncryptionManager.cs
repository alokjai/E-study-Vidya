using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EstudyCorner.Controllers
{
    public class EncryptionManager
    {
        public string EncryptMyData(string PlainText)
        {
            string EncryptedText = "";
            int ASCII_Value;
            foreach (char ch in PlainText)
            {
                if (ch >= 65 && ch <= 90)
                    ASCII_Value = 90 - ch + 65;
                else if (ch >= 97 && ch <= 122)
                    ASCII_Value = ch + 2;
                else if (ch >= 48 && ch <= 57)
                    ASCII_Value = 57 - ch + 48;
                else
                    ASCII_Value = ch;
                EncryptedText = EncryptedText + (char)ASCII_Value;
            }
            return EncryptedText;
        }
    }
}