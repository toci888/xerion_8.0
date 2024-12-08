using System;
using System.Collections.Generic;
using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Dictionaries.Database.Persistence.Models;

public partial class Skillsdomain : ModelBase
{
    public int Id { get; set; }

    public int? Idparent { get; set; }

    public string Domain { get; set; } = null!;

    public int? Isfinal { get; set; }

    public virtual Skillsdomain? IdparentNavigation { get; set; }

    public virtual ICollection<Skillsdomain> InverseIdparentNavigation { get; } = new List<Skillsdomain>();
}