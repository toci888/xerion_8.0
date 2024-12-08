using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;

public class AccounttechnicalskillModelDto : DtoAccountModelBase
{
    public int Type { get; set; }

    public string Name { get; set; } = null!;

    public double? Progress { get; set; }

    public int Idaccount { get; set; }
}