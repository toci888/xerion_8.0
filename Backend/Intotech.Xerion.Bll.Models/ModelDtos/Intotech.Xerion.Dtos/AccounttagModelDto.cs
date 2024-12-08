using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;

public class AccounttagModelDto : DtoAccountModelBase
{
    public string? Info { get; set; }

    public int? Idtag { get; set; }

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