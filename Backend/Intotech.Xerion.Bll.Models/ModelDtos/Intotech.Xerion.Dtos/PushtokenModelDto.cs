using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;

public class PushtokenModelDto : DtoBase<Pushtoken, PushtokenModelDto>
{
    public int Id { get; set; }
    public int Idaccount { get; set; }
    public string Token { get; set; }
    public DateTime Createdat { get; set; }
}
