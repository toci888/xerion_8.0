using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class AccountTechnicalSkills
    {        public int id { get; set; }\n        public int type { get; set; }\n        public string name { get; set; }\n        public string progress { get; set; }\n        public int idAccount { get; set; }\n    }\n}\n
