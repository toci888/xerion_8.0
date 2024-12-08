using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;

public class CompanySocialMediaLinkModelDto : DtoModelBase
{
    public int Id { get; set; }

    public int Idsocialmedialink { get; set; }

    public string Name { get; set; } = null!;

    public string Link { get; set; } = null!;

    public int Idcompany { get; set; }
}