using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class FailedLoginAttempts
    {        public int id { get; set; }\n        public int idAccount { get; set; }\n        public int kind { get; set; }\n        public string createdat { get; set; }\n    }\n}\n
