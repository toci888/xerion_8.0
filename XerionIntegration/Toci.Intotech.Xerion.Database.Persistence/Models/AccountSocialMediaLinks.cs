using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class AccountSocialMediaLinks
    {        public int id { get; set; }\n        public int idSocialMediaLink { get; set; }\n        public string name { get; set; }\n        public string link { get; set; }\n        public int idAccount { get; set; }\n    }\n}\n
