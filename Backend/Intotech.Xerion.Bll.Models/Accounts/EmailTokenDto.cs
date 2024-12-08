using Intotech.Common.Bll.Interfaces; 
namespace Intotech.Xerion.Bll.Models.Accounts;
 
 public class EmailTokenDto : ModelBase

 {
     public string email { get; set; }
     public string token { get; set; }
 }
