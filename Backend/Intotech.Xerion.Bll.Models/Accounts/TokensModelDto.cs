using Intotech.Common.Bll.Interfaces; 
namespace Intotech.Xerion.Bll.Models.Accounts;
 
 public class TokensModelDto : ModelBase

 {
     public string RefreshToken { get; set; }
     public string AccessToken { get; set; }
 }
