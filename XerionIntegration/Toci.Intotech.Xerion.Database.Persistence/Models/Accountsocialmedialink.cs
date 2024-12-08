using System;
using System.Collections.Generic;
using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Accountsocialmedialink : ModelBase
{
    // public int Id { get; set; }

    public int Idsocialmedialink { get; set; }

    public string Name { get; set; } = null!;

    public string Link { get; set; } = null!;

    public int Idaccount { get; set; }

    public virtual Account IdaccountNavigation { get; set; } = null!;
}
