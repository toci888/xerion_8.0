using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;

public class UserextradatumModelDto : DtoModelBase
{
    public int Id { get; set; }
    public int Idaccount { get; set; }
    public string Token { get; set; }
    public string Method { get; set; }
    public string Tokendatajson { get; set; }
    public int Origin { get; set; }
    public DateTime Createdat { get; set; }
}
