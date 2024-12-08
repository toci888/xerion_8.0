using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class AccountSoftSkills
    {        public int id { get; set; }\n        public int idAccountSoftSkillsTitle { get; set; }\n        public string name { get; set; }\n        public int idAccount { get; set; }\n        public string createdAt { get; set; }\n    }\n}\n
