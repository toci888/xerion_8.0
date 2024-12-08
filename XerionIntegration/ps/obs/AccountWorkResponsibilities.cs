using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class AccountWorkResponsibilities
    {        public int id { get; set; }\n        public string name { get; set; }\n        public int idAccount { get; set; }\n        public int idAccountWorkExperience { get; set; }\n        public string createdAt { get; set; }\n    }\n}\n
