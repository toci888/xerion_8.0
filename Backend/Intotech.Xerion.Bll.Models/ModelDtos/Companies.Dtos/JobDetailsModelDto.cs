using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;

public class JobDetailsModelDto : DtoModelBase
{
    public int Iddetail { get; set; }

    public string Name { get; set; } = null!;

    public int Idjobadvertisements { get; set; }
}