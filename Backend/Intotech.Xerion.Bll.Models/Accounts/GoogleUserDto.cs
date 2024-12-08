using Intotech.Common.Bll.Interfaces; 
namespace Intotech.Xerion.Bll.Models.Accounts;
 
 public class GoogleUserDto : ModelBase

 {
     public string id { get; set; }
     public string email { get; set; }
     public bool verified_email { get; set; }
     public string name { get; set; }
     public string given_name { get; set; }
     public string picture { get; set; }
     public string locale { get; set; }
     public string Json { get; set; }
 }
