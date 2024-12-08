using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;

public class CompanyimageModelDto : DtoModelBase
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string Image { get; set; } = null!;

    public int Idcompany { get; set; }
}