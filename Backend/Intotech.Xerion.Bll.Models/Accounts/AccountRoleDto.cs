using Intotech.Common.Bll.Interfaces; 
using Intotech.Xerion.Database.Persistence.Models;
 
 namespace Intotech.Xerion.Bll.Models.Accounts;
 
 public class AccountRoleDto : Accountrole
 {
     public string AccessToken { get; set; }
 }
