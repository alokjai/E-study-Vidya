using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;//for Logout
using EstudyCorner.Models;
using System.IO;
using EstudyCorner.App_Start;

namespace EstudyCorner.Controllers
{
    
    [AdminLogout]
    public class AdminZoneController : Controller
    {
        EstudyCornerEntities db = new EstudyCornerEntities();
        EncryptionManager EncryObj = new EncryptionManager();
        // GET: AdminZone
        public ActionResult Dashboard()
        {

            return View();
        }

        [HttpGet]
        public ActionResult SendSMS()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SendSMS(string mobno,string Message)
        {
            MySmsSender ss = new MySmsSender();
            bool x = ss.SendSMS(mobno, Message);
            if (x == true)
                ViewBag.msg = "SMS sent Successfully";
            else
                ViewBag.msg = "Sorry! unable to send sms";
                return View();
        }

        [HttpGet]
        public ActionResult Notification(string status)
        {
            if (status == "1")
                ViewBag.msg = "Notifiaction deleted Successfully.";
            List<notification> lst = db.notifications.OrderByDescending(x => x.notyID).ToList();
            return View(lst);
        }
        [HttpPost]
        public ActionResult Notification(notification n)
        {
            try
            {
                n.notydate = DateTime.Now;
                db.notifications.Add(n);
                db.SaveChanges();
                ViewBag.msg = "Notification saved successfully";
                
            }
            catch
            {
                ViewBag.msg = "Notification Not successful deliver";
                
            }
            List<notification> lst = db.notifications.
                 OrderByDescending(x => x.notyID).ToList();
            return View(lst);

        }
        [HttpGet]
        public ActionResult DeleteNotification(int notyid)
        {
            notification n = db.notifications.SingleOrDefault(x => x.notyID == notyid);
           db.notifications.Remove(n);     
            db.SaveChanges();
            return RedirectToAction("Notification","AdminZone","1");   
        }

        

