using Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Companies.Bll.Persistence.Interfaces.CompleteDto;

public class GetJobCompleteDto
{
    public JobModelDto Job { get; set; } 
    public List<Jobtechnology> JobTechnologies { get; set; }
    public List<Jobdetail> JobDetails { get; set; }
}