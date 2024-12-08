using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;

public class CompanyofficeModelDto : DtoModelBase
{
    public int Id { get; set; }

    public string? Location { get; set; }

    public string? Iframeurl { get; set; }

    public int Idcompany { get; set; }
}