using Intotech.Common.Bll.Interfaces; 
namespace Intotech.Xerion.Bll.Models.Accounts;
 
 public class ResetPasswordConfirmDto : ModelBase

 {
     public string Email { get; set; }
     public string Password { get; set; }
     public int Code { get; set; }
 }
