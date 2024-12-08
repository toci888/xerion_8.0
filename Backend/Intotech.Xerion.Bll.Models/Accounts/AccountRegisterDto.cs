using Intotech.Common.Bll.Interfaces; 

namespace Intotech.Xerion.Bll.Models.Accounts;
 
 public class AccountRegisterDto : ModelBase
 {
     public string FirstName { get; set; }
     public string LastName { get; set; }
     public string Email { get; set; }
     public string Password { get; set; }
 }
