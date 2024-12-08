using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class UserExtraData
    {        public int id { get; set; }\n        public int idAccount { get; set; }\n        public string token { get; set; }\n        public string method { get; set; }\n        public string tokenDataJson { get; set; }\n        public int origin { get; set; }\n        public string createdat { get; set; }\n    }\n}\n
