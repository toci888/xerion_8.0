using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;

public class JobadvertisementModelDto : DtoModelBase
{
    public string Name { get; set; } = null!;

    public string? Publicid { get; set; }

    public string? Image { get; set; }

    public string Description { get; set; } = null!;

    public int Employmentmethod { get; set; }

    public int Employmenttype { get; set; }

    public DateTime? Expirationdate { get; set; }

    public double? Salarymin { get; set; }

    public double? Salarymax { get; set; }

    public int Companyid { get; set; }

    public int? Quizid { get; set; }
}