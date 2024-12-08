using Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Companies.Bll.Persistence.Interfaces.CompleteDto;

public class JobCompleteDto
{
    public JobModelDto Job { get; set; } 
    public List<JobTechnologiesModelDto> JobTechnologies { get; set; }
    public List<JobDetailsModelDto> JobDetails { get; set; }
}