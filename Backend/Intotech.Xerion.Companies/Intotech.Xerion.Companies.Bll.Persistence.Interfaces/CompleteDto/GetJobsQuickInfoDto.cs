using Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Companies.Bll.Persistence.Interfaces.CompleteDto;

public class GetJobsQuickInfoDto
{
    public JobModelDto Job { get; set; } 
    public Company Company { get; set; } 
    public List<Jobtechnology> JobTechnologies { get; set; }
}