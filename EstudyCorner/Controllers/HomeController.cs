using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.IO;
using System.Web.Mvc.Routing;
using EstudyCorner.Models;


namespace EstudyCorner.Controllers
{
    public class HomeController : Controller
    {
        EstudyCornerEntities db = new EstudyCornerEntities();

        static string[] CaptchaImg = new string[2];
        CaptchaCode cp = new CaptchaCode();

        EncryptionManager EncryObj = new EncryptionManager();

        List<notification> GetTop5Notification()
        {
            List<notification> lst = db.notifications.OrderByDescending(x => x.notyID).Take(5).ToList();
            return lst;
        }

        // GET: Home
        public ActionResult Index()
        {
            List<notification> lst = GetTop5Notification();
            return View(lst);
        }
        [HttpGet]
        public ActionResult VisionMission()
        {
            List<notification> lst = GetTop5Notification();
            return View(lst);
        }

        public ActionResult Contact()
        {
            List<notification> lst = GetTop5Notification();
            return View(lst);
        }

        public ActionResult Login()
        {
            List<notification> lst = GetTop5Notification();
            return View(lst);
        }

        [HttpPost]
        public ActionResult Login(login lg)
        {
            string Epass = EncryObj.EncryptMyData(lg.pass);
            lg.pass = Epass;
            login ulg = db.logins.SingleOrDefault(x => x.userID == lg.userID && x.pass == lg.pass && x.Utype == "Student");
            if (ulg != null)
            {
                Session["uid"] = lg.userID;
                return RedirectToAction("StudentSection", "StudentZone");
            }
            else
            {
                ViewBag.msg = "Invalid userid or password.";
                
            }
            List<notification> lst = GetTop5Notification();
            return View(lst);
        }

        [HttpGet]
        public ActionResult Register()
        {
             CaptchaImg = cp.GetRandomCaptcha();
            ViewBag.CaptchaImage = CaptchaImg[1];
            List<notification> lst = GetTop5Notification();
            return View(lst);
        }
        [HttpPost]
        public ActionResult Register(registration rg)
        {
            string myfilename = "";
            string msg = "";
            string CaptchaCode = Request["Captcha"];
            if (CaptchaImg[0] == CaptchaCode)
            {
                HttpPostedFileBase myfile = Request.Files["pic"];
                if (myfile.ContentLength > 0)
                {
                    string ext = myfile.FileName.Substring(myfile.FileName.LastIndexOf('.')).ToUpper();
                    if (ext == ".PNG" || ext == ".JPG" || ext == ".JPEG")
                    {
                        string folderPath = Server.MapPath("/content/UserPics");
                        if (!Directory.Exists(folderPath))
                            Directory.CreateDirectory(folderPath);
                        myfilename = Path.GetRandomFileName() + myfile.FileName;
                        myfile.SaveAs(folderPath + "/" + myfilename);
                    }
                    else
                    {
                        msg = "Invalid image type.Please choose valid image.";
                    }

                }
                if(msg.Length==0)
                {
                    rg.regDate = DateTime.Now;
                    rg.picName = myfilename;
                    db.registrations.Add(rg);
                    db.SaveChanges();

                    login lg = new login();

                    lg.userID = rg.emailID;
                    
                    //Start:   Encryprion
                    string Plaintext = Request["pass"];
                    string Epass = EncryObj.EncryptMyData(Plaintext);
                    //End:   Encryprion

                    lg.pass = Epass;

                    lg.Utype = "Student";                   

                    db.logins.Add(lg);
                    db.SaveChanges();

                    msg = "Congratulations! you are registerd successfully.";


                }

            }
            else
            {
                msg = "Invalid captcha code. Please try again.";
            }
            ViewBag.Msg = msg;
            List<notification> lst = GetTop5Notification();
            return View(lst);
        }

        public ActionResult SaveEnquiry(enquiry eq)
        {
            var msg = "";
            try
            {
                eq.enquiry_dt = DateTime.Now;
                db.enquiries.Add(eq);
                db.SaveChanges();
                // Start: Sending SMS Alert
                string mymessage = "Hi " + eq.name +
                    ", Thanks for your enquiry, We will conttact you shortly.\n\tRegards-E-StudyVidya";
                MySmsSender ss = new MySmsSender();
                ss.SendSMS(eq.mobno, mymessage);
                // End: Sending SMS Alert
                msg = "Enquiry saved successfully.";
            }
            catch
            {
                msg = "Sorry! Unable to save enquiry.";
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }

        public ActionResult RefreshCaptchaCode()
        {
            CaptchaImg = cp.GetRandomCaptcha();
            var imgpath = "/Content/CaptchaImg/" + CaptchaImg[1];
            return Json(imgpath, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Manage()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Manage(string AdminId, string Pass)
        {
            string Epass = EncryObj.EncryptMyData(Pass);
            
            login ulg = db.logins.SingleOrDefault(x => x.userID == AdminId && x.pass == Epass && x.Utype == "Admin");
            if (ulg != null)
            {
                Session["Adminid"] = AdminId;
                return RedirectToAction("Dashboard", "AdminZone");
            }
            else
            {
                ViewBag.msg = "Invalid userid or password.";
                
            }
            return View();

        }
        [HttpGet]
        public ActionResult ForgetPass()
        {
            List<notification> lst = GetTop5Notification();
            return View(lst);
           
        }
       
        [HttpPost]
        public ActionResult ForgetPass(string emailID, string mobno)
        {
            var msg="";
            try
            {
                registration ulg = db.registrations.SingleOrDefault(x => x.emailID == emailID && x.mobno == mobno );
                if(ulg != null)
                {
                    MySmsSender ss = new MySmsSender();
                    int otp = ss.GetOTP();
                    Session["otp"] = otp;
                   string message = "Hi "+ulg.name+", Someone has tried to recover your password in E-study Vidya Portal." +
                        " If that person is you then enter this OTP: "+otp+" otherwise ignore this message.";
                    ss.SendSMS(mobno, message);
                    msg = "SUCCESS";
                }
                else
                {
                    msg = "FAIL";
                }
            }
            catch
            {
                msg = "ERROR";
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult VerifyOTP()
        {
            List<notification> lst = GetTop5Notification();
            return View(lst);
        }

        [HttpPost]
        public ActionResult VerifyOTP(int OTP)
        {
            var msg = "";
            string OrigOTP = Session["otp"].ToString();
            if (string.Compare(OrigOTP, OTP.ToString()) == 0)
                msg = "SUCCESS";
            else
                msg = "FAIL";
            return Json(msg, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult SetNewPass()
        {
            List<notification> lst = GetTop5Notification();
            return View(lst);
        }
        [HttpPost]
        public ActionResult SetNewPass(string Email, string Pass)
        {
            var msg = "";
            string Epass = EncryObj.EncryptMyData(Pass);
            login lg = db.logins.SingleOrDefault(x => x.userID == Email);
            lg.pass = Epass;
            
            db.SaveChanges();
            if (lg != null)
            {
                msg = "SUCCESS";
            }
            else
                msg = "FAIL";

            return Json(msg, JsonRequestBehavior.AllowGet);
           
        }


        [HttpGet]
        public ActionResult Personal()
        {
            return View();
        }

    }
}