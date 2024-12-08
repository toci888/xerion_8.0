using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Accountsoftskill : ModelBase
{
    // public int Id { get; set; }

    public int? Idaccountsoftskillstitle { get; set; }

    public string Name { get; set; } = null!;

    public int Idaccount { get; set; }

    public DateTime? Createdat { get; set; }

    public virtual Account IdaccountNavigation { get; set; } = null!;

    public virtual Accountsoftskillstitle? IdaccountsoftskillstitleNavigation { get; set; }
}
