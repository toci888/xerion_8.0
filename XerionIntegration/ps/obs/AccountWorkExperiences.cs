using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class AccountWorkExperiences
    {        public int id { get; set; }\n        public int idProfession { get; set; }\n        public int idWorkCompany { get; set; }\n        public int idAccount { get; set; }\n        public string dateStart { get; set; }\n        public string dateEnd { get; set; }\n        public string workCompany { get; set; }\n        public string profession { get; set; }\n        public string createdAt { get; set; }\n    }\n}\n
