using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;

public class AccountcoursescertificateModelDto : DtoAccountModelBase
{
    public int Idcertificate { get; set; }
    public string Certificatenumber { get; set; }
    public int Idorganizationissuingcertificate { get; set; }
    public DateTime Certificateissuedate
    {
        get => _certificateissuedate;
        set
        {
            if (DateTime.TryParse(value.ToString(), out DateTime parsedDate))
            {
                _certificateissuedate = parsedDate;
            }
            else
            {
                // Możesz rzucić wyjątek lub podjąć inne odpowiednie działania
            }
        }
    }
    private DateTime _certificateissuedate;

    public DateTime Expirationdate
    {
        get => _expirationdate;
        set
        {
            if (DateTime.TryParse(value.ToString(), out DateTime parsedDate))
            {
                _expirationdate = parsedDate;
            }
            else
            {
                // Możesz rzucić wyjątek lub podjąć inne odpowiednie działania
            }
        }
    }
    private DateTime _expirationdate;

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

    public string Certificatename { get; set; }
    public string Organizationissuingcertificate { get; set; }
}
