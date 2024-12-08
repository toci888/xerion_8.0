using Intotech.Common.Bll.Interfaces; 
namespace Intotech.Xerion.Bll.Models.Accounts;
 
 public class EmailConfirmDto : ModelBase

 {
     public string Email { get; set; }
     public int Code { get; set; }
 }
