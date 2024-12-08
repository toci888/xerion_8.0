using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Resetpassword : ModelBase
{
    // public int Id { get; set; }

    public string Email { get; set; } = null!;

    public int Verificationcode { get; set; }

    public DateTime? Createdat { get; set; }
}
