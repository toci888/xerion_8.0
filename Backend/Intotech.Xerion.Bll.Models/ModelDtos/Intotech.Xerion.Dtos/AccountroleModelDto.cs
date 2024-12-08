﻿using Intotech.Common.Bll.ChorDtoBll.Dto;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;

public class AccountroleModelDto : DtoBase<Accountrole, AccountroleModelDto>
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Surname { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
    public Boolean Emailconfirmed { get; set; }
    public string Refreshtoken { get; set; }
    public string Rolename { get; set; }
    public DateTime Refreshtokenvalid { get; set; }
    public Boolean Allowsnotifications { get; set; }
}
