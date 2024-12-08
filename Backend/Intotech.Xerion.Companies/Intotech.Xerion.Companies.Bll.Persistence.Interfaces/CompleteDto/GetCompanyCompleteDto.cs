using Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Companies.Bll.Persistence.Interfaces.CompleteDto;

public class GetCompanyCompleteDto
{
    public CompanyModelDto Company { get; set; } 
    public List<Companysocialmedialink> CompanySocialMediaLinks { get; set; }
    public List<Companyimage> CompanyImages { get; set; }
    public List<Companyoffice> CompanyOffices { get; set; }
    public List<Companytechnology> CompanyTechnologies { get; set; }
}