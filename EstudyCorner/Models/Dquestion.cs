//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EstudyCorner.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Dquestion
    {
        public int Qid { get; set; }
        public string question { get; set; }
        public string userID { get; set; }
        public Nullable<System.DateTime> askDate { get; set; }
    
        public virtual registration registration { get; set; }
    }
}