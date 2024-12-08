using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Accounteducation : ModelBase
{
    // public int Id { get; set; }

    public int Idprofession { get; set; }

    public int Iduniversityname { get; set; }

    public int Idprofessionaltitle { get; set; }

    public int Idaccount { get; set; }

    public DateTime Datestart { get; set; }

    public DateTime? Dateend { get; set; }

    public string Professionname { get; set; } = null!;

    public string Universityname { get; set; } = null!;

    public string Professionaltitle { get; set; } = null!;

    public DateTime? Createdat { get; set; }

    public virtual Account IdaccountNavigation { get; set; } = null!;
}
