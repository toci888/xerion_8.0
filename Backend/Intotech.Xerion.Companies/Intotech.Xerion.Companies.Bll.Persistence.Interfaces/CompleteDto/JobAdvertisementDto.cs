using Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Companies.Bll.Persistence.Interfaces.CompleteDto;

public class JobAdvertisementDto
{
    public int Id { get; set; }
    public string Name { get; set; } = null!;
    public string? Publicid { get; set; }
    public string? Image { get; set; }
    public string Description { get; set; } = null!;
    public int Employmentmethod { get; set; }
    public int Employmenttype { get; set; }
    public DateTime? Expirationdate { get; set; }
    public double? Salarymin { get; set; }
    public double? Salarymax { get; set; }
    public int? Quizid { get; set; }
    public int Companyid { get; set; }
    public List<Jobtechnology> Jobtechnologies { get; set; }
}