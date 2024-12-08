using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;

public class AccountsocialmedialinkModelDto : DtoAccountModelBase
{

    public int? Idsocialmedialink { get; set; }

    public string Name { get; set; } = null!;

    public string? Link { get; set; }
}
