using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Companies.Database.Persistence.Models;

public partial class Jobdetail : ModelBase
{
    // public int Id { get; set; }

    public int Iddetail { get; set; }

    public string Name { get; set; } = null!;

    public int Idjobadvertisements { get; set; }

    public virtual Jobadvertisement IdjobadvertisementsNavigation { get; set; } = null!;
}
