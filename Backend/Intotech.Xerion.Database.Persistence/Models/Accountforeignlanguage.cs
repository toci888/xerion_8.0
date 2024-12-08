using System;
using System.Collections.Generic;
using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Accountforeignlanguage : ModelBase
{
    // public int Id { get; set; }

    public int Idforeignlanguage { get; set; }

    public int Idaccount { get; set; }

    public int Level { get; set; }

    public DateTime? Createdat { get; set; }

    public virtual Account IdaccountNavigation { get; set; } = null!;
}
