using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Companies.Database.Persistence.Models;

public partial class Jobapplication : ModelBase
{
    // public int Id { get; set; }

    public int Idaccount { get; set; }

    public string? Name { get; set; }

    public string? Cv { get; set; }

    public int Idjobadvertisements { get; set; }

    public virtual Jobadvertisement IdjobadvertisementsNavigation { get; set; } = null!;
}
