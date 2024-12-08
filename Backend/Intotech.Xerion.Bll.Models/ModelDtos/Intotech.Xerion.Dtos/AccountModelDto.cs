using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;

public class AccountModelDto : DtoModelBase
{
    public int Id { get; set; }

    public string Email { get; set; } = null!;

    public string? Title { get; set; }

    public string? Name { get; set; }

    public string? Surname { get; set; }

    public string? Phonenumber { get; set; }

    public string? Description { get; set; }

    public DateTime? Birthdate
    {
        get => _birthdate;
        set
        {
            if (DateTime.TryParse(value?.ToString(), out DateTime parsedDate))
            {
                _birthdate = parsedDate;
            }
            else
            {
                _birthdate = null;
            }
        }
    }
    private DateTime? _birthdate;


    //public string Password { get; set; } = null!;

    public int? Verificationcode { get; set; }

    public DateTime? Verificationcodevalid
    {
        get => _verificationcodevalid;
        set
        {
            if (DateTime.TryParse(value?.ToString(), out DateTime parsedDate))
            {
                _verificationcodevalid = parsedDate;
            }
            else
            {
                _verificationcodevalid = null;
            }
        }
    }
    private DateTime? _verificationcodevalid;


    public int? Idrole { get; set; }

    public bool? Emailconfirmed { get; set; }

    public bool? Allowsnotifications { get; set; }

    public string? Image { get; set; }

    public string? Refreshtoken { get; set; }

    public DateTime? Refreshtokenvalid
    {
        get => _refreshtokenvalid;
        set
        {
            if (DateTime.TryParse(value?.ToString(), out DateTime parsedDate))
            {
                _refreshtokenvalid = parsedDate;
            }
            else
            {
                _refreshtokenvalid = null;
            }
        }
    }
    private DateTime? _refreshtokenvalid;

    public DateTime? Createdat
    {
        get => _createdat;
        set
        {
            if (DateTime.TryParse(value?.ToString(), out DateTime parsedDate))
            {
                _createdat = parsedDate;
            }
            else
            {
                _createdat = null;
            }
        }
    }
    private DateTime? _createdat;

    public DateTime? Lastmodificationdate
    {
        get => _lastmodificationdate;
        set
        {
            if (DateTime.TryParse(value?.ToString(), out DateTime parsedDate))
            {
                _lastmodificationdate = parsedDate;
            }
            else
            {
                _lastmodificationdate = null;
            }
        }
    }
    private DateTime? _lastmodificationdate;


    public double? Salarymin { get; set; }

    public double? Salarymax { get; set; }

    public string? Location { get; set; }

    public int? Employmentmethod { get; set; }

    public int? Employmenttype { get; set; }
}