        [HttpGet]
        public ActionResult EnquiryMgmt()
        {
            List<enquiry> enlst = db.enquiries.OrderByDescending(x => x.enquiryid).ToList();
                return View(enlst);
        }
        [HttpGet]
        public ActionResult FeedbackMgmt()
        {
            List<StdFeedback> FDlst = db.StdFeedbacks.OrderByDescending(x => x.FeedbackID).ToList();
            return View(FDlst);           
        }
        [HttpGet]
        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ChangePassword(string Current, string NPass,string CPass)
        {
            string msg = "";
            if (NPass == CPass)
            {
                
                string SessID = Session["Adminid"].ToString();
                string currentpass = EncryObj.EncryptMyData(Current);
                login lg = db.logins.SingleOrDefault(x => x.userID == SessID && x.pass == currentpass);
                if (lg != null)
                {
                    string Enewpass = EncryObj.EncryptMyData(NPass);
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
        public ActionResult StdRecord()
        {
            List<registration> reglst = db.registrations.OrderByDescending(x => x.regDate).ToList();
            return View(reglst);
        }
        [HttpGet]
        public ActionResult DeleteStudDetail( string stdID)
        {
            try
            {
                List<Dquestion> DQlst = db.Dquestions.Where(x =>x.userID == stdID).ToList();
                foreach (Dquestion dq in DQlst )
                {
                    db.Dquestions.Remove(dq);
                }

                List<DAnswer> DAlst = db.DAnswers.Where(x => x.userID == stdID).ToList();
                foreach (DAnswer dq in DAlst)
                {
                    db.DAnswers.Remove(dq);
                }

                IEnumerable<StdFeedback> lstf = db.StdFeedbacks.Where(x => x.userID == stdID).ToList();
                foreach (StdFeedback dq in lstf)
                {
                    db.StdFeedbacks.Remove(dq);
                }

                login lg = db.logins.SingleOrDefault(x => x.userID == stdID);
                db.logins.Remove(lg);

                registration reg = db.registrations.SingleOrDefault(x => x.emailID == stdID);
                db.registrations.Remove(reg);
                db.SaveChanges();
                TempData["msg"] = "Record deleted successfully.";
            }
            catch
            {
                TempData["msg"] = "Sorry! unable to delete record.";
            }
            return RedirectToAction("StdRecord","AdminZone");
        }
        [HttpGet]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            return RedirectToAction("Manage", "Home");
        }

        [HttpGet]
        public ActionResult AdminUpload()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AdminUpload(assignment am)
        {
            HttpPostedFileBase myfile = Request.Files["TaskUP"];
            string msg = "";
            if(myfile.ContentLength > 0)
            {
                string ext = myfile.FileName.Substring(myfile.FileName.LastIndexOf(".")).ToUpper();
                if(ext == ".PNG"|| ext == ".JPG" || ext == ".JPEG" || ext == ".DOC" || ext == ".PDF" || ext == ".ZIP")
                {
                    string folderPath = Server.MapPath("/Content/Assignment");
                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);
                    string myfilename = Path.GetRandomFileName() + ext;
                    myfile.SaveAs(folderPath + "/" + myfilename);
                    am.fileName = myfilename;
                    am.addedON = DateTime.Now;
                    db.assignments.Add(am);
                    db.SaveChanges();
                    msg = "Assignment Uploaded Successfully";
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

        public ActionResult DownloadMgt()
        {
            List<StdUpload> lst = db.StdUploads.OrderByDescending(x => x.uploadID).ToList();
            return View(lst);
        }

        [HttpGet]
        public ActionResult UploadSoft()
        {

            return View();

        }

        [HttpPost]
        public ActionResult UploadSoft(Softupload sft)
        {
            HttpPostedFileBase myfile = Request.Files["soft"];
            string msg = "";
            if (myfile.ContentLength > 0)
            {
                string ext = myfile.FileName.Substring(myfile.FileName.LastIndexOf(".")).ToUpper();
                if ( ext == ".EXE" || ext == ".ZIP")
                {
                    string folderPath = Server.MapPath("/Content/Software");
                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);
                    string myfilename = Path.GetRandomFileName() + ext;
                    myfile.SaveAs(folderPath + "/" + myfilename);
                    sft.SoftFile = myfilename;
                    sft.softDate = DateTime.Now;
                    db.Softuploads.Add(sft);
                    db.SaveChanges();
                    msg = "Software Uploaded Successfully";
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
        public ActionResult LibraryMgmt(string Status)
        {
            if(Status == "1")
                ViewBag.msg = "Book deleted Successfully.";
            List<Library> lst = db.Libraries.OrderByDescending(x => x.BookId).ToList();
            return View(lst);
        }

        [HttpPost]
        public ActionResult LibraryMgmt(Library lib)
        {
            string msg = "";
            try
            {
                HttpPostedFileBase myfile = Request.Files["Libre"];
                
                if (myfile.ContentLength > 0)
                {
                    string ext = myfile.FileName.Substring(myfile.FileName.LastIndexOf(".")).ToUpper();
                    if (ext == ".Doc" || ext == ".PDF" || ext == ".DOCX" || ext == ".PPT")
                    {
                        string folderPath = Server.MapPath("/Content/Libraries");
                        if (!Directory.Exists(folderPath))
                            Directory.CreateDirectory(folderPath);
                        string myfilename = Path.GetRandomFileName() + ext;
                        myfile.SaveAs(folderPath + "/" + myfilename);
                        lib.BookFileName = myfilename;
                        lib.AddedON = DateTime.Now;
                        db.Libraries.Add(lib);
                        db.SaveChanges();
                        msg = "Book Uploaded Successfully";
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
               
            }
            catch
            {
                msg = "Some Technical Problem to upload Book";  
            }
            ViewBag.Msg = msg;
            return View();
        }

        public ActionResult DeleteBook(int bookid)
        {
           Library lib = db.Libraries.SingleOrDefault(x => x.BookId == bookid);
            db.Libraries.Remove(lib);
            db.SaveChanges();
            return RedirectToAction("LibraryMgmt", "AdminZone", "1");
            
        }
        [HttpGet]
        public ActionResult DiscussionForum()
        {
            List<Dquestion> lst = db.Dquestions.OrderByDescending(x => x.Qid).ToList();
            return View(lst);
        }

        [HttpPost]
        public ActionResult DiscussionForum(Dquestion dq)
        {
            try
            {
                dq.askDate = DateTime.Now;
                dq.userID = Session["adminid"].ToString();
                db.Dquestions.Add(dq);
                db.SaveChanges();
                ViewBag.msg = "Your Post Posted succesfully";
            }
            catch
            {
                ViewBag.msg = "Sorry! unable to Post your Question";
            }
            List<Dquestion> Qlst = db.Dquestions.OrderByDescending(x => x.Qid).ToList();
            return View(Qlst);
        }

        [HttpGet]
        public ActionResult AdminPostanswer()
        {
            Session["Qid"] = Request.QueryString["Qid"];
            return View();
        }

        [HttpPost]
        public ActionResult AdminPostanswer(DAnswer ans)
        {
            try
            {
                ans.QuesID = int.Parse(Session["Qid"].ToString());
                ans.ansDATE = DateTime.Now;
                ans.userID = Session["Adminid"].ToString();
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
        public ActionResult AdminShowAnswer(int qid)
        {
            List<DAnswer> lst = db.DAnswers.Where(x => x.QuesID == qid).OrderByDescending(x => x.AnsID).ToList();
            return View(lst);
        }
        [HttpGet]
        public ActionResult StudyMatrialMgt()
        {
            return View();
        }


        [HttpPost]
        public ActionResult StudyMatrialMgt(StudyMaterial sm)
        {
            HttpPostedFileBase myfile = Request.Files["studyfile"];
            string msg = "";
            if (myfile.ContentLength > 0)
            {
                string ext = myfile.FileName.Substring(myfile.FileName.LastIndexOf(".")).ToUpper();
                if (ext == ".Doc" || ext == ".PDF" || ext == ".DOCX" || ext == ".PPT" || ext == ".JPG" || ext == ".JPEG" || ext == ".PNG")
                {
                    string folderPath = Server.MapPath("/Content/StudyMaterials");
                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);
                    string myfilename = Path.GetRandomFileName() + ext;
                    myfile.SaveAs(folderPath + "/" + myfilename);
                    sm.FileName = myfilename;
                    sm.FileType = ext;
                    sm.AddedON = DateTime.Now;
                    db.StudyMaterials.Add(sm);
                    db.SaveChanges();
                    msg = "Study Material Uploaded Successfully";
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
            ViewBag.res = msg; 
            return View();
        }
        [HttpGet]
        public ActionResult LeaveMgmt()
        {
            List<LeaveApp> lst = db.LeaveApps.OrderByDescending(x => x.AppliID).ToList();
            return View(lst);
        }

    }
}