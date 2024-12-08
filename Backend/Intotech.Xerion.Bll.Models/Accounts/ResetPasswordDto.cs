using Intotech.Common.Bll.Interfaces; 
namespace Intotech.Xerion.Bll.Models.Accounts;
 
 public class ResetPasswordDto : ModelBase

 {
     public string email { get; set; }
     public string password { get; set; }
     public string token { get; set; }
 }
