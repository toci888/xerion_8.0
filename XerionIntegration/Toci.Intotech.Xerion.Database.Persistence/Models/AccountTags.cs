using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class AccountTags
    {        public int id { get; set; }\n        public string info { get; set; }\n        public int idTag { get; set; }\n        public int idAccount { get; set; }\n        public string createdAt { get; set; }\n    }\n}\n
