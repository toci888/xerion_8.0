using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class AccountForeignLanguages
    {        public int id { get; set; }\n        public int idForeignLanguage { get; set; }\n        public int idAccount { get; set; }\n        public int level { get; set; }\n        public string createdAt { get; set; }\n    }\n}\n
