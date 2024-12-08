using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class AccountCoursesCertificates
    {        public int id { get; set; }\n        public int idCertificate { get; set; }\n        public string certificateNumber { get; set; }\n        public int idAccount { get; set; }\n        public int idOrganizationIssuingCertificate { get; set; }\n        public string certificateIssueDate { get; set; }\n        public string expirationDate { get; set; }\n        public string certificateName { get; set; }\n        public string OrganizationIssuingCertificate { get; set; }\n        public string createdAt { get; set; }\n    }\n}\n
