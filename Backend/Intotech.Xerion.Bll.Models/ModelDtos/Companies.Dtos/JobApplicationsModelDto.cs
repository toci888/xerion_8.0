using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;

public class JobApplicationsModelDto : DtoModelBase
{
    public int Idaccount { get; set; }

    public string? Name { get; set; }

    public string? Cv { get; set; }

    public int Idjobadvertisements { get; set; }
}