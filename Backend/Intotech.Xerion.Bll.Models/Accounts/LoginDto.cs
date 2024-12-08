using Intotech.Common.Bll.Interfaces; 
namespace Intotech.Xerion.Bll.Models.Accounts;
 
 public class LoginDto : ModelBase

 {
     public string Email { get; set; }
     public string Password { get; set; }
     public string Method { get; set; }
     public string Token { get; set; }
 }
