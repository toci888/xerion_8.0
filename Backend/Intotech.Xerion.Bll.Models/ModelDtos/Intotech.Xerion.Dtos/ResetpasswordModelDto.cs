using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;

public class ResetpasswordModelDto : DtoModelBase
{
    public int Id { get; set; }
    public string Email { get; set; }
    public int Verificationcode { get; set; }
    public DateTime Createdat { get; set; }
}
