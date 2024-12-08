using System;
using System.Collections.Generic;
using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Accounttechnicalskill : ModelBase
{
    //public int Id { get; set; }

    public int Type { get; set; }

    public string Name { get; set; } = null!;

    public double? Progress { get; set; }

    public int Idaccount { get; set; }

    public virtual Account IdaccountNavigation { get; set; } = null!;
}
