using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EstudyCorner.Models;
using EstudyCorner.App_Start;
using System.Web.Security; // for logout
using System.IO;

namespace EstudyCorner.Controllers
{
    [SessionTimeOut]
    public class StudentZoneController : Controller
    {

        EstudyCornerEntities db = new EstudyCornerEntities();

        EncryptionManager EncryObj = new EncryptionManager();




        // GET: StudentZone
        public ActionResult StudentSection()
        {
            SnamePic();

            return View();

        }

        [NonAction]
        void SnamePic()
        {
            string SiD = Session["uid"].ToString();
            registration rg = db.registrations.SingleOrDefault(x => x.emailID == SiD);
            if (rg.picName.Length > 0)
            {
                ViewBag.StudentPic = "/Content/UserPics/" + rg.picName;
            }
            else
            {
                if (rg.gender == "Male")
                    ViewBag.PicName = "/Content/Images/default_male.png";
                else
                    ViewBag.PicName = "/Content/Images/default_female.png";
            }
            ViewBag.SName = rg.name;

        }

        [HttpGet]

        public ActionResult ChangePass()
        {
            SnamePic();

            return View();

        }

        [HttpPost]

        public ActionResult ChangePass(string CurrentPass, string NewPass, string confPass)
        {
            SnamePic();
            string msg = "";
            if (NewPass == confPass)
            {
                string SessID = Session["uid"].ToString();
                string currentpass = EncryObj.EncryptMyData(CurrentPass);
                login lg = db.logins.SingleOrDefault(x => x.userID == SessID && x.pass == currentpass);
                if (lg != null)
                {
                    string Enewpass = EncryObj.EncryptMyData(NewPass);
                    lg.pass = Enewpass;
                    db.SaveChanges();
                    msg = "Your password updated successfully.";
                }
                else
                {
                    msg = "Invalid current password.Please try again.";
                }

            }
            else
            {
                msg = "New password & Confirm password Not be Match, Please Try Again";
            }


            ViewBag.Result = msg;


            return View();

        }

        [HttpGet]

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            return RedirectToAction("Login", "Home");
        }

        [HttpGet]
        public ActionResult StdProfile()
        {
            SnamePic();
            string Sid = Session["uid"].ToString();
            registration reg = db.registrations.SingleOrDefault(x => x.emailID == Sid);



            return View(reg);
        }

        [HttpPost]
        public ActionResult StdProfile(registration rg)
        {
            SnamePic();
            string Sid = Session["uid"].ToString();
            registration Reg = db.registrations.SingleOrDefault(x => x.emailID == Sid);
            Reg.name = rg.name;
            Reg.Fname = rg.Fname;
            Reg.Qualification = rg.Qualification;
            Reg.college = rg.college;
            Reg.course_year = rg.course_year;
            Reg.mobno = rg.mobno;
            Reg.training_name = rg.training_name;
            Reg.branch = rg.branch;

            // Checking for new file upload...
            HttpPostedFileBase myfile = Request.Files["pic"];
            string resultmsg = "";
            if (myfile.ContentLength > 0)
            {
                string ext = myfile.FileName.Substring(myfile.FileName.LastIndexOf('.')).ToUpper();
                if (ext == ".PNG" || ext == ".JPG" || ext == ".JPEG")
                {
                    string folderPath = Server.MapPath("/content/UserPics");
                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);
                    string myfilename = Path.GetRandomFileName() + myfile.FileName;
                    myfile.SaveAs(folderPath + "/" + myfilename);
                    Reg.picName = myfilename;
                }
                else
                    resultmsg = "Invalid image type.Please choose valid image.";
            }
            if (resultmsg.Length == 0)
            {
                db.SaveChanges();
                resultmsg = "Your profile is updated successfully.";
            }
            ViewBag.msg = resultmsg;


