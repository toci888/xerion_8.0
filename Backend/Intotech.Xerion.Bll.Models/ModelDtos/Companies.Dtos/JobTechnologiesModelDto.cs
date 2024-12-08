using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;

public class JobTechnologiesModelDto : DtoModelBase
{
    public int Idtechnology { get; set; }

    public string Description { get; set; } = null!;

    public string Icon { get; set; } = null!;

    public int Idjobadvertisements { get; set; }
}