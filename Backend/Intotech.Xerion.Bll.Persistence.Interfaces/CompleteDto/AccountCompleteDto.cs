using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Persistence.Interfaces.CompleteDto;

public class AccountCompleteDto
{
    public AccountModelDto Account { get; set; } 
    public List<AccountcoursescertificateModelDto> AccountCoursesCertificates { get; set; }
    public List<AccountsoftskillModelDto> AccountSoftSkills { get; set; }
    public List<AccountworkexperienceModelDto> AccountWorkExperiences { get; set; }
    public List<AccounttagModelDto> AccountTags { get; set; }
    public List<AccounttechnicalskillModelDto> AccountTechnicalSkills { get; set; }
    public List<AccountworkresponsibilityModelDto> AccountWorkResponsibilities { get; set; }
    public List<AccountsocialmedialinkModelDto> AccountSocialMediaLinks { get; set; }
    public List<AccounteducationModelDto> AccountEducationModelDto { get; set; }
}