using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;

public class CompanytechnologyModelDto : DtoModelBase
{
    public int Id { get; set; }

    public int Idtechnology { get; set; }

    public string Name { get; set; } = null!;

    public int Idcompany { get; set; }
}