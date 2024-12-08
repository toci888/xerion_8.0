using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Companies.Database.Persistence.Models;

public partial class Jobtechnology : ModelBase
{
    // public int Id { get; set; }

    public int Idtechnology { get; set; }

    public string Icon { get; set; } = null!;

    public string? Description { get; set; }

    public int Idjobadvertisements { get; set; }

    public virtual Jobadvertisement IdjobadvertisementsNavigation { get; set; } = null!;
}
