﻿using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Accountrole : ModelBase
{
    public int? Id { get; set; }

    public string? Name { get; set; }

    public string? Surname { get; set; }

    public string? Email { get; set; }

    public string? Password { get; set; }

    public bool? Emailconfirmed { get; set; }

    public string? Refreshtoken { get; set; }

    public string? Rolename { get; set; }

    public DateTime? Refreshtokenvalid { get; set; }

    public bool? Allowsnotifications { get; set; }
}
