using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class AccountEducations
    {        public int id { get; set; }\n        public int idProfession { get; set; }\n        public int idUniversityName { get; set; }\n        public int idProfessionalTitle { get; set; }\n        public int idAccount { get; set; }\n        public string dateStart { get; set; }\n        public string dateEnd { get; set; }\n        public string professionName { get; set; }\n        public string universityName { get; set; }\n        public string professionalTitle { get; set; }\n        public string createdAt { get; set; }\n    }\n}\n
