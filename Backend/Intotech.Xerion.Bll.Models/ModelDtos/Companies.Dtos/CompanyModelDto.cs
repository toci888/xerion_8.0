using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;

public class CompanyModelDto : DtoModelBase
{
    public string? Logo { get; set; }

    public string Nip { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string? Headquarteraddress { get; set; }

    public string? Description { get; set; }

    public int? Employeecount { get; set; }

    public int Idaccount { get; set; }

    public DateTime? Companyestablishment
    {
        get => _companyestablishment;
        set
        {
            if (DateTime.TryParse(value?.ToString(), out DateTime parsedDate))
            {
                _companyestablishment = parsedDate;
            }
            else
            {
                _companyestablishment = null;
            }
        }
    }
    private DateTime? _companyestablishment;
}