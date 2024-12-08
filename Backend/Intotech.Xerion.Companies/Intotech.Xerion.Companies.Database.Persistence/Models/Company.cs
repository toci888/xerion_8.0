using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Companies.Database.Persistence.Models;

public partial class Company : ModelBase
{
    // public int Id { get; set; }

    public string? Logo { get; set; }

    public string Nip { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string? Headquarteraddress { get; set; }

    public string? Description { get; set; }

    public int? Employeecount { get; set; }

    public int Idaccount { get; set; }

    public DateTime? Companyestablishment { get; set; }

    public virtual ICollection<Companyimage> Companyimages { get; } = new List<Companyimage>();

    public virtual ICollection<Companyoffice> Companyoffices { get; } = new List<Companyoffice>();

    public virtual ICollection<Companysocialmedialink> Companysocialmedialinks { get; } = new List<Companysocialmedialink>();

    public virtual ICollection<Companytechnology> Companytechnologies { get; } = new List<Companytechnology>();

    public virtual ICollection<Jobadvertisement> Jobadvertisements { get; } = new List<Jobadvertisement>();
}
