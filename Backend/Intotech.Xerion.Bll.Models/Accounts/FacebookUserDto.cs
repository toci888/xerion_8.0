using Intotech.Common.Bll.Interfaces; 
namespace Intotech.Xerion.Bll.Models.Accounts;
 
 public class FacebookUserDto : ModelBase

 {
     public string id { get; set; }
     public string name { get; set; }
     public string email { get; set; }
     public Picture picture { get; set; }
     public string Json { get; set; }
 }
 
 public class Picture
 {
     public Data data { get; set; }
 }
 
 public class Data
 {
     public int height { get; set; }
     public bool is_silhouette { get; set; }
     public string url { get; set; }
     public int width { get; set; }
 }
