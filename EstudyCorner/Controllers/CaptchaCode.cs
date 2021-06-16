using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
namespace EstudyCorner.Controllers
{
    public class CaptchaCode
    {
        string GetRandomCode()
        {
            char ch;
            string code = "";
            Random r = new Random();
            ch = (char)r.Next(65, 90);
            code = code + ch;
            ch = (char)r.Next(97, 110);
            code = code + ch;
            ch = (char)r.Next(49, 57);
            code = code + ch;
            ch = (char)r.Next(100, 122);
            code = code + ch;
            ch = (char)r.Next(70, 85);
            code = code + ch;
            ch = (char)r.Next(70, 90);
            code = code + ch;
            return code;
        }


        public string[] GetRandomCaptcha()
        {
            Bitmap bmp = new Bitmap(135, 40);
            Graphics g = Graphics.FromImage(bmp);
            g.Clear(Color.WhiteSmoke);  
            Pen greenPen = new Pen(Color.Maroon);
            SolidBrush sb = new SolidBrush(Color.Green);
            Font f = new Font("Cursive", 20, FontStyle.Strikeout);
            g.DrawRectangle(greenPen, 2, 2, 130, 35);  
            string CaptCode = GetRandomCode();
            g.DrawString(CaptCode, f, sb, 12, 4);  
            g.Flush();
            string folderPath = HttpContext.Current.Server.MapPath("/Content/CaptchaImg");
            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);
            string filename = Path.GetRandomFileName() + ".png";
            bmp.Save(folderPath + "/" + filename, ImageFormat.Png); 
            string[] arr = new string[2];
            arr[0] = CaptCode;
            arr[1] = filename;
            return arr;
        }
    }
}