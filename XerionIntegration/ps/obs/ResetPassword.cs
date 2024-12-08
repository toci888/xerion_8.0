using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class ResetPassword
    {        public int id { get; set; }\n        public string email { get; set; }\n        public int verificationCode { get; set; }\n        public string createdAt { get; set; }\n    }\n}\n
