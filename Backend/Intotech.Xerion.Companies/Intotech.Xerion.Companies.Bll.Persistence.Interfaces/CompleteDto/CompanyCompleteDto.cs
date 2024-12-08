using Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Companies.Bll.Persistence.Interfaces.CompleteDto;

public class CompanyCompleteDto
{
    public CompanyModelDto Company { get; set; } 
    public List<CompanySocialMediaLinkModelDto> CompanySocialMediaLinks { get; set; }
    public List<CompanyimageModelDto> CompanyImages { get; set; }
    public List<CompanyofficeModelDto> CompanyOffices { get; set; }
    public List<CompanytechnologyModelDto> CompanyTechnologies { get; set; }
}