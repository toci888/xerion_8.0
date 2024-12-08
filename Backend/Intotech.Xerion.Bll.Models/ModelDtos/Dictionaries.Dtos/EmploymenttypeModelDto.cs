using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Xerion.Database.Persistence.Models;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dictionaries.Dtos;

public class EmploymenttypeModelDto : DtoBase<Employmenttype, EmploymenttypeModelDto>
{
    public int Id { get; set; }
    public string Name { get; set; }
}
