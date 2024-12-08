using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Accountcoursescertificate : ModelBase
{
    //// public int Id { get; set; }

    public int Idcertificate { get; set; }

    public string Certificatenumber { get; set; } = null!;

    public int Idaccount { get; set; }

    public int Idorganizationissuingcertificate { get; set; }

    public DateTime Certificateissuedate { get; set; }

    public DateTime? Expirationdate { get; set; }

    public string Certificatename { get; set; } = null!;

    public string Organizationissuingcertificate { get; set; } = null!;

    public DateTime? Createdat { get; set; }

    public virtual Account IdaccountNavigation { get; set; } = null!;
}
