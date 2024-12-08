using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Accountsoftskillstitle : ModelBase
{
    // public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Icon { get; set; }

    public DateTime? Createdat { get; set; }

    public virtual ICollection<Accountsoftskill> Accountsoftskills { get; } = new List<Accountsoftskill>();
}
