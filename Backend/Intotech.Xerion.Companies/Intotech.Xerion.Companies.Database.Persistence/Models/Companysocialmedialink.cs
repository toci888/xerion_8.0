using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Companies.Database.Persistence.Models;

public partial class Companysocialmedialink : ModelBase
{
    // public int Id { get; set; }

    public int Idsocialmedialink { get; set; }

    public string Name { get; set; } = null!;

    public string Link { get; set; } = null!;

    public int Idcompany { get; set; }

    public virtual Company IdcompanyNavigation { get; set; } = null!;
}
