using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class Accounts
    {        public int id { get; set; }\n        public string email { get; set; }\n        public string title { get; set; }\n        public string name { get; set; }\n        public string surname { get; set; }\n        public string phoneNumber { get; set; }\n        public string description { get; set; }\n        public string birthDate { get; set; }\n        public string password { get; set; }\n        public int verificationCode { get; set; }\n        public string verificationCodeValid { get; set; }\n        public int idRole { get; set; }\n        public string emailConfirmed { get; set; }\n        public string allowsNotifications { get; set; }\n        public string image { get; set; }\n        public string refreshToken { get; set; }\n        public string refreshTokenValid { get; set; }\n        public string createdAt { get; set; }\n        public string lastModificationDate { get; set; }\n        public string salaryMin { get; set; }\n        public string salaryMax { get; set; }\n        public string location { get; set; }\n        public int employmentMethod { get; set; }\n        public int employmentType { get; set; }\n    }\n}\n
