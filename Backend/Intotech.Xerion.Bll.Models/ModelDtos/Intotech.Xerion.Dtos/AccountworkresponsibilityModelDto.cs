using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;

public class AccountworkresponsibilityModelDto : DtoAccountModelBase
{
    public string Name { get; set; }
    public int Idaccountworkexperience { get; set; }
    public DateTime Createdat
    {
        get => _createdat;
        set
        {
            if (DateTime.TryParse(value.ToString(), out DateTime parsedDate))
            {
                _createdat = parsedDate;
            }
            else
            {
                // Możesz rzucić wyjątek lub podjąć inne odpowiednie działania
            }
        }
    }
    private DateTime _createdat;

}
