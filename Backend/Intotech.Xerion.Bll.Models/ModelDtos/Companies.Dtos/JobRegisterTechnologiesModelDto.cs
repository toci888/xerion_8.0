using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;

public class JobRegisterTechnologiesModelDto : DtoModelBase
{
    public int Idtechnology { get; set; }
    public string Icon { get; set; } = null!;
    public string Description { get; set; } = null!;
}