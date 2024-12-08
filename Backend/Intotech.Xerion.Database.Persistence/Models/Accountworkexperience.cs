using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Accountworkexperience : ModelBase
{
    // public int Id { get; set; }

    public int Idprofession { get; set; }

    public int Idworkcompany { get; set; }

    public int Idaccount { get; set; }

    public DateTime Datestart { get; set; }

    public DateTime? Dateend { get; set; }

    public string Workcompany { get; set; } = null!;

    public string? Profession { get; set; }

    public DateTime? Createdat { get; set; }

    public virtual ICollection<Accountworkresponsibility> Accountworkresponsibilities { get; } = new List<Accountworkresponsibility>();

    public virtual Account IdaccountNavigation { get; set; } = null!;
}
