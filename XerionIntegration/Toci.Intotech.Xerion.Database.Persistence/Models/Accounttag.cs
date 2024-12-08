using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Accounttag : ModelBase
{
    // public int Id { get; set; }

    public string? Info { get; set; }

    public int? Idtag { get; set; }

    public int Idaccount { get; set; }

    public DateTime? Createdat { get; set; }

    public virtual Account IdaccountNavigation { get; set; } = null!;
}
