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
    
    public partial class StdUpload
    {
        public int uploadID { get; set; }
        public string topic { get; set; }
        public string description { get; set; }
        public string filename { get; set; }
        public string userId { get; set; }
        public Nullable<System.DateTime> uploadDT { get; set; }
    
        public virtual registration registration { get; set; }
    }
}