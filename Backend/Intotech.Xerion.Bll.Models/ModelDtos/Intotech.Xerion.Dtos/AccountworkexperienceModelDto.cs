using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;

public class AccountworkexperienceModelDto : DtoAccountModelBase
{
    public int Idprofession { get; set; }

    public int Idworkcompany { get; set; }

    public DateTime Datestart
    {
        get => _datestart;
        set
        {
            if (DateTime.TryParse(value.ToString(), out DateTime parsedDate))
            {
                _datestart = parsedDate;
            }
            else
            {
                // Możesz rzucić wyjątek lub podjąć inne odpowiednie działania
            }
        }
    }
    private DateTime _datestart;


    public DateTime? Dateend
    {
        get => _dateend;
        set
        {
            if (value.HasValue && DateTime.TryParse(value.ToString(), out DateTime parsedDate))
            {
                _dateend = parsedDate;
            }
            else
            {
                // Możesz rzucić wyjątek lub podjąć inne odpowiednie działania
            }
        }
    }
    private DateTime? _dateend;


    public string Workcompany { get; set; } = null!;

    public string? Profession { get; set; }

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


    public List<AccountworkresponsibilityModelDto> Accountworkresponsibilities { get; set; }
}
