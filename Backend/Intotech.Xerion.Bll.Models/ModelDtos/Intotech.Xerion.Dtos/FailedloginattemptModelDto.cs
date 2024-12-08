using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;

public class FailedloginattemptModelDto : DtoBase<Failedloginattempt, FailedloginattemptModelDto>
{
    public int Id { get; set; }
    public int Idaccount { get; set; }
    public int Kind { get; set; }
    public DateTime Createdat { get; set; }
}
