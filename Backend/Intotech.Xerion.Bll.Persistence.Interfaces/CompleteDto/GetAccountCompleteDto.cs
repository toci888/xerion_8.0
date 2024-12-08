using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Persistence.Interfaces.CompleteDto;

public class GetAccountCompleteDto
{
    public Account Account { get; set; } 
    public List<Accountcoursescertificate> AccountCoursesCertificates { get; set; }
    public List<Accountsoftskill> AccountSoftSkills { get; set; }
    public List<Accountworkexperience> AccountWorkExperiences { get; set; }
    public List<Accounttag> AccountTags { get; set; }
    public List<Accounttechnicalskill> AccountTechnicalSkills { get; set; }
    public List<Accountworkresponsibility> AccountWorkResponsibilities { get; set; }
    public List<Accountsocialmedialink> AccountSocialMediaLinks { get; set; }
    public List<Accounteducation> accountEducationModelDto { get; set; }
}