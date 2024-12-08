using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Accountworkresponsibility : ModelBase
{
    // public int Id { get; set; }

    public string? Name { get; set; }

    public int Idaccount { get; set; }

    public int Idaccountworkexperience { get; set; }

    public DateTime? Createdat { get; set; }

    public virtual Account IdaccountNavigation { get; set; } = null!;

    public virtual Accountworkexperience IdaccountworkexperienceNavigation { get; set; } = null!;
}
