using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Failedloginattempt : ModelBase
{
    // public int Id { get; set; }

    public int Idaccount { get; set; }

    public int Kind { get; set; }

    public DateTime? Createdat { get; set; }

    public virtual Account IdaccountNavigation { get; set; } = null!;
}
