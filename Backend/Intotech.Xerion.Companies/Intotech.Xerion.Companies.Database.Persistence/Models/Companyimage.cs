using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Companies.Database.Persistence.Models;

public partial class Companyimage : ModelBase
{
    // public int Id { get; set; }

    public string? Name { get; set; }

    public string Image { get; set; } = null!;

    public int Idcompany { get; set; }

    public virtual Company IdcompanyNavigation { get; set; } = null!;
}
