using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Companies.Database.Persistence.Models;

public partial class Companyoffice : ModelBase
{
    // public int Id { get; set; }

    public string? Location { get; set; }

    public string? Iframeurl { get; set; }

    public int Idcompany { get; set; }

    public virtual Company IdcompanyNavigation { get; set; } = null!;
}
