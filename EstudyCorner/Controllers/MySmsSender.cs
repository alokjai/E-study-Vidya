using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;

namespace EstudyCorner.Controllers
{
    public class MySmsSender
    {
        string Userid = "kkmishra";
        string SenderId="KSSCKT", Password= "5a78c161adXX";
        public bool SendSMS(string MobileNo, string Message)
        {
            try
            {
                string ApiURL = "http://t.160smsalert.com/submitsms.jsp?user=" + Userid
                    + "&key=" + Password + "&mobile=" + MobileNo + "&message=" + Message
                    + "&senderid=" + SenderId + "&accusage=1";
                WebClient wc = new WebClient();
                string res = wc.DownloadString(ApiURL);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public  int GetOTP()
        {
            int OTP;
            Random r = new Random();
            OTP = r.Next(10000, 99999);
            return OTP;
        }


    }
}