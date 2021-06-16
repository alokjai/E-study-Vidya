using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EstudyCorner.App_Start
{
    public class AdminLogoutAttribute: ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpContext ctx = HttpContext.Current;
            if (HttpContext.Current.Session["Adminid"] == null)
            {
                filterContext.Result = new RedirectResult("~/Home/Manage");
                return;
            }

            base.OnActionExecuting(filterContext);
        }
    }
}