            Reg = db.registrations.SingleOrDefault(x => x.emailID == Sid);
            SnamePic();
            return View(Reg);
        }
        [HttpGet]
        public ActionResult Feedback()
        {
            SnamePic();
            return View();
        }

        [HttpPost]
        public ActionResult Feedback(StdFeedback stdfeed)
        {
            SnamePic();
            try
            {
                stdfeed.FeedbackDt = DateTime.Now;
                stdfeed.userID = Session["uid"].ToString();
                db.StdFeedbacks.Add(stdfeed);
                db.SaveChanges();
                ViewBag.res = "Your Valuable Feedback Saved Successfully";
            }
            catch
            {
                ViewBag.res = "Sorry! we are unable to save your feedback.";
            }


            return View();


        }

        [HttpGet]

        public ActionResult Upload()
        {
            SnamePic();

            return View();

        }

        [HttpPost]

        public ActionResult Upload(StdUpload up)
        {
            SnamePic();
            HttpPostedFileBase myfile = Request.Files["fileUP"];
            string msg = "";
            if (myfile.ContentLength > 0)
            {
                string ext = myfile.FileName.Substring(myfile.FileName.LastIndexOf(".")).ToUpper();
                if (ext == ".PNG" || ext == ".JPG" || ext == ".JPEG" || ext == ".DOC" || ext == ".PDF" || ext == ".ZIP")
                {
                    string folderPath = Server.MapPath("/Content/StdTask");
                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);
                    string myfilename = Path.GetRandomFileName() + ext;
                    myfile.SaveAs(folderPath + "/" + myfilename);
                    up.filename = myfilename;
                    up.uploadDT = DateTime.Now;
                    db.StdUploads.Add(up);
                    db.SaveChanges();
                    msg = "File Uploaded Successfully";
                }
                else
                {
                    msg = "Invalid File Type. Please Choose valid file ";
                }
            }
            else
            {
                msg = "Choose File to upload";
            }
            ViewBag.Msg = msg;

            return View();

        }

        [HttpGet]

        public ActionResult Discussion()
        {
            SnamePic();
            List<Dquestion> lst = db.Dquestions.OrderByDescending(x => x.Qid).ToList();
            return View(lst);

        }

        [HttpPost]

        public ActionResult Discussion(Dquestion dq)
        {
            SnamePic();

            try
            {
                dq.askDate = DateTime.Now;
                dq.userID = Session["uid"].ToString();
                db.Dquestions.Add(dq);
                db.SaveChanges();
                ViewBag.msg = "Your post saved successfully.";
            }
            catch
            {
                ViewBag.msg = "Sorry! unable to save your post.";
            }
            List<Dquestion> lst = db.Dquestions.OrderByDescending(x => x.Qid).ToList();
            return View(lst);

        }
        [HttpGet]

        public ActionResult PostAnswer()
        {
            SnamePic();
            Session["Qid"] = Request.QueryString["Qid"];
            return View();
        }
        [HttpPost]

        public ActionResult PostAnswer(DAnswer ans)
        {
            SnamePic();
            try
            {
                ans.QuesID = int.Parse(Session["Qid"].ToString());
                ans.ansDATE = DateTime.Now;
                ans.userID = Session["uid"].ToString();
                db.DAnswers.Add(ans);
                db.SaveChanges();
                ViewBag.msg = "Your reply posted successfully.";

            }
            catch
            {
                ViewBag.msg = "Sorry!Your reply not posted ";
            }

            return View();

        }
        [HttpGet]
        public ActionResult ShowAnswer(int qid)
        {
            SnamePic();
            List<DAnswer> lst = db.DAnswers.Where(x => x.QuesID == qid).OrderByDescending(x => x.AnsID).ToList();
            return View(lst);
        }

        [HttpGet]
        public ActionResult TodayTask()
        {
            SnamePic();
            List<assignment> lst = db.assignments.OrderByDescending(x => x.assignID).ToList();
            return View(lst);
        }
        [HttpGet]
        public ActionResult DownloadSoft()
        {
            SnamePic();
            List<Softupload> lst = db.Softuploads.OrderByDescending(x => x.SerialNo).ToList();
            return View(lst);
        }

        [HttpGet]
        public ActionResult Library()
        {
            SnamePic();
            List<Library> lst = db.Libraries.OrderByDescending(x => x.BookId).ToList();
            return View(lst);
        }

        [HttpGet]
        public ActionResult StudyMat()
        {
            SnamePic();
            List<StudyMaterial> lst = db.StudyMaterials.OrderByDescending(x => x.StdMatID).ToList();
            return View(lst);
        }

       

        [HttpGet]
        public ActionResult Shared()
        {
            SnamePic();
            return View();
        }

        [HttpGet]
        public ActionResult Leave()
        {
            SnamePic();

            return View();
        }

        [HttpPost]
        public ActionResult Leave(LeaveApp La)
        {
            SnamePic();
            HttpPostedFileBase myfile = Request.Files["Appli"];
            string msg = "";
            if (myfile.ContentLength > 0)
            {
                string ext = myfile.FileName.Substring(myfile.FileName.LastIndexOf(".")).ToUpper();
                if (ext == ".PDF" || ext == ".ZIP" || ext == ".JPG" || ext == ".JPEG" || ext == ".DOC")
                {
                    string folderPath = Server.MapPath("/Content/Application");
                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);
                    string myfilename = Path.GetRandomFileName() + ext;
                    myfile.SaveAs(folderPath + "/" + myfilename);
                    La.FileName= myfilename;
                    La.FileType = ext;
                    La.AddedON = DateTime.Now;
                    db.LeaveApps.Add(La);
                    db.SaveChanges();
                    msg = "Aplication Uploaded Successfully";
                }
                else
                {
                    msg = "Invalid File Type. Please Choose valid file ";
                }
            }
            else
            {
                msg = "Choose File to upload";
            }
            ViewBag.Msg = msg;
            return View();
            
        }



    }
